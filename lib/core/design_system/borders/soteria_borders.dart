import 'package:flutter/material.dart';
import '../colors/soteria_colors.dart';

/// SoteriaBorders defines standard border widths and styles for Soteria v2.
class SoteriaBorders {
  static const double thin = 1.0;
  static const double medium = 2.0;
  static const double thick = 4.0;

  /// The standard premium border style for surfaces in v2.
  static BorderSide get premium => const BorderSide(
        color: SoteriaColors.premiumBorder,
        width: thin,
      );

  /// A slightly more visible border for focused states.
  static BorderSide get focused => const BorderSide(
        color: SoteriaColors.primary,
        width: thin,
      );
}
