import 'package:flutter/material.dart';

/// Visual language for Flare Pulse.
///
/// Dark by default: this is a data surface that people glance at, and a dark
/// ground makes the colour signal on a price change read instantly.
abstract final class PulseTheme {
  static const _flare = Color(0xFFE62058);
  static const _ink = Color(0xFF0B0D10);
  static const _surface = Color(0xFF14181D);
  static const _surfaceHigh = Color(0xFF1C2229);

  /// Price went up.
  static const up = Color(0xFF3DDC97);

  /// Price went down.
  static const down = Color(0xFFFF5C7A);

  /// Secondary text.
  static const muted = Color(0xFF8A94A6);

  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: _ink,
      colorScheme: base.colorScheme.copyWith(
        primary: _flare,
        surface: _surface,
        surfaceContainerHighest: _surfaceHigh,
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
