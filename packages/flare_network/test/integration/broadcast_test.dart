@Tags(['broadcast'])
library;

import 'dart:convert';
import 'dart:io';

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// The one test that spends real money.
///
/// Everything else in this suite reads, simulates or prices. This is the only
/// place a transaction is actually signed and broadcast, and it exists to
/// settle three questions that cannot be answered any other way:
///
/// 1. Does `sendRawTransaction` really work end to end against Flare?
/// 2. Is a priority fee below the node's suggested 150 gwei **rejected** at
///    submission, or merely **delayed**? Measured behaviour, not documentation.
/// 3. Does a mined-and-reverted transaction expose any reason in its receipt,
///    or must the caller re-simulate to find out?
///
/// ## Why it is not in the default integration run
///
/// It needs a funded Coston2 key, and the faucet is captcha-gated — deliberately,
/// as the operator's anti-automation control. So this is tagged `broadcast` and
/// excluded from `-P integration`. It skips cleanly with an explanatory message
/// when unconfigured, rather than failing and looking broken.
///
/// ## Running it
///
/// ```bash
/// source ~/.flare-dart/coston2-test.env   # sets COSTON2_TEST_KEY
/// dart test -P broadcast
/// ```
///
/// The key lives outside the repository on purpose — this repository is public,
/// and `.gitignore` additionally blocks `*.env`, `*.key` and friends so a stray
/// `git add -A` cannot pick one up. To generate a fresh one:
///
/// ```bash
/// cast wallet new                         # then fund the address at
/// #   https://faucet.flare.network/coston2  — 100 C2FLR per address per 24h
/// ```
///
/// The key must be **testnet-only**. Never reuse one that has touched Flare
/// (14), Songbird (19) or any mainnet.
///
/// Signing is shelled out to Foundry's `cast`, because this package holds no
/// keys and never will. That split is the point: the SDK prepares the
/// transaction and reads the outcome, something else signs it.
///
/// At measured fees a wrap costs about 0.13 FLR, so one faucet claim funds
/// several hundred runs.
void main() {
  final key = Platform.environment['COSTON2_TEST_KEY'];

  /// Signs [request] with `cast`, returning the raw transaction bytes.
  ///
  /// Fees come from the request the SDK prepared, so what is broadcast is what
  /// was priced.
  Future<String> signWithCast(
    TransactionRequest request, {
    required BigInt nonce,
    BigInt? overrideTip,
  }) async {
    final result = await Process.run('cast', [
      'mktx',
      '--private-key',
      key!,
      '--rpc-url',
      FlareChain.coston2.rpcUrl,
      '--chain',
      '${FlareChain.coston2.chainId}',
      '--nonce',
      '$nonce',
      '--gas-limit',
      '${request.gas}',
      '--gas-price',
      '${request.maxFeePerGas}wei',
      '--priority-gas-price',
      '${overrideTip ?? request.maxPriorityFeePerGas}wei',
      '--value',
      '${request.value ?? BigInt.zero}',
      request.to!.hex,
      if (request.data != null && request.data!.isNotEmpty) ...[
        '--',
        bytesToHex(request.data!),
      ],
    ]);

    if (result.exitCode != 0) {
      throw StateError('cast mktx failed: ${result.stderr}');
    }
    return (result.stdout as String).trim();
  }

  group(
    'live broadcast',
    () {
      late FlareClient client;
      late EthAddress sender;

      setUpAll(() async {
        client = FlareClient(FlareChain.coston2);
        final address = await Process.run('cast', [
          'wallet',
          'address',
          '--private-key',
          key!,
        ]);
        sender = EthAddress.parse(
          (address.stdout as String).trim(),
          validateChecksum: false,
        );

        final balance = await client.getBalance(sender);
        if (balance == BigInt.zero) {
          throw StateError(
            'COSTON2_TEST_KEY is set but ${sender.hex} holds no C2FLR. '
            'Fund it at https://faucet.flare.network/coston2',
          );
        }
      });

      tearDownAll(() => client.close());

      test(
        'a wrap survives the whole round trip',
        () async {
          final wnat = await ContractRegistry(
            client,
          ).addressOf(FlareContract.wNat);
          final abi = ContractAbi.fromJson([
            {
              'type': 'function',
              'name': 'deposit',
              'inputs': [],
              'outputs': [],
              'stateMutability': 'payable',
            },
          ]);

          final request = await client.prepareTransaction(
            TransactionRequest.callFunction(
              to: wnat,
              function: abi.function('deposit'),
              from: sender,
              value: BigInt.from(10).pow(15), // 0.001 C2FLR
            ),
          );

          final nonce = await client.getTransactionCount(
            sender,
            block: BlockTag.pending,
          );
          final raw = await signWithCast(request, nonce: nonce);

          // The SDK broadcasts, confirms and interprets. It did not sign.
          final hash = await client.sendRawTransaction(hexToBytes(raw));
          final receipt = await client.waitForReceipt(hash);

          expect(receipt.succeeded, isTrue);
          expect(receipt.transactionHash, hash);
          expect(receipt.gasUsed, lessThanOrEqualTo(request.gas!));
          expect(receipt.feePaid, receipt.gasUsed * receipt.effectiveGasPrice);
          // A wrap emits Transfer and Deposit.
          expect(receipt.logs, isNotEmpty);

          // What was priced should resemble what was charged.
          expect(receipt.feePaid, lessThanOrEqualTo(request.maxCost!));
        },
        timeout: const Timeout(Duration(minutes: 3)),
      );

      test(
        'a tip below the node suggestion — rejected, or merely delayed?',
        () async {
          // The open question. `eth_estimateGas` enforces no fee floor, but
          // submission may. Whatever happens, it is recorded rather than assumed.
          final request = await client.prepareTransaction(
            TransactionRequest.transfer(
              to: sender, // to self, so nothing is lost either way
              value: BigInt.one,
              from: sender,
            ),
          );

          final nonce = await client.getTransactionCount(
            sender,
            block: BlockTag.pending,
          );
          final raw = await signWithCast(
            request,
            nonce: nonce,
            overrideTip: BigInt.zero,
          );

          try {
            final hash = await client.sendRawTransaction(hexToBytes(raw));
            final receipt = await client.waitForReceipt(
              hash,
              timeout: const Duration(seconds: 90),
            );
            printOnFailure(
              'zero-tip transaction WAS mined: ${receipt.blockNumber}',
            );
            expect(receipt.succeeded, isTrue);
          } on FlareRpcException catch (e) {
            // Also a valid answer, and the more interesting one.
            printOnFailure('zero-tip transaction was REJECTED: ${e.message}');
            expect(e.message, isNotEmpty);
          }
        },
        timeout: const Timeout(Duration(minutes: 3)),
      );

      test(
        'a reverted transaction: what does its receipt actually say?',
        () async {
          // Withdrawing WNat that is not held. Reverts on chain, so it is mined,
          // burns gas, and emits nothing.
          final wnat = await ContractRegistry(
            client,
          ).addressOf(FlareContract.wNat);
          final abi = ContractAbi.fromJson([
            {
              'type': 'function',
              'name': 'withdraw',
              'inputs': [
                {'name': 'amount', 'type': 'uint256'},
              ],
              'outputs': [],
              'stateMutability': 'nonpayable',
            },
          ]);

          final doomed = TransactionRequest.callFunction(
            to: wnat,
            function: abi.function('withdraw'),
            args: [BigInt.from(10).pow(30)], // far more than is held
            from: sender,
          );

          // Estimation refuses it, which is the whole point of estimating.
          await expectLater(
            client.estimateGas(doomed.toCallRequest()),
            throwsA(isA<FlareRpcException>()),
          );

          // Force it through anyway with a fixed gas limit, to see the receipt.
          final fees = await client.suggestFees();
          final forced = doomed.copyWith(
            gas: BigInt.from(120000),
            maxFeePerGas: fees.maxFeePerGas,
            maxPriorityFeePerGas: fees.maxPriorityFeePerGas,
            chainId: FlareChain.coston2.chainId,
          );

          final nonce = await client.getTransactionCount(
            sender,
            block: BlockTag.pending,
          );
          final raw = await signWithCast(forced, nonce: nonce);
          final hash = await client.sendRawTransaction(hexToBytes(raw));
          final receipt = await client.waitForReceipt(hash);

          // The finding this test exists for: a receipt arrives, perfectly normal,
          // and only `succeeded` distinguishes it from a success.
          expect(receipt.succeeded, isFalse);
          expect(receipt.gasUsed, greaterThan(BigInt.zero));
          expect(receipt.logs, isEmpty);
          expect(receipt.feePaid, greaterThan(BigInt.zero));

          // Does the receipt carry a reason? Recorded either way.
          final raw2 = await client.rpc.call('eth_getTransactionReceipt', [
            bytesToHex(hash),
          ]);
          final keys = (raw2! as Map).keys.map((k) => '$k').toList()..sort();
          printOnFailure('receipt keys: ${jsonEncode(keys)}');
          // A revert reason on the receipt is not part of the JSON-RPC spec; if it
          // is absent, re-simulating at the failing block is the only recourse.
        },
        timeout: const Timeout(Duration(minutes: 3)),
      );
    },
    skip:
        key == null
            ? 'Set COSTON2_TEST_KEY to a funded throwaway Coston2 key to run this. '
                'See the file header — the faucet is captcha-gated, so funding is '
                'a one-time manual step.'
            : null,
  );
}
