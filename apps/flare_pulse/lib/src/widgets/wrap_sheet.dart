import 'dart:convert';

import 'package:flare_network/flare_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../format.dart';
import '../theme.dart';
import '../wallet.dart';
import '../wrap_controller.dart';

/// Wrapping FLR into WNat, from build to receipt.
///
/// The app never signs. A [Wallet] supplies the signature, and the built-in
/// demonstration wallet supplies the hash of a **real historical Coston2
/// transaction** instead — so the receipt, the gas burned and the success flag
/// are all fetched live rather than invented. The sheet says so on screen.
class WrapSheet extends StatefulWidget {
  final WrapController controller;

  const WrapSheet({super.key, required this.controller});

  @override
  State<WrapSheet> createState() => _WrapSheetState();
}

class _WrapSheetState extends State<WrapSheet> {
  static final _presets = <String, BigInt>{
    '1': BigInt.from(10).pow(18),
    '10': BigInt.from(10).pow(19),
    '100': BigInt.from(10).pow(20),
  };

  String _selected = '1';

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: widget.controller,
    builder: (context, _) {
      final c = widget.controller;
      return Container(
        decoration: const BoxDecoration(
          color: PulseTheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Grabber(),
              _Title(state: c.state),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: Text(
                  'Builds a real deposit() against WNat, prices it against the '
                  'live network, and follows it to a receipt.',
                  style: TextStyle(
                    fontSize: 13,
                    color: PulseTheme.muted,
                    height: 1.4,
                  ),
                ),
              ),
              const Divider(height: 1),
              if (c.state is WrapIdle ||
                  c.state is WrapPricing ||
                  c.state is WrapRejectedBeforeSigning) ...[
                _AmountRow(
                  presets: _presets,
                  selected: _selected,
                  symbol: c.chain.nativeSymbol,
                  onSelect: (key) {
                    setState(() => _selected = key);
                    c.amount = _presets[key]!;
                  },
                ),
                _PrimaryButton(
                  label: c.state is WrapPricing
                      ? 'Pricing…'
                      : 'Build and price',
                  onPressed: c.state is WrapPricing ? null : c.price,
                ),
              ],
              _Body(controller: c),
              const SizedBox(height: 24),
            ],
          ),
        ),
      );
    },
  );
}

class _Grabber extends StatelessWidget {
  const _Grabber();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Center(
      child: Container(
        width: 36,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.16),
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    ),
  );
}

class _Title extends StatelessWidget {
  final WrapState state;

  const _Title({required this.state});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
    child: Row(
      children: [
        const Text(
          'Wrap FLR',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(width: 10),
        _StatePill(state: state),
      ],
    ),
  );
}

/// The status pill, mirroring the header's `_StatusDot` record switch.
class _StatePill extends StatelessWidget {
  final WrapState state;

  const _StatePill({required this.state});

  @override
  Widget build(BuildContext context) {
    final (color, label) = switch (state) {
      WrapIdle() => (PulseTheme.muted, 'READY'),
      WrapPricing() => (PulseTheme.pending, 'PRICING'),
      WrapPriced() => (PulseTheme.up, 'PRICED'),
      WrapRejectedBeforeSigning() => (PulseTheme.down, 'REFUSED'),
      WrapAwaitingWallet() => (PulseTheme.pending, 'AWAITING WALLET'),
      // Declining is normal, so it is never coloured as a failure.
      WrapDeclined() => (PulseTheme.muted, 'DECLINED'),
      WrapPending() => (PulseTheme.pending, 'PENDING'),
      WrapConfirmed() => (PulseTheme.up, 'CONFIRMED'),
      WrapReverted() => (PulseTheme.down, 'REVERTED'),
      WrapFailed() => (PulseTheme.down, 'FAILED'),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: color,
        ),
      ),
    );
  }
}

class _AmountRow extends StatelessWidget {
  final Map<String, BigInt> presets;
  final String selected;
  final String symbol;
  final ValueChanged<String> onSelect;

  const _AmountRow({
    required this.presets,
    required this.selected,
    required this.symbol,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
    child: Row(
      children: [
        for (final key in presets.keys) ...[
          _Chip(
            label: '$key $symbol',
            selected: selected == key,
            onTap: () => onSelect(key),
          ),
          const SizedBox(width: 8),
        ],
      ],
    ),
  );
}

class _Chip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _Chip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected
            ? PulseTheme.flare.withValues(alpha: 0.16)
            : PulseTheme.surfaceHigh,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: selected
              ? PulseTheme.flare
              : Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: Text(
        label,
        style: PulseTheme.tabular.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: selected ? Colors.white : PulseTheme.muted,
        ),
      ),
    ),
  );
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const _PrimaryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
    child: SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: PulseTheme.flare,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
    ),
  );
}

/// Renders whichever state the flow is in.
///
/// Switching over the sealed [WrapState] rather than a set of booleans is what
/// makes it impossible to forget a state — a new variant fails to compile here.
class _Body extends StatelessWidget {
  final WrapController controller;

  const _Body({required this.controller});

  @override
  Widget build(BuildContext context) => switch (controller.state) {
    WrapIdle() || WrapPricing() => const SizedBox.shrink(),
    WrapPriced(:final prepared, :final wnat) => _Priced(
      controller: controller,
      gas: prepared.gas!,
      wnat: wnat,
    ),
    WrapRejectedBeforeSigning(:final message, :final revert) => _Note(
      tone: PulseTheme.down,
      title: revert != null
          ? 'The contract rejected this'
          : 'The node refused this',
      body: message,
      footnote: revert != null
          ? 'Decoded from the revert data the node returned. Caught before '
                'signing, so it cost nothing.'
          : 'No revert data — the node declined to simulate at all, so there '
                'is nothing to decode.',
    ),
    WrapAwaitingWallet() => const _Note(
      tone: PulseTheme.pending,
      title: 'Waiting for the wallet',
      body: 'Approve or reject in your wallet.',
      footnote:
          'On a mobile wallet this can take a while — the app has '
          'handed off and is not stuck.',
    ),
    WrapDeclined() => _Note(
      // Muted, not red. Declining is a choice, not a fault.
      tone: PulseTheme.muted,
      title: 'Declined in the wallet',
      body: 'Nothing was sent and nothing was spent.',
      action: ('Start over', controller.reset),
    ),
    WrapPending(:final hash) => _Note(
      tone: PulseTheme.pending,
      title: 'Waiting for inclusion',
      body: shortHash(bytesToHex(hash)),
      footnote:
          'Polling every ${controller.chain.blockTime.inMilliseconds}ms '
          '— this network\'s measured block time.',
    ),
    WrapConfirmed(:final receipt) => _Outcome(
      controller: controller,
      receipt: receipt,
      succeeded: true,
    ),
    WrapReverted(:final receipt) => _Outcome(
      controller: controller,
      receipt: receipt,
      succeeded: false,
    ),
    WrapFailed(:final message, :final mayStillLand) => _Note(
      tone: PulseTheme.down,
      title: mayStillLand ? 'Not seen yet' : 'Could not complete',
      body: message,
      footnote: mayStillLand
          ? 'A timeout means "not yet", not "failed". It may still be mined.'
          : null,
      action: ('Start over', controller.reset),
    ),
  };
}

class _Priced extends StatelessWidget {
  final WrapController controller;
  final BigInt gas;
  final EthAddress wnat;

  const _Priced({
    required this.controller,
    required this.gas,
    required this.wnat,
  });

  @override
  Widget build(BuildContext context) {
    final c = controller;
    final priced = c.state as WrapPriced;
    final symbol = c.chain.nativeSymbol;
    final payload = const JsonEncoder.withIndent('  ').convert(c.walletPayload);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Column(
            children: [
              _Row(
                label: 'Wrapping',
                value: '${formatUnits(c.amount)} $symbol',
              ),
              _Row(label: 'Gas limit', value: '$gas'),
              _Row(
                label: 'Fee at current base fee',
                value:
                    '${formatUnits(priced.likelyFee, maxFractionDigits: 8)} '
                    '$symbol',
              ),
              // What a wallet shows as "max". Higher than the real charge,
              // because unused fee headroom is refunded.
              _Row(
                label: 'Maximum cost',
                value:
                    '${formatUnits(priced.maxCost, maxFractionDigits: 8)} '
                    '$symbol',
                muted: true,
              ),
              _Row(
                label: 'WNat, resolved at runtime',
                value: shortAddress(wnat),
                muted: true,
              ),
              _Row(label: 'Chain', value: c.caip2, muted: true),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Text(
            'Handed to the wallet, verbatim',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: PulseTheme.ink,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  payload,
                  style: PulseTheme.tabular.copyWith(
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.86),
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () =>
                      Clipboard.setData(ClipboardData(text: payload)),
                  icon: const Icon(Icons.copy, size: 14),
                  label: const Text('Copy', style: TextStyle(fontSize: 12)),
                  style: TextButton.styleFrom(
                    foregroundColor: PulseTheme.muted,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    minimumSize: const Size(0, 32),
                  ),
                ),
              ],
            ),
          ),
        ),
        _PrimaryButton(label: 'Sign in ${c.wallet.label}', onPressed: c.submit),
        if (!c.canSign)
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              'The demo wallet cannot sign. It returns the hash of a real, '
              'historical Coston2 transaction, so the receipt below is fetched '
              'from the live chain — not simulated.',
              style: TextStyle(
                fontSize: 11,
                color: PulseTheme.muted,
                height: 1.5,
              ),
            ),
          ),
      ],
    );
  }
}

/// Confirmed and reverted, rendered from the same receipt.
class _Outcome extends StatelessWidget {
  final WrapController controller;
  final TransactionReceipt receipt;
  final bool succeeded;

  const _Outcome({
    required this.controller,
    required this.receipt,
    required this.succeeded,
  });

  @override
  Widget build(BuildContext context) {
    final tone = succeeded ? PulseTheme.up : PulseTheme.down;
    final symbol = controller.chain.nativeSymbol;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
          child: Row(
            children: [
              Icon(
                succeeded ? Icons.check_circle : Icons.cancel,
                size: 18,
                color: tone,
              ),
              const SizedBox(width: 8),
              Text(
                succeeded ? 'Confirmed' : 'Reverted',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: tone,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          child: Text(
            succeeded
                ? 'Your FLR was wrapped.'
                : 'Your FLR was not wrapped. The transaction was mined and '
                      'then reverted — it still burned gas, and emitted no '
                      'events.',
            style: const TextStyle(
              fontSize: 13,
              color: PulseTheme.muted,
              height: 1.4,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
          child: Column(
            children: [
              _Row(label: 'Block', value: '${receipt.blockNumber}'),
              _Row(label: 'Gas used', value: '${receipt.gasUsed}'),
              _Row(
                label: succeeded ? 'Fee paid' : 'Gas paid anyway',
                value:
                    '${formatUnits(receipt.feePaid, maxFractionDigits: 8)} '
                    '$symbol',
              ),
              _Row(
                label: 'Events emitted',
                value: '${receipt.logs.length}',
                muted: true,
              ),
            ],
          ),
        ),
        if (!succeeded)
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 20, 0),
            child: Text(
              'This receipt arrived exactly like a successful one. Only '
              'receipt.succeeded separates them — anything that treats "the '
              'receipt came back" as success reports this as done.',
              style: TextStyle(
                fontSize: 11,
                color: PulseTheme.muted,
                height: 1.5,
              ),
            ),
          ),
        _PrimaryButton(label: 'Start over', onPressed: controller.reset),
      ],
    );
  }
}

class _Note extends StatelessWidget {
  final Color tone;
  final String title;
  final String body;
  final String? footnote;
  final (String, VoidCallback)? action;

  const _Note({
    required this.tone,
    required this.title,
    required this.body,
    this.footnote,
    this.action,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: tone.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: tone.withValues(alpha: 0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: tone,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                body,
                style: PulseTheme.tabular.copyWith(
                  fontSize: 12,
                  color: PulseTheme.muted,
                  height: 1.4,
                ),
              ),
              if (footnote != null) ...[
                const SizedBox(height: 8),
                Text(
                  footnote!,
                  style: const TextStyle(
                    fontSize: 11,
                    color: PulseTheme.muted,
                    height: 1.4,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      if (action != null)
        _PrimaryButton(label: action!.$1, onPressed: action!.$2),
    ],
  );
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  final bool muted;

  const _Row({required this.label, required this.value, this.muted = false});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, color: PulseTheme.muted),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          value,
          style: PulseTheme.tabular.copyWith(
            fontSize: 12,
            fontWeight: muted ? FontWeight.w400 : FontWeight.w600,
            color: muted ? PulseTheme.muted : Colors.white,
          ),
        ),
      ],
    ),
  );
}
