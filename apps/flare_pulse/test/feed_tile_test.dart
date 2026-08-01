import 'package:flare_network/flare_network.dart';
import 'package:flare_pulse/src/feed_controller.dart';
import 'package:flare_pulse/src/theme.dart';
import 'package:flare_pulse/src/widgets/feed_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Hermetic widget tests — no network. `FeedController` opens a connection in
/// its constructor, so these exercise the presentation layer directly, which
/// is where the display bugs would be anyway.
void main() {
  FeedRow row({
    required FeedId feed,
    required int value,
    required int decimals,
    int direction = 0,
  }) => FeedRow(
    feedId: feed,
    direction: direction,
    value: FtsoFeedValue(
      feedId: feed,
      value: BigInt.from(value),
      decimals: decimals,
      timestamp: 1785528109,
    ),
  );

  Future<void> pump(WidgetTester tester, FeedRow r) => tester.pumpWidget(
    MaterialApp(
      theme: PulseTheme.dark,
      home: Scaffold(body: FeedTile(row: r)),
    ),
  );

  testWidgets('renders the feed name and its exact decimal value', (
    tester,
  ) async {
    await pump(tester, row(feed: Feeds.flrUsd, value: 626973, decimals: 8));

    expect(find.text('FLR/USD'), findsOneWidget);
    expect(find.text('0.00626973'), findsOneWidget);
  });

  testWidgets('shows the decimal scale, because it differs per feed', (
    tester,
  ) async {
    await pump(tester, row(feed: Feeds.btcUsd, value: 6288717, decimals: 2));

    expect(find.text('62887.17'), findsOneWidget);
    // Surfacing "2 dp" is deliberate — it is the most common source of bugs
    // when reading FTSO feeds.
    expect(find.text('2 dp'), findsOneWidget);
  });

  testWidgets(
    'renders each feed at its own scale without cross-contamination',
    (tester) async {
      // The four scales seen in one live Coston2 call.
      final cases = <(FeedId, int, int, String)>[
        (Feeds.flrUsd, 626973, 8, '0.00626973'),
        (Feeds.btcUsd, 6288717, 2, '62887.17'),
        (Feeds.ethUsd, 1861608, 3, '1861.608'),
        (Feeds.xrpUsd, 1061849, 6, '1.061849'),
      ];

      for (final (feed, value, decimals, expected) in cases) {
        await pump(tester, row(feed: feed, value: value, decimals: decimals));
        expect(find.text(expected), findsOneWidget, reason: feed.name);
      }
    },
  );

  testWidgets('shows an up arrow when the price rose', (tester) async {
    await pump(
      tester,
      row(feed: Feeds.flrUsd, value: 626973, decimals: 8, direction: 1),
    );
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.byIcon(Icons.arrow_drop_up), findsOneWidget);
    expect(find.byIcon(Icons.arrow_drop_down), findsNothing);
  });

  testWidgets('shows a down arrow when the price fell', (tester) async {
    await pump(
      tester,
      row(feed: Feeds.flrUsd, value: 626973, decimals: 8, direction: -1),
    );
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.byIcon(Icons.arrow_drop_down), findsOneWidget);
  });

  testWidgets('shows no arrow on the first reading', (tester) async {
    await pump(tester, row(feed: Feeds.flrUsd, value: 626973, decimals: 8));

    expect(find.byIcon(Icons.arrow_drop_up), findsNothing);
    expect(find.byIcon(Icons.arrow_drop_down), findsNothing);
  });

  testWidgets('the flash fades out rather than staying lit', (tester) async {
    // Regression test. The controller was driven with `forward(from: 1)`,
    // which sets the value to 1.0 and then animates *towards* 1.0 — no
    // movement. The tint stayed at full opacity forever. `reverse(from: 1)`
    // animates 1.0 -> 0.0, which is what "flash" means.
    //
    // A settles-without-hanging assertion cannot catch this, because the
    // broken version also completed instantly. Only sampling the actual
    // opacity over time does.
    double tintAlpha() {
      final box = tester.widget<DecoratedBox>(
        find
            .descendant(
              of: find.byType(FeedTile),
              matching: find.byType(DecoratedBox),
            )
            .first,
      );
      return ((box.decoration as BoxDecoration).color ??
              const Color(0x00000000))
          .a;
    }

    await pump(
      tester,
      row(feed: Feeds.flrUsd, value: 626973, decimals: 8, direction: 1),
    );

    await tester.pump(const Duration(milliseconds: 16));
    final atStart = tintAlpha();
    expect(atStart, greaterThan(0.0), reason: 'the flash should be visible');

    await tester.pump(const Duration(milliseconds: 350));
    final midway = tintAlpha();
    expect(midway, lessThan(atStart), reason: 'the flash should be fading');

    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(tintAlpha(), 0.0, reason: 'the flash should end fully transparent');
  });

  testWidgets('the flash settles rather than animating forever', (
    tester,
  ) async {
    await pump(
      tester,
      row(feed: Feeds.flrUsd, value: 626973, decimals: 8, direction: 1),
    );
    // A never-settling animation would hang pumpAndSettle and, in the real app,
    // would keep the raster thread busy indefinitely.
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.text('0.00626973'), findsOneWidget);
  });

  testWidgets('re-flashes only when the value actually changed', (
    tester,
  ) async {
    final first = row(
      feed: Feeds.flrUsd,
      value: 626973,
      decimals: 8,
      direction: 1,
    );
    await pump(tester, first);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Same value, rebuilt: must not restart the animation.
    await pump(tester, first);
    await tester.pump(const Duration(milliseconds: 16));
    expect(find.text('0.00626973'), findsOneWidget);

    // New value: renders the new figure.
    await pump(
      tester,
      row(feed: Feeds.flrUsd, value: 627049, decimals: 8, direction: 1),
    );
    await tester.pump(const Duration(milliseconds: 16));
    expect(find.text('0.00627049'), findsOneWidget);
  });

  testWidgets('handles a negative decimals value without crashing', (
    tester,
  ) async {
    // `decimals` is a signed int8; a negative value scales up.
    await pump(tester, row(feed: Feeds.flrUsd, value: 42, decimals: -2));
    expect(find.text('4200'), findsOneWidget);
  });
}
