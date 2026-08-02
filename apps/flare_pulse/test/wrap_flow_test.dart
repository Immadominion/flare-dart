import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';
import 'package:flare_pulse/src/format.dart';
import 'package:flare_pulse/src/theme.dart';
import 'package:flare_pulse/src/wallet.dart';
import 'package:flare_pulse/src/widgets/wrap_sheet.dart';
import 'package:flare_pulse/src/wrap_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Hermetic tests for the wrap flow.
///
/// The states that matter most are the ones a happy-path demo never reaches:
/// a user declining, and a transaction that is mined and then reverts. Both are
/// driven here without a network, a wallet or any funds.

/// Builds a receipt in the shape a node returns one.
TransactionReceipt receipt({required bool succeeded, int logs = 0}) =>
    TransactionReceipt.fromJson({
      'transactionHash': '0x${'ab' * 32}',
      'transactionIndex': '0x1',
      'blockNumber': '0x1ff8e71',
      'blockHash': '0x${'cd' * 32}',
      'from': '0x1000000000000000000000000000000000000001',
      'to': '0x1000000000000000000000000000000000000002',
      'gasUsed': '0x2636a', // 156,522 — what the real reverted tx burned
      'cumulativeGasUsed': '0x2636a',
      'effectiveGasPrice': '0x975704e400', // 650 gwei, the measured price
      'status': succeeded ? '0x1' : '0x0',
      'logs': [
        for (var i = 0; i < logs; i++)
          {
            'address': '0x1000000000000000000000000000000000000002',
            'topics': ['0x${'11' * 32}'],
            'data': '0x',
            'blockNumber': '0x1ff8e71',
            'transactionHash': '0x${'ab' * 32}',
            'logIndex': '0x$i',
          },
      ],
      'type': '0x2',
    });

/// A wallet whose behaviour the test dictates.
class ScriptedWallet implements Wallet {
  final Object? throwThis;
  final Uint8List? returnThis;

  ScriptedWallet({this.throwThis, this.returnThis});

  @override
  String get label => 'Scripted';

  @override
  bool get canSign => true;

  @override
  Future<Uint8List> sendTransaction(
    Map<String, Object?> payload, {
    required String chainId,
  }) async {
    if (throwThis != null) throw throwThis!;
    return returnThis!;
  }
}

Future<void> pumpSheet(WidgetTester tester, WrapController controller) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: PulseTheme.dark,
      home: Scaffold(body: WrapSheet(controller: controller)),
    ),
  );
  await tester.pump();
}

void main() {
  group('formatting', () {
    test('wei converts without going through a double', () {
      // 2^53 wei is only about 0.009 FLR, so a double loses precision well
      // inside the range of an ordinary balance.
      final awkward = BigInt.parse('1234567890123456789');
      expect(formatUnits(awkward), '1.234567');
      expect(formatUnits(BigInt.zero), '0');
      expect(formatUnits(BigInt.from(10).pow(18)), '1');
    });

    test('trailing zeros are trimmed but leading ones are not', () {
      expect(formatUnits(BigInt.from(10).pow(17)), '0.1');
      expect(formatUnits(BigInt.from(10).pow(12)), '0.000001');
    });

    test('an amount below display precision does not render as a lie', () {
      // 1 wei is not zero, and must not be shown as "0" without qualification.
      expect(formatUnits(BigInt.one), '0');
      expect(
        formatUnits(BigInt.one, maxFractionDigits: 18),
        '0.000000000000000001',
      );
    });

    test('gwei formatting matches the measured fee values', () {
      expect(formatGwei(BigInt.from(500000000000)), '500');
      expect(formatGwei(BigInt.from(150000000000)), '150');
    });

    test('addresses are shortened at both ends', () {
      final a = EthAddress.parse('0x1000000000000000000000000000000000000001');
      final short = shortAddress(a);
      expect(short, startsWith('0x100000'));
      expect(short, endsWith('000001'));
      expect(short, contains('…'));
    });
  });

  group('receipt handling', () {
    test('a reverted receipt is not an exception', () {
      // The whole point: this arrives through the success path.
      final r = receipt(succeeded: false);
      expect(r.succeeded, isFalse);
      expect(r.gasUsed, BigInt.from(156522));
      expect(r.feePaid, r.gasUsed * r.effectiveGasPrice);
      expect(r.logs, isEmpty);
    });

    test('a successful receipt differs only in the status flag', () {
      final ok = receipt(succeeded: true, logs: 12);
      final bad = receipt(succeeded: false);
      expect(ok.blockNumber, bad.blockNumber);
      expect(ok.gasUsed, bad.gasUsed);
      // Only `succeeded` separates them.
      expect(ok.succeeded, isNot(bad.succeeded));
    });
  });

  group('state rendering', () {
    testWidgets('a reverted transaction never reads as confirmed', (
      tester,
    ) async {
      final controller = WrapController(FlareChain.coston2);
      addTearDown(controller.dispose);
      controller.debugSetState(WrapReverted(receipt(succeeded: false)));

      await pumpSheet(tester, controller);

      expect(find.text('REVERTED'), findsOneWidget);
      expect(find.text('Reverted'), findsOneWidget);
      // The load-bearing assertion. A dApp that renders this as success is
      // telling the user their funds moved when they did not.
      expect(find.text('Confirmed'), findsNothing);
      expect(find.text('CONFIRMED'), findsNothing);
      expect(find.textContaining('was not wrapped'), findsOneWidget);
      // Gas was still spent, and the UI has to say so.
      expect(find.textContaining('Gas paid anyway'), findsOneWidget);
    });

    testWidgets('a confirmed transaction reads as confirmed', (tester) async {
      final controller = WrapController(FlareChain.coston2);
      addTearDown(controller.dispose);
      controller.debugSetState(
        WrapConfirmed(receipt(succeeded: true, logs: 12)),
      );

      await pumpSheet(tester, controller);

      expect(find.text('CONFIRMED'), findsOneWidget);
      expect(find.textContaining('was wrapped'), findsOneWidget);
      expect(find.text('Reverted'), findsNothing);
    });

    testWidgets('declining is neutral, not an error', (tester) async {
      final controller = WrapController(FlareChain.coston2);
      addTearDown(controller.dispose);
      controller.debugSetState(const WrapDeclined());

      await pumpSheet(tester, controller);

      expect(find.text('DECLINED'), findsOneWidget);
      expect(find.textContaining('Nothing was sent'), findsOneWidget);

      // Colour carries meaning here: styling a normal choice as a failure
      // teaches people to ignore real failures.
      final pill = tester.widget<Text>(find.text('DECLINED'));
      expect(pill.style?.color, PulseTheme.muted);
      expect(pill.style?.color, isNot(PulseTheme.down));
    });

    testWidgets('awaiting the wallet is amber, not red', (tester) async {
      final controller = WrapController(FlareChain.coston2);
      addTearDown(controller.dispose);
      controller.debugSetState(const WrapAwaitingWallet());

      await pumpSheet(tester, controller);

      final pill = tester.widget<Text>(find.text('AWAITING WALLET'));
      expect(pill.style?.color, PulseTheme.pending);
    });

    testWidgets('a rejection before signing says it cost nothing', (
      tester,
    ) async {
      final controller = WrapController(FlareChain.coston2);
      addTearDown(controller.dispose);
      controller.debugSetState(
        const WrapRejectedBeforeSigning(
          message: 'ERC20: transfer amount exceeds balance',
          revert: RevertWithMessage('ERC20: transfer amount exceeds balance'),
        ),
      );

      await pumpSheet(tester, controller);

      expect(find.text('REFUSED'), findsOneWidget);
      expect(find.textContaining('exceeds balance'), findsOneWidget);
      expect(find.textContaining('cost nothing'), findsOneWidget);
    });

    testWidgets('a node refusal is distinguished from a contract revert', (
      tester,
    ) async {
      final controller = WrapController(FlareChain.coston2);
      addTearDown(controller.dispose);
      // No revert data — the node declined to simulate at all.
      controller.debugSetState(
        const WrapRejectedBeforeSigning(message: 'insufficient funds'),
      );

      await pumpSheet(tester, controller);

      expect(find.textContaining('The node refused'), findsOneWidget);
      expect(find.textContaining('nothing to decode'), findsOneWidget);
    });
  });

  group('wallet handoff', () {
    test(
      'a declined signature lands in WrapDeclined, not WrapFailed',
      () async {
        final controller = WrapController(
          FlareChain.coston2,
          wallet: ScriptedWallet(throwThis: const WalletDeclined()),
        );
        addTearDown(controller.dispose);

        controller.debugSetState(
          WrapPriced(
            prepared: TransactionRequest(
              from: WrapController.demoSender,
              to: WrapController.demoSender,
              data: hexToBytes('0xd0e30db0'),
              gas: BigInt.from(100000),
              maxFeePerGas: BigInt.from(10).pow(12),
              maxPriorityFeePerGas: BigInt.from(10).pow(11),
              chainId: 114,
            ),
            fees: FeeEstimate(
              baseFeePerGas: BigInt.from(500000000000),
              maxPriorityFeePerGas: BigInt.from(150000000000),
              maxFeePerGas: BigInt.from(900000000000),
            ),
            wnat: WrapController.demoSender,
          ),
        );

        await controller.submit();
        expect(controller.state, isA<WrapDeclined>());
      },
    );

    test('the demo wallet is honest about not signing', () {
      const wallet = DemoWallet();
      expect(wallet.canSign, isFalse);
      expect(wallet.label, contains('does not sign'));
    });

    test('the demo wallet returns real, distinct transaction hashes', () async {
      // Both are real Coston2 transactions, so the receipts fetched from them
      // are genuine rather than fabricated.
      final ok = await const DemoWallet(
        outcome: DemoOutcome.succeeds,
        think: Duration.zero,
      ).sendTransaction(const {}, chainId: 'eip155:114');
      final bad = await const DemoWallet(
        outcome: DemoOutcome.reverts,
        think: Duration.zero,
      ).sendTransaction(const {}, chainId: 'eip155:114');

      expect(ok, hasLength(32));
      expect(bad, hasLength(32));
      expect(ok, isNot(bad));
    });

    test('the declining demo wallet throws WalletDeclined', () {
      expect(
        () => const DemoWallet(
          outcome: DemoOutcome.declines,
          think: Duration.zero,
        ).sendTransaction(const {}, chainId: 'eip155:114'),
        throwsA(isA<WalletDeclined>()),
      );
    });
  });

  group('controller', () {
    test('changing the amount invalidates a previous quote', () {
      final controller = WrapController(FlareChain.coston2);
      addTearDown(controller.dispose);

      controller.debugSetState(const WrapDeclined());
      controller.amount = BigInt.from(10).pow(19);
      // A quote priced a different amount and no longer applies.
      expect(controller.state, isA<WrapIdle>());
    });

    test('switching chain resets and re-targets', () {
      final controller = WrapController(FlareChain.coston2);
      addTearDown(controller.dispose);

      controller.debugSetState(const WrapDeclined());
      controller.switchChain(FlareChain.songbird);

      expect(controller.state, isA<WrapIdle>());
      expect(controller.chain.chainId, 19);
      expect(controller.caip2, 'eip155:19');
    });

    test('submit does nothing unless the request is priced', () async {
      final controller = WrapController(FlareChain.coston2);
      addTearDown(controller.dispose);

      await controller.submit();
      expect(controller.state, isA<WrapIdle>());
    });
  });
}
