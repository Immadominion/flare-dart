import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// The shape handed to a wallet, and the arithmetic behind what it displays.
///
/// Flare's node rejects non-minimal hex outright — a padded `0x0000` comes back
/// as `-32602 cannot unmarshal hex number with leading zero digits` — so the
/// encoding assertions here are not stylistic.
void main() {
  final alice = EthAddress.parse('0x1000000000000000000000000000000000000001');
  final bob = EthAddress.parse('0x1000000000000000000000000000000000000002');

  group('wallet payload', () {
    test('emits minimal hex quantities', () {
      final json =
          TransactionRequest(
            from: alice,
            to: bob,
            value: BigInt.zero,
            gas: BigInt.from(21000),
          ).toWalletJson();

      expect(json['value'], '0x0'); // not 0x00, not 0x
      expect(json['gas'], '0x5208');
      expect(json['from'], alice.hex);
      expect(json['to'], bob.hex);
    });

    test('omits fields that were never set', () {
      final json = TransactionRequest(to: bob).toWalletJson();
      expect(json.keys, ['to']);
      // A null would be rejected by strict wallets, and a zero is not the same
      // as an absent field.
      expect(json.containsKey('value'), isFalse);
      expect(json.containsKey('gas'), isFalse);
    });

    test('uses `data`, never the `input` alias', () {
      // MetaMask's parameter whitelist has no `input` key, so an `input`
      // payload is dropped and the user approves a bare value transfer.
      final json =
          TransactionRequest(
            to: bob,
            data: hexToBytes('0xdeadbeef'),
          ).toWalletJson();
      expect(json['data'], '0xdeadbeef');
      expect(json.containsKey('input'), isFalse);
    });

    test('never emits gasPrice or type', () {
      // The node rejects a mixed fee model outright: supplying gasPrice
      // alongside maxFeePerGas fails with -32000. Making it unrepresentable
      // beats validating it.
      final json =
          TransactionRequest(
            to: bob,
            maxFeePerGas: BigInt.from(1),
            maxPriorityFeePerGas: BigInt.from(1),
          ).toWalletJson();
      expect(json.containsKey('gasPrice'), isFalse);
      expect(json.containsKey('type'), isFalse);
    });

    test('nonce and chainId are opt-in', () {
      final request = TransactionRequest(
        to: bob,
        nonce: BigInt.from(7),
        chainId: 114,
      );

      expect(request.toWalletJson().containsKey('nonce'), isFalse);
      expect(request.toWalletJson().containsKey('chainId'), isFalse);

      expect(request.toWalletJson(includeNonce: true)['nonce'], '0x7');
      expect(request.toWalletJson(includeChainId: true)['chainId'], '0x72');
    });

    test('a deployment omits `to` entirely', () {
      final json =
          TransactionRequest.deploy(
            bytecode: hexToBytes('0x6080'),
            from: alice,
          ).toWalletJson();

      // Present-but-empty reads as a transfer to the zero address, which burns
      // the value.
      expect(json.containsKey('to'), isFalse);
      expect(json['data'], '0x6080');
    });

    test('empty calldata is omitted rather than sent as 0x', () {
      final json =
          TransactionRequest(to: bob, data: Uint8List(0)).toWalletJson();
      expect(json.containsKey('data'), isFalse);
    });
  });

  group('construction', () {
    final deposit = ContractAbi.fromJson([
      {
        'type': 'function',
        'name': 'deposit',
        'inputs': [],
        'outputs': [],
        'stateMutability': 'payable',
      },
      {
        'type': 'function',
        'name': 'transfer',
        'inputs': [
          {'name': 'to', 'type': 'address'},
          {'name': 'amount', 'type': 'uint256'},
        ],
        'outputs': [
          {'name': '', 'type': 'bool'},
        ],
        'stateMutability': 'nonpayable',
      },
    ]);

    test('callFunction encodes the selector and arguments', () {
      final request = TransactionRequest.callFunction(
        to: bob,
        function: deposit.function('transfer'),
        args: [alice, BigInt.from(5)],
        from: alice,
      );

      // cast sig "transfer(address,uint256)" -> 0xa9059cbb
      expect(bytesToHex(request.data!).startsWith('0xa9059cbb'), isTrue);
      expect(request.data, hasLength(4 + 64));
    });

    test('a wrong argument count fails at build time, not as a revert', () {
      expect(
        () => TransactionRequest.callFunction(
          to: bob,
          function: deposit.function('transfer'),
          args: [alice],
        ),
        throwsA(isA<FlareAbiException>()),
      );
    });

    test('transfer carries value and no calldata', () {
      final request = TransactionRequest.transfer(
        to: bob,
        value: BigInt.from(10).pow(18),
      );
      expect(request.data, isNull);
      expect(request.value, BigInt.from(10).pow(18));
    });
  });

  group('simulation request', () {
    test('keeps from and value, drops fees and nonce', () {
      // Dropping `from` silently changes what is simulated for any call gated
      // on msg.sender; dropping `value` breaks every payable call. Fees are
      // dropped on purpose — a cap makes estimation fail for an account that
      // cannot cover it.
      final call =
          TransactionRequest(
            from: alice,
            to: bob,
            value: BigInt.from(99),
            data: hexToBytes('0xabcdef01'),
            nonce: BigInt.from(3),
            maxFeePerGas: BigInt.from(10).pow(12),
            maxPriorityFeePerGas: BigInt.from(10).pow(11),
          ).toCallRequest().toJson();

      expect(call['from'], alice.hex);
      expect(call['value'], '0x63');
      expect(call['data'], '0xabcdef01');
      expect(call.containsKey('nonce'), isFalse);
      expect(call.containsKey('maxFeePerGas'), isFalse);
      expect(call.containsKey('maxPriorityFeePerGas'), isFalse);
    });
  });

  group('assertSendable', () {
    final ready = TransactionRequest(
      from: alice,
      to: bob,
      gas: BigInt.from(21000),
      maxFeePerGas: BigInt.from(10).pow(12),
      maxPriorityFeePerGas: BigInt.from(10).pow(11),
      chainId: 114,
    );

    test('passes a complete request', () {
      expect(ready.assertSendable, returnsNormally);
      expect(ready.isReady, isTrue);
    });

    test('names the missing field', () {
      expect(
        () => TransactionRequest(to: bob).assertSendable(),
        throwsA(
          isA<FlareContractException>().having(
            (e) => e.message,
            'message',
            contains('`from`'),
          ),
        ),
      );
    });

    test('rejects a tip above the fee cap', () {
      expect(
        () =>
            ready
                .copyWith(maxPriorityFeePerGas: BigInt.from(10).pow(18))
                .assertSendable(),
        throwsA(
          isA<FlareContractException>().having(
            (e) => e.message,
            'message',
            contains('exceeds maxFeePerGas'),
          ),
        ),
      );
    });

    test('a deployment needs no `to`', () {
      expect(
        () =>
            TransactionRequest.deploy(bytecode: hexToBytes('0x60'), from: alice)
                .copyWith(
                  gas: BigInt.from(1),
                  maxFeePerGas: BigInt.two,
                  maxPriorityFeePerGas: BigInt.one,
                  chainId: 114,
                )
                .assertSendable(),
        returnsNormally,
      );
    });
  });

  group('cost arithmetic', () {
    test('maxCost is gas x cap plus value', () {
      final request = TransactionRequest(
        to: bob,
        gas: BigInt.from(21000),
        maxFeePerGas: BigInt.from(750000000000),
        value: BigInt.from(10).pow(18),
      );
      expect(
        request.maxCost,
        BigInt.from(21000) * BigInt.from(750000000000) +
            BigInt.from(10).pow(18),
      );
    });

    test('maxCost is null until the request is priced', () {
      expect(TransactionRequest(to: bob).maxCost, isNull);
    });

    test('FeeEstimate separates the worst case from the likely one', () {
      // Measured Flare values: 500 gwei base, 150 gwei tip.
      final base = BigInt.from(500000000000);
      final tip = BigInt.from(150000000000);
      final fees = FeeEstimate(
        baseFeePerGas: base,
        maxPriorityFeePerGas: tip,
        maxFeePerGas: (base * BigInt.from(3)) ~/ BigInt.two + tip,
      );

      final gas = BigInt.from(21000);
      expect(fees.likelyCostFor(gas), gas * (base + tip));
      expect(fees.maxCostFor(gas), gas * fees.maxFeePerGas);
      // Headroom exists, and the user is charged the lower figure.
      expect(fees.likelyCostFor(gas), lessThan(fees.maxCostFor(gas)));
    });
  });

  group('chain metadata', () {
    test('every network carries its own measured block time', () {
      // Measured over 1,000 consecutive blocks each on 2026-08-02. They differ
      // by 3.7x, so a shared constant is wrong for all four.
      expect(FlareChain.songbird.blockTime.inMilliseconds, 1066);
      expect(FlareChain.flare.blockTime.inMilliseconds, 1161);
      expect(FlareChain.coston2.blockTime.inMilliseconds, 2726);
      expect(FlareChain.coston.blockTime.inMilliseconds, 3995);
    });

    test('caip2 identifiers', () {
      expect(FlareChain.flare.caip2, 'eip155:14');
      expect(FlareChain.coston2.caip2, 'eip155:114');
      expect(FlareChain.songbird.caip2, 'eip155:19');
      expect(FlareChain.coston.caip2, 'eip155:16');
    });

    test('withRpcUrl preserves the block time', () {
      final custom = FlareChain.coston2.withRpcUrl('https://example.invalid');
      expect(custom.blockTime, FlareChain.coston2.blockTime);
    });
  });
}
