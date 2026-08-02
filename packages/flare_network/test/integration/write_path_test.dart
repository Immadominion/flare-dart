@Tags(['integration'])
library;

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// Live tests for building, pricing and diagnosing a transaction.
///
/// This package cannot sign, so nothing here broadcasts anything. Everything up
/// to the signature is testable for free, and that is the part the SDK owns.
///
/// The revert tests use `eth_call` **state overrides** — a third parameter that
/// substitutes bytecode at an address for the duration of one simulated call.
/// Coston2 supports it, so a contract that reverts exactly the way we want can
/// be conjured for a single call: no deployment, no funded key, no gas.
///
/// Run with: `dart test -P integration`
void main() {
  late FlareClient client;

  setUpAll(() => client = FlareClient(FlareChain.coston2));
  tearDownAll(() => client.close());

  /// Simulates a call against [bytecode] injected at a scratch address.
  Future<Object?> callOverridden(String bytecode) {
    const scratch = '0x00000000000000000000000000000000000000ff';
    return client.rpc.call('eth_call', [
      {'to': scratch, 'data': '0x'},
      'latest',
      {
        scratch: {'code': bytecode},
      },
    ]);
  }

  group('fee suggestion', () {
    test('suggests fees consistent with the live fee market', () async {
      final fees = await client.suggestFees();

      // Measured floor across 8,192 blocks on both networks: 500 gwei.
      expect(fees.baseFeePerGas, greaterThanOrEqualTo(BigInt.from(5e11)));
      expect(fees.maxPriorityFeePerGas, greaterThan(BigInt.zero));
      // A cap at or below the base fee can never be mined.
      expect(fees.maxFeePerGas, greaterThan(fees.baseFeePerGas));
      expect(
        fees.maxFeePerGas,
        greaterThanOrEqualTo(fees.baseFeePerGas + fees.maxPriorityFeePerGas),
      );
    });

    test('the base fee agrees with the latest block', () async {
      final fees = await client.suggestFees();
      final block = await client.getLatestBlock();
      // Same source, one batched round-trip apart.
      expect(fees.baseFeePerGas, block!.baseFeePerGas);
    });

    test('the multiplier scales the cap without touching the tip', () async {
      final tight = await client.suggestFees(baseFeeMultiplier: 1);
      final loose = await client.suggestFees(baseFeeMultiplier: 3);

      expect(loose.maxFeePerGas, greaterThan(tight.maxFeePerGas));
      expect(
        tight.maxFeePerGas,
        tight.baseFeePerGas + tight.maxPriorityFeePerGas,
      );
    });

    test('a fractional multiplier stays exact in wei', () async {
      final fees = await client.suggestFees(baseFeeMultiplier: 1.5);
      // Integer arithmetic throughout: a double would lose precision above 2^53
      // and the node compares fees exactly.
      expect(
        fees.maxFeePerGas,
        (fees.baseFeePerGas * BigInt.from(3)) ~/ BigInt.two +
            fees.maxPriorityFeePerGas,
      );
    });

    test('an explicit priority fee overrides the node suggestion', () async {
      final tip = BigInt.from(7);
      final fees = await client.suggestFees(priorityFee: tip);
      expect(fees.maxPriorityFeePerGas, tip);
    });

    test('a multiplier below 1 is rejected', () async {
      expect(
        () => client.suggestFees(baseFeeMultiplier: 0.9),
        throwsA(isA<ArgumentError>()),
      );
    });
  });

  group('preparing a transaction', () {
    test('fills gas, fees and chain id for a real contract call', () async {
      final wnat = await ContractRegistry(client).addressOf(FlareContract.wNat);
      final abi = ContractAbi.fromJson([
        {
          'type': 'function',
          'name': 'name',
          'inputs': [],
          'outputs': [
            {'name': '', 'type': 'string'},
          ],
          'stateMutability': 'view',
        },
      ]);

      final prepared = await client.prepareTransaction(
        TransactionRequest.callFunction(
          to: wnat,
          function: abi.function('name'),
        ),
      );

      expect(prepared.chainId, 114);
      expect(prepared.gas, greaterThan(BigInt.zero));
      expect(prepared.maxFeePerGas, greaterThan(BigInt.zero));
      expect(prepared.maxPriorityFeePerGas, greaterThan(BigInt.zero));
      expect(prepared.isReady, isTrue);
      // Unprepared fields are left alone, so the nonce is still the wallet's.
      expect(prepared.nonce, isNull);
    });

    test('the gas limit exceeds the bare estimate', () async {
      final wnat = await ContractRegistry(client).addressOf(FlareContract.wNat);
      final request = TransactionRequest(
        to: wnat,
        data: hexToBytes('0x06fdde03'), // name()
      );

      final estimate = await client.estimateGas(request.toCallRequest());
      final prepared = await client.prepareTransaction(request);

      // The node adds no buffer of its own — a plain transfer estimates at
      // exactly 21000 — so all the headroom is ours.
      expect(prepared.gas, greaterThan(estimate));
      expect(
        prepared.gas! - estimate,
        greaterThanOrEqualTo(BigInt.from(75000)),
      );
    });

    test('values already set are not overwritten', () async {
      final wnat = await ContractRegistry(client).addressOf(FlareContract.wNat);
      final prepared = await client.prepareTransaction(
        TransactionRequest(
          to: wnat,
          data: hexToBytes('0x06fdde03'),
          gas: BigInt.from(123456),
          maxPriorityFeePerGas: BigInt.from(42),
        ),
      );

      expect(prepared.gas, BigInt.from(123456));
      expect(prepared.maxPriorityFeePerGas, BigInt.from(42));
      expect(prepared.maxFeePerGas, isNotNull);
    });

    test(
      'a call that would revert fails before a user is asked to sign',
      () async {
        final wnat = await ContractRegistry(
          client,
        ).addressOf(FlareContract.wNat);
        // transferFrom with no balance and no allowance.
        final data = hexToBytes(
          '0x23b872dd'
          '0000000000000000000000001000000000000000000000000000000000000001'
          '0000000000000000000000001000000000000000000000000000000000000002'
          '00000000000000000000000000000000000000000000003635c9adc5dea00000',
        );

        await expectLater(
          client.prepareTransaction(TransactionRequest(to: wnat, data: data)),
          throwsA(isA<FlareRpcException>()),
        );
      },
    );

    test('a prepared request is accepted by assertSendable', () async {
      final wnat = await ContractRegistry(client).addressOf(FlareContract.wNat);
      final prepared = await client.prepareTransaction(
        TransactionRequest.callFunction(
          to: wnat,
          function: ContractAbi.fromJson([
            {
              'type': 'function',
              'name': 'name',
              'inputs': [],
              'outputs': [
                {'name': '', 'type': 'string'},
              ],
              'stateMutability': 'view',
            },
          ]).function('name'),
          from: EthAddress.parse('0x1000000000000000000000000000000000000001'),
        ),
      );
      expect(prepared.assertSendable, returnsNormally);
    });
  });

  group('simulation', () {
    test('simulate returns the same bytes as a direct call', () async {
      final wnat = await ContractRegistry(client).addressOf(FlareContract.wNat);
      final request = TransactionRequest(
        to: wnat,
        data: hexToBytes('0x06fdde03'), // name()
        from: EthAddress.parse('0x1000000000000000000000000000000000000001'),
      );

      final viaSimulate = await client.simulate(request);
      final viaCall = await client.ethCall(
        to: wnat,
        data: hexToBytes('0x06fdde03'),
      );
      expect(viaSimulate, viaCall);
      expect(viaSimulate, isNotEmpty);
    });
  });

  group('revert decoding, live', () {
    test('Error(string) from a real contract', () async {
      final wnat = await ContractRegistry(client).addressOf(FlareContract.wNat);
      final data = hexToBytes(
        '0x23b872dd'
        '0000000000000000000000001000000000000000000000000000000000000001'
        '0000000000000000000000001000000000000000000000000000000000000002'
        '00000000000000000000000000000000000000000000003635c9adc5dea00000',
      );

      try {
        await client.ethCall(to: wnat, data: data);
        fail('expected a revert');
      } on FlareRpcException catch (e) {
        final reason = e.revertReason;
        expect(reason, isA<RevertWithMessage>());
        expect((reason! as RevertWithMessage).message, contains('ERC20'));
      }
    });

    test('Panic(uint256) is decoded and named', () async {
      // Injected bytecode: store the Panic selector and code 0x12, then revert
      // with the 36-byte payload.
      try {
        await callOverridden('0x634e487b7160e01b600052601260045260246000fd');
        fail('expected a revert');
      } on FlareRpcException catch (e) {
        final reason = e.revertReason;
        expect(reason, isA<RevertWithPanic>());
        expect((reason! as RevertWithPanic).code, BigInt.from(0x12));
        expect(reason.description, contains('Division or modulo by zero'));
      }
    });

    test('a custom error carries no message, only a selector', () async {
      // This is why the decoder exists. `AgentNotWhitelisted()` is one of the
      // 168 custom errors declared across Flare's published ABIs; the node's
      // own message for it is the bare string "execution reverted".
      final declared = AbiError(name: 'AgentNotWhitelisted', inputs: []);

      try {
        await callOverridden('0x63a0479f7860e01b60005260046000fd');
        fail('expected a revert');
      } on FlareRpcException catch (e) {
        expect(e.message.trim(), 'execution reverted');
        expect(e.revertReason, isA<RevertWithUnknownSelector>());
        expect(
          e.revertReasonWith([declared])?.description,
          'AgentNotWhitelisted',
        );
      }
    });

    test('a custom error with arguments decodes them', () async {
      final declared = AbiError(
        name: 'InsufficientFundsForRedeem',
        inputs: [
          AbiParameter(name: 'required', type: AbiType.parse('uint256')),
        ],
      );
      expect(declared.selectorHex, '0x8f513882');

      try {
        await callOverridden('0x638f51388260e01b600052602a60045260246000fd');
        fail('expected a revert');
      } on FlareRpcException catch (e) {
        final reason = e.revertReasonWith([declared]);
        expect(reason, isA<RevertWithCustomError>());
        expect(
          (reason! as RevertWithCustomError).arguments.single,
          BigInt.from(42),
        );
        expect(reason.description, 'InsufficientFundsForRedeem(42)');
      }
    });

    test('an empty revert arrives as -32000 with no data at all', () async {
      // Flare does not send `data: "0x"` the way geth does; the field is
      // simply absent, and the code is -32000 rather than 3. Anything that
      // branched on `code == 3` would miss this entirely.
      try {
        await callOverridden('0x60006000fd');
        fail('expected a revert');
      } on FlareRpcException catch (e) {
        expect(e.code, -32000);
        expect(e.data, isNull);
        expect(e.revertReason, isNull);
      }
    });
  });

  group('broadcast', () {
    test(
      'eth_sendRawTransaction is available and rejects malformed bytes',
      () async {
        // Deliberately not a real transaction. A node without the method answers
        // -32601; this one decodes the payload and complains about its length,
        // which proves the method exists without broadcasting anything.
        try {
          await client.sendRawTransaction(hexToBytes('0x00'));
          fail('expected a rejection');
        } on FlareRpcException catch (e) {
          expect(e.code, isNot(-32601));
          expect(e.message.toLowerCase(), contains('transaction'));
        }
      },
    );

    test('empty bytes are refused before any request is made', () async {
      expect(
        () => client.sendRawTransaction(hexToBytes('0x')),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
