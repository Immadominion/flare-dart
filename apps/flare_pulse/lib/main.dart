import 'package:flare_network/flare_network.dart';
import 'package:flutter/material.dart';

import 'src/feed_controller.dart';
import 'src/theme.dart';
import 'src/widgets/feed_tile.dart';

void main() => runApp(const FlarePulseApp());

/// Flare Pulse — live FTSOv2 price feeds, in Flutter.
///
/// The reference app for `flare_network`. It exists to show three things that
/// are hard to believe from a README alone: that Flare's block-latency feeds
/// really do move every couple of seconds, that the contract address is
/// resolved at runtime rather than hardcoded, and that feed decimals genuinely
/// differ per feed.
///
/// No wallet, no account, no funds, no signing — FTSO reads are free.
class FlarePulseApp extends StatelessWidget {
  const FlarePulseApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flare Pulse',
        debugShowCheckedModeBanner: false,
        theme: PulseTheme.dark,
        home: const PulseScreen(),
      );
}

class PulseScreen extends StatefulWidget {
  const PulseScreen({super.key});

  @override
  State<PulseScreen> createState() => _PulseScreenState();
}

class _PulseScreenState extends State<PulseScreen> {
  late final FeedController _controller = FeedController(FlareChain.coston2);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListenableBuilder(
            listenable: _controller,
            builder: (context, _) => Column(
              children: [
                _Header(controller: _controller),
                const Divider(height: 1),
                Expanded(child: _Body(controller: _controller)),
                _Footer(controller: _controller),
              ],
            ),
          ),
        ),
      );
}

class _Header extends StatelessWidget {
  final FeedController controller;

  const _Header({required this.controller});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 12, 16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Flare Pulse',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.4,
                        ),
                      ),
                      const SizedBox(width: 10),
                      _StatusDot(status: controller.status),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'FTSOv2 · ${controller.chain.name}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: PulseTheme.muted,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton<FlareChain>(
              tooltip: 'Switch network',
              icon: const Icon(Icons.swap_horiz, color: PulseTheme.muted),
              onSelected: controller.switchChain,
              itemBuilder: (context) => [
                for (final chain in FlareChain.values)
                  PopupMenuItem(
                    value: chain,
                    child: Text('${chain.name}  ·  ${chain.chainId}'),
                  ),
              ],
            ),
          ],
        ),
      );
}

class _StatusDot extends StatelessWidget {
  final PulseStatus status;

  const _StatusDot({required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, label) = switch (status) {
      PulseStatus.live => (PulseTheme.up, 'LIVE'),
      PulseStatus.connecting => (PulseTheme.muted, 'CONNECTING'),
      PulseStatus.retrying => (const Color(0xFFFFC24B), 'RETRYING'),
      PulseStatus.failed => (PulseTheme.down, 'OFFLINE'),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final FeedController controller;

  const _Body({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.rows.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (controller.status == PulseStatus.failed) ...[
              const Icon(Icons.cloud_off, size: 40, color: PulseTheme.muted),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  controller.error ?? 'Could not reach the network.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: PulseTheme.muted, height: 1.4),
                ),
              ),
            ] else
              const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: controller.rows.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (context, i) => FeedTile(
        // Keying by feed keeps each row's flash animation attached to its own
        // price when the list rebuilds.
        key: ValueKey(controller.rows[i].feedId.hex),
        row: controller.rows[i],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final FeedController controller;

  const _Footer({required this.controller});

  @override
  Widget build(BuildContext context) {
    final address = controller.ftsoAddress;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0x14FFFFFF))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Showing the resolved address is the point: it proves nothing here
          // is hardcoded, which is the rule this SDK cares most about.
          Text(
            address == null
                ? 'Resolving FtsoV2 via ContractRegistry…'
                : 'FtsoV2 resolved at runtime · ${_short(address)}',
            style: PulseTheme.tabular.copyWith(
              fontSize: 11,
              color: PulseTheme.muted,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            controller.updateCount == 0
                ? 'Reads are free — no wallet, no gas.'
                : '${controller.updateCount} update'
                    '${controller.updateCount == 1 ? '' : 's'} · '
                    'reads are free — no wallet, no gas.',
            style: const TextStyle(fontSize: 11, color: PulseTheme.muted),
          ),
          if (controller.status == PulseStatus.retrying) ...[
            const SizedBox(height: 6),
            Text(
              'Reconnecting — showing last known prices.',
              style: TextStyle(
                fontSize: 11,
                color: const Color(0xFFFFC24B).withValues(alpha: 0.9),
              ),
            ),
          ],
        ],
      ),
    );
  }

  static String _short(EthAddress a) {
    final hex = a.checksummed;
    return '${hex.substring(0, 8)}…${hex.substring(hex.length - 6)}';
  }
}
