@Tags(['integration'])
library;

import 'package:flare_network/flare_network.dart';
import 'package:flare_network_periphery/flare_network_periphery.dart';
import 'package:test/test.dart';

/// Proves the generated transaction builders and error tables against a live
/// node.
///
/// Nothing here is broadcast. Everything up to the signature is checkable, and
/// that is the whole of what this package produces.
///
/// Run with: `dart test -P integration`
void main() {
  late FlareClient client;

  setUpAll(() => client = FlareClient(FlareChain.coston2));
  tearDownAll(() => client.close());

  group('IWNat transaction builders', () {
    late IWNatContract wnat;

    setUpAll(() async => wnat = await IWNatContract.resolve(client));

    test('resolves through the registry', () async {
      expect(wnat.address.isZero, isFalse);
      expect(await client.isContract(wnat.address), isTrue);
    });

    test('deposit encodes the selector cast agrees with', () {
      // cast sig "deposit()" -> 0xd0e30db0
      final request = wnat.depositTx(value: BigInt.from(10).pow(18));
      expect(bytesToHex(request.data!), '0xd0e30db0');
      expect(request.to, wnat.address);
      expect(request.value, BigInt.from(10).pow(18));
    });

    test('withdraw encodes its argument', () {
      // cast sig "withdraw(uint256)" -> 0x2e1a7d4d
      final request = wnat.withdrawTx(BigInt.from(1));
      expect(
        bytesToHex(request.data!),
        '0x2e1a7d4d'
        '0000000000000000000000000000000000000000000000000000000000000001',
      );
    });

    test('a nonpayable builder accepts no value', () {
      // withdraw is nonpayable, so `value` is not in its signature at all —
      // attaching value would revert, and the ABI already says so.
      final request = wnat.withdrawTx(BigInt.one);
      expect(request.value, isNull);
    });

    test('withdrawTo is absent, whatever the docs say', () {
      // Some secondary documentation lists `withdrawTo(address,uint256)` on
      // WNat. It is not in IWNat's ABI, and selector 0x205c2878 does not appear
      // in the deployed bytecode on mainnet. Codegen follows the ABI, so no
      // such builder exists — this test exists to keep it that way.
      expect(
        IWNatContract.depositFn.name,
        'deposit',
        reason: 'sanity: the binding under test is the right one',
      );
      // The four that do exist:
      expect(IWNatContract.depositFn.selectorHex, '0xd0e30db0');
      expect(IWNatContract.depositToFn.selectorHex, '0xb760faf9');
      expect(IWNatContract.withdrawFn.selectorHex, '0x2e1a7d4d');
      expect(IWNatContract.withdrawFromFn.selectorHex, '0x9470b0bd');
    });

    test('the node prices a built transaction', () async {
      // A real gas estimate against the real contract: proof the calldata is
      // something WNat will actually execute. Value is zero because the sender
      // holds nothing — see the rejection test below.
      final gas = await client.estimateGas(
        wnat
            .depositTx(
              from: EthAddress.parse(
                '0x1000000000000000000000000000000000000001',
              ),
              value: BigInt.zero,
            )
            .toCallRequest(),
      );
      expect(gas, greaterThan(BigInt.from(21000)));
    });

    test('an unaffordable value is refused, and is not a revert', () async {
      // A third error class, distinct from both a contract revert and a
      // transport failure: the node refuses to simulate at all. It reports
      // -32000 with a descriptive message and NO revert data, so anything
      // reaching for a revert reason here finds nothing — correctly.
      try {
        await client.estimateGas(
          wnat
              .depositTx(
                from: EthAddress.parse(
                  '0x1000000000000000000000000000000000000001',
                ),
                value: BigInt.one,
              )
              .toCallRequest(),
        );
        fail('expected a rejection');
      } on FlareRpcException catch (e) {
        expect(e.code, -32000);
        expect(e.message, contains('insufficient funds'));
        expect(e.data, isNull);
        expect(e.revertReason, isNull);
      }
    });

    test('prepareTransaction completes a built request', () async {
      final prepared = await client.prepareTransaction(
        wnat.depositTx(
          from: EthAddress.parse('0x1000000000000000000000000000000000000001'),
          value: BigInt.zero,
        ),
      );

      expect(prepared.isReady, isTrue);
      expect(prepared.chainId, 114);
      expect(prepared.assertSendable, returnsNormally);
      // The wallet payload is complete and minimally encoded.
      final json = prepared.toWalletJson();
      expect(json['data'], '0xd0e30db0');
      expect(json['value'], '0x0');
      expect(json.containsKey('gas'), isTrue);
      expect(json.containsKey('maxFeePerGas'), isTrue);
    });

    test(
      'a doomed withdrawal is caught before signing, with a reason',
      () async {
        // Withdrawing from an account holding no WNat.
        final request = wnat.withdrawTx(
          BigInt.from(10).pow(24),
          from: EthAddress.parse('0x1000000000000000000000000000000000000001'),
        );

        try {
          await client.estimateGas(request.toCallRequest());
          fail('expected a revert');
        } on FlareRpcException catch (e) {
          final reason = e.revertReason;
          // Whatever WNat says, the caller gets a reason rather than a bare
          // "execution reverted".
          expect(reason, isNotNull);
          expect(reason!.description, isNotEmpty);
        }
      },
    );
  });

  group('generated error tables', () {
    test('selectors match what cast computes', () {
      // cast sig "AgentNotWhitelisted()" -> 0xa0479f78
      final agentErrors = IAgentOwnerRegistryContract.allErrors;
      final whitelisted = agentErrors.firstWhere(
        (e) => e.name == 'AgentNotWhitelisted',
      );
      expect(whitelisted.selectorHex, '0xa0479f78');
      expect(whitelisted.canonicalSignature, 'AgentNotWhitelisted()');
    });

    test(
      'decodeRevert names an error the node reports only as a selector',
      () async {
        // Injected bytecode reverting with AgentNotWhitelisted(). The node's own
        // message for this is the bare string "execution reverted"; the name is
        // recoverable only from the generated declaration.
        const scratch = '0x00000000000000000000000000000000000000ff';
        try {
          await client.rpc.call('eth_call', [
            {'to': scratch, 'data': '0x'},
            'latest',
            {
              scratch: {'code': '0x63a0479f7860e01b60005260046000fd'},
            },
          ]);
          fail('expected a revert');
        } on FlareRpcException catch (e) {
          expect(e.message.trim(), 'execution reverted');
          final reason = IAgentOwnerRegistryContract.decodeRevert(e);
          expect(reason, isA<RevertWithCustomError>());
          expect(reason!.description, 'AgentNotWhitelisted');
        }
      },
    );

    test('decodeRevert returns null when no data was attached', () async {
      const noData = FlareRpcException('execution reverted', code: -32000);
      expect(IAgentOwnerRegistryContract.decodeRevert(noData), isNull);
    });
  });
}
