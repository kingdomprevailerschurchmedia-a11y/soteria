import 'package:flutter/material.dart';
import '../colors/soteria_colors.dart';
import '../typography/soteria_typography.dart';
import '../radius/soteria_radius.dart';
import '../elevation/soteria_elevation.dart';

/// SoteriaTheme provides the Material 3 theme configurations for the application.
/// It consumes the design tokens to ensure visual consistency.
class SoteriaTheme {
  /// Returns the Light Theme configuration.
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: SoteriaColors.primaryLight,
        onPrimary: SoteriaColors.onPrimaryLight,
        primaryContainer: SoteriaColors.primaryContainerLight,
        onPrimaryContainer: SoteriaColors.onPrimaryContainerLight,
        secondary: SoteriaColors.secondaryLight,
        onSecondary: SoteriaColors.onSecondaryLight,
        secondaryContainer: SoteriaColors.secondaryContainerLight,
        onSecondaryContainer: SoteriaColors.onSecondaryContainerLight,
        tertiary: SoteriaColors.tertiaryLight,
        onTertiary: SoteriaColors.onTertiaryLight,
        tertiaryContainer: SoteriaColors.tertiaryContainerLight,
        onTertiaryContainer: SoteriaColors.onTertiaryContainerLight,
        error: SoteriaColors.error,
        onError: SoteriaColors.onError,
        errorContainer: SoteriaColors.errorContainer,
        surface: SoteriaColors.surfaceLight,
        onSurface: SoteriaColors.onSurfaceLight,
        outline: SoteriaColors.outlineLight,
      ),
      textTheme: SoteriaTypography.textTheme,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: SoteriaElevation.level0,
        backgroundColor: SoteriaColors.surfaceLight,
      ),
      cardTheme: CardThemeData(
        elevation: SoteriaElevation.level1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SoteriaRadius.m),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: SoteriaColors.dividerLight,
        thickness: 1.0,
      ),
      extensions: const [
        SoteriaCustomColors(
          success: SoteriaColors.success,
          warning: SoteriaColors.warning,
          info: SoteriaColors.info,
        ),
      ],
    );
  }

  /// Returns the Dark Theme configuration.
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: SoteriaColors.primaryDark,
        onPrimary: SoteriaColors.onPrimaryDark,
        primaryContainer: SoteriaColors.primaryContainerDark,
        onPrimaryContainer: SoteriaColors.onPrimaryContainerDark,
        secondary: SoteriaColors.secondaryDark,
        onSecondary: SoteriaColors.onSecondaryDark,
        secondaryContainer: SoteriaColors.secondaryContainerDark,
        onSecondaryContainer: SoteriaColors.onSecondaryContainerDark,
        tertiary: SoteriaColors.tertiaryDark,
        onTertiary: SoteriaColors.onTertiaryDark,
        tertiaryContainer: SoteriaColors.tertiaryContainerDark,
        onTertiaryContainer: SoteriaColors.onTertiaryContainerDark,
        error: SoteriaColors.error,
        onError: SoteriaColors.onError,
        errorContainer: SoteriaColors.errorContainer,
        surface: SoteriaColors.surfaceDark,
        onSurface: SoteriaColors.onSurfaceDark,
        outline: SoteriaColors.outlineDark,
      ),
      textTheme: SoteriaTypography.textTheme.apply(
        bodyColor: SoteriaColors.onSurfaceDark,
        displayColor: SoteriaColors.onSurfaceDark,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: SoteriaElevation.level0,
        backgroundColor: SoteriaColors.surfaceDark,
      ),
      cardTheme: CardThemeData(
        elevation: SoteriaElevation.level1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SoteriaRadius.m),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: SoteriaColors.dividerDark,
        thickness: 1.0,
      ),
      extensions: const [
        SoteriaCustomColors(
          success: SoteriaColors.success,
          warning: SoteriaColors.warning,
          info: SoteriaColors.info,
        ),
      ],
    );
  }
}

/// CustomThemeExtension for functional colors not fully covered by M3 ColorScheme.
class SoteriaCustomColors extends ThemeExtension<SoteriaCustomColors> {
  const SoteriaCustomColors({
    required this.success,
    required this.warning,
    required this.info,
  });

  final Color success;
  final Color warning;
  final Color info;

  @override
  SoteriaCustomColors copyWith({
    Color? success,
    Color? warning,
    Color? info,
  }) {
    return SoteriaCustomColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
    );
  }

  @override
  SoteriaCustomColors lerp(ThemeExtension<SoteriaCustomColors>? other, double t) {
    if (other is! SoteriaCustomColors) return this;
    return SoteriaCustomColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
    );
  }
}
