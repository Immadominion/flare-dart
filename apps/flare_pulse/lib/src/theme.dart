import 'package:flutter/material.dart';

/// Visual language for Flare Pulse.
///
/// Dark by default: this is a data surface that people glance at, and a dark
/// ground makes the colour signal on a price change read instantly.
abstract final class PulseTheme {
  /// Flare's brand pink. Primary actions only — it must stay rare to read as
  /// "this is the thing to press".
  static const flare = Color(0xFFE62058);

  /// Page background.
  static const ink = Color(0xFF0B0D10);

  /// Raised surfaces: sheets, cards.
  static const surface = Color(0xFF14181D);

  /// Controls sitting on [surface].
  static const surfaceHigh = Color(0xFF1C2229);

  /// Hairline borders and dividers.
  static const hairline = Color(0x14FFFFFF);

  /// Price went up.
  static const up = Color(0xFF3DDC97);

  /// Price went down.
  static const down = Color(0xFFFF5C7A);

  /// Secondary text.
  static const muted = Color(0xFF8A94A6);

  /// Something is in flight, or degraded but recovering.
  ///
  /// Amber rather than red on purpose: retrying, awaiting a signature and
  /// waiting for inclusion are all normal states, and colouring them as
  /// failures teaches people to ignore real failures.
  static const pending = Color(0xFFFFC24B);

  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: ink,
      colorScheme: base.colorScheme.copyWith(
        primary: flare,
        surface: surface,
        surfaceContainerHighest: surfaceHigh,
        onSurface: Colors.white,
      ),
      textTheme: base.textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      dividerColor: Colors.white.withValues(alpha: 0.06),
    );
  }

  /// Style for any figure that changes in place.
  ///
  /// Tabular figures are essential here: without them each digit has its own
  /// width, so a ticking price jitters horizontally and reads as noise.
  static const tabular = TextStyle(
    fontFeatures: [FontFeature.tabularFigures()],
    fontFamilyFallback: ['SF Mono', 'Menlo', 'Roboto Mono', 'monospace'],
  );
}
