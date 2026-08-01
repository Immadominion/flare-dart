@Tags(['integration'])
library;

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// Live tests for the read surface a wallet-signing workflow depends on.
///
/// This package cannot sign. The README tells users to connect a wallet over
/// WalletConnect/Reown — and once that wallet returns a transaction hash, these
/// are the calls that make the rest of the flow possible: price the action
/// beforehand, then confirm what actually happened.
///
/// Run with: `dart test -P integration`
void main() {
  late FlareClient client;

  setUpAll(() => client = FlareClient(FlareChain.coston2));
  tearDownAll(() => client.close());

  /// A recent block that actually contains transactions.
  Future<BlockInfo> busyBlock() async {
    var block = await client.getLatestBlock();
    var height = block!.number;
    for (var i = 0; i < 30 && block!.transactionHashes.isEmpty; i++) {
      height -= BigInt.one;
      block = await client.getBlockByNumber(height);
    }
    return block!;
  }

  group('blocks', () {
    test('reads the latest block with EIP-1559 fields', () async {
      final block = await client.getLatestBlock();

      expect(block, isNotNull);
      expect(block!.number, greaterThan(BigInt.zero));
      expect(block.hash, hasLength(32));
      expect(block.parentHash, hasLength(32));
      expect(block.gasLimit, greaterThan(BigInt.zero));
      // Flare is post-London, so a base fee is always present.
      expect(block.baseFeePerGas, isNotNull);
      expect(block.baseFeePerGas, greaterThan(BigInt.zero));
    });

    test('block timestamps are recent and UTC', () async {
      final block = await client.getLatestBlock();
      expect(block!.minedAt.isUtc, isTrue);
      final age = DateTime.now().toUtc().difference(block.minedAt);
      expect(age.inMinutes.abs(), lessThan(10));
    });

    test('a block fetched by hash matches the same block by number', () async {
      final byNumber = await client.getLatestBlock();
      final byHash = await client.getBlockByHash(byNumber!.hash);

      expect(byHash, isNotNull);
      expect(byHash!.number, byNumber.number);
      expect(byHash.hash, byNumber.hash);
    });

    test('a height beyond the head is refused, not silently null', () async {
      // Flare answers `-32000: cannot query unfinalized data` rather than
      // returning null. That is a genuinely different condition from "no such
      // block", so the client surfaces it instead of flattening it.
      final head = await client.getBlockNumber();
      await expectLater(
        client.getBlockByNumber(head + BigInt.from(1000000)),
        throwsA(
          isA<FlareRpcException>().having(
            (e) => e.message,
            'message',
            contains('unfinalized'),
          ),
        ),
      );
    });

    test('parentHash links a block to its predecessor', () async {
      final head = await client.getLatestBlock();
      final parent = await client.getBlockByNumber(head!.number - BigInt.one);
      expect(parent!.hash, head.parentHash);
    });
  });

  group('transactions and receipts', () {
    test('reads a real transaction and its receipt', () async {
      final block = await busyBlock();
      final hash = block.transactionHashes.first;

      final tx = await client.getTransactionByHash(hash);
      expect(tx, isNotNull);
      expect(tx!.hash, hash);
      expect(tx.isPending, isFalse);
      expect(tx.gas, greaterThan(BigInt.zero));

      final receipt = await client.getTransactionReceipt(hash);
      expect(receipt, isNotNull);
      expect(receipt!.transactionHash, hash);
      expect(receipt.blockNumber, block.number);
      expect(receipt.gasUsed, greaterThan(BigInt.zero));
      // Gas used cannot exceed the limit the sender set.
      expect(receipt.gasUsed, lessThanOrEqualTo(tx.gas));
    });

    test('feePaid is gasUsed times the effective price', () async {
      final block = await busyBlock();
      final receipt = await client.getTransactionReceipt(
        block.transactionHashes.first,
      );
      expect(receipt!.feePaid, receipt.gasUsed * receipt.effectiveGasPrice);
    });

    test('an unknown transaction hash yields null, not an error', () async {
      // A wallet may hand back a hash the node has not seen yet; that is a
      // normal pending state, not a failure.
      final unknown = Uint8List.fromList(List.filled(32, 0xAB));
      expect(await client.getTransactionReceipt(unknown), isNull);
      expect(await client.getTransactionByHash(unknown), isNull);
    });

    test(
      'waitForReceipt returns immediately for a mined transaction',
      () async {
        final block = await busyBlock();
        final receipt = await client.waitForReceipt(
          block.transactionHashes.first,
          timeout: const Duration(seconds: 20),
        );
        expect(receipt.transactionHash, block.transactionHashes.first);
      },
    );

    test('waitForReceipt times out rather than hanging forever', () async {
      final unknown = Uint8List.fromList(List.filled(32, 0xCD));
      await expectLater(
        client.waitForReceipt(
          unknown,
          pollInterval: const Duration(milliseconds: 200),
          timeout: const Duration(seconds: 2),
        ),
        throwsA(
          isA<FlareTransportException>().having(
            (e) => e.message,
            'message',
            // A timeout means "not yet", not "failed" — the message has to say
            // so or callers will treat it as a definitive failure.
            contains('still be pending'),
          ),
        ),
      );
    });

    test('receipt logs decode as events', () async {
      final block = await busyBlock();

      for (final hash in block.transactionHashes) {
        final receipt = await client.getTransactionReceipt(hash);
        if (receipt == null || receipt.logs.isEmpty) continue;

        // The whole point of a receipt: what did this transaction emit?
        for (final log in receipt.logs) {
          expect(log.address.isZero, isFalse);
          for (final t in log.topics) {
            expect(t, hasLength(32));
          }
        }
        return;
      }
      markTestSkipped('no logs in the sampled block');
    });
  });

  group('pricing an action before signing', () {
    test('estimateGas prices a real contract call', () async {
      final wnat = await ContractRegistry(client).addressOf(FlareContract.wNat);

      final gas = await client.estimateGas(
        // name() on the WNat ERC-20.
        CallRequest(to: wnat, data: hexToBytes('0x06fdde03')),
      );

      expect(gas, greaterThan(BigInt.from(21000)));
      expect(gas, lessThan(BigInt.from(1000000)));
    });

    test('estimateGas surfaces a call that would revert', () async {
      // Simulated by the node, so a doomed action is discovered before the
      // user is asked to sign and pay for it.
      await expectLater(
        client.estimateGas(
          CallRequest(
            to: await ContractRegistry(client).addressOf(FlareContract.wNat),
            // A selector the contract does not implement.
            data: hexToBytes('0xdeadbeef'),
          ),
        ),
        throwsA(isA<FlareException>()),
      );
    });

    test('getTransactionCount returns a usable nonce', () async {
      final block = await busyBlock();
      final tx = await client.getTransactionByHash(
        block.transactionHashes.first,
      );

      final latest = await client.getTransactionCount(tx!.from);
      final pending = await client.getTransactionCount(
        tx.from,
        block: BlockTag.pending,
      );

      // The next nonce is strictly after the one already used.
      expect(latest, greaterThan(tx.nonce));
      expect(pending, greaterThanOrEqualTo(latest));
    });
  });
}
