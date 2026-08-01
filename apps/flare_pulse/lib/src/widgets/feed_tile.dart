import 'package:flutter/material.dart';

import '../feed_controller.dart';
import '../theme.dart';

/// One price row, which flashes green or red when the value moves.
///
/// The flash is the whole point of the app: it makes Flare's ~1.8s block
/// latency visible rather than something you have to take on trust.
class FeedTile extends StatefulWidget {
  final FeedRow row;

  const FeedTile({super.key, required this.row});

  @override
  State<FeedTile> createState() => _FeedTileState();
}

class _FeedTileState extends State<FeedTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _flash = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  );

  @override
  void initState() {
    super.initState();
    // `reverse`, not `forward`. The controller runs 1 -> 0 so the tint decays;
    // `forward(from: 1)` would set the value to 1 and then animate towards 1,
    // leaving the row permanently lit.
    if (widget.row.direction != 0) _flash.reverse(from: 1);
  }

  @override
  void didUpdateWidget(FeedTile old) {
    super.didUpdateWidget(old);
    // Re-flash only when the value actually changed, not on every rebuild.
    final changed = old.row.value.value != widget.row.value.value;
    if (changed && widget.row.direction != 0) {
      _flash.reverse(from: 1);
    }
  }

  @override
  void dispose() {
    _flash.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final row = widget.row;
    final tint = row.direction > 0 ? PulseTheme.up : PulseTheme.down;

    return AnimatedBuilder(
      animation: _flash,
      builder: (context, child) {
        // Controller runs 1 -> 0, so the tint decays to nothing.
        final t = _flash.value;
        return DecoratedBox(
          decoration: BoxDecoration(
            color: tint.withValues(alpha: 0.10 * t),
            border: Border(
              left: BorderSide(color: tint.withValues(alpha: t), width: 2),
            ),
          ),
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    row.feedId.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Surfacing decimals is deliberate: the scale differs per
                  // feed, and that is the single most common source of bugs
                  // when reading FTSO.
                  Text(
                    '${row.value.decimals} dp',
                    style: const TextStyle(
                      fontSize: 12,
                      color: PulseTheme.muted,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  row.value.toDecimalString(),
                  style: PulseTheme.tabular.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: row.direction == 0
                        ? Colors.white
                        : Color.lerp(Colors.white, tint, _flash.value * 0.9),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 14,
                  child: row.direction == 0
                      ? const SizedBox.shrink()
                      : Icon(
                          row.direction > 0
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          size: 22,
                          color: tint,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
