import 'package:flutter/material.dart';
import 'tokens.dart';

/// AppTheme provides the Material 3 theme configurations for Soteria.
class AppTheme {
  /// Returns the Light Theme configuration.
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryLight,
        onPrimary: AppColors.onPrimaryLight,
        primaryContainer: AppColors.primaryContainerLight,
        onPrimaryContainer: AppColors.onPrimaryContainerLight,
        secondary: AppColors.secondaryLight,
        onSecondary: AppColors.onSecondaryLight,
        secondaryContainer: AppColors.secondaryContainerLight,
        onSecondaryContainer: AppColors.onSecondaryContainerLight,
        error: AppColors.danger,
        onError: AppColors.onDanger,
        errorContainer: AppColors.dangerContainer,
        surface: AppColors.surfaceLight,
        onSurface: AppColors.onSurfaceLight,
        outline: AppColors.outlineLight,
      ),
      textTheme: AppTypography.textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: AppElevation.none,
        backgroundColor: AppColors.surfaceLight,
        titleTextStyle: AppTypography.textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        elevation: AppElevation.level1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.m),
        ),
      ),
      extensions: [
        SoteriaColors(
          success: AppColors.success,
          warning: AppColors.warning,
          info: AppColors.info,
          danger: AppColors.danger,
        ),
      ],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(64, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.m),
          ),
        ),
      ),
    );
  }

  /// Returns the Dark Theme configuration.
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryDark,
        onPrimary: AppColors.onPrimaryDark,
        primaryContainer: AppColors.primaryContainerDark,
        onPrimaryContainer: AppColors.onPrimaryContainerDark,
        secondary: AppColors.secondaryDark,
        onSecondary: AppColors.onSecondaryDark,
        secondaryContainer: AppColors.secondaryContainerDark,
        onSecondaryContainer: AppColors.onSecondaryContainerDark,
        error: AppColors.danger,
        onError: AppColors.onDanger,
        errorContainer: AppColors.dangerContainer,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.onSurfaceDark,
        outline: AppColors.outlineDark,
      ),
      textTheme: AppTypography.textTheme.apply(
        bodyColor: AppColors.onSurfaceDark,
        displayColor: AppColors.onSurfaceDark,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: AppElevation.none,
        backgroundColor: AppColors.surfaceDark,
        titleTextStyle: AppTypography.textTheme.titleLarge?.copyWith(
          color: AppColors.onSurfaceDark,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: AppElevation.level1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.m),
        ),
      ),
      extensions: [
        SoteriaColors(
          success: AppColors.success,
          warning: AppColors.warning,
          info: AppColors.info,
          danger: AppColors.danger,
        ),
      ],
    );
  }
}

/// CustomThemeExtension for functional colors not fully covered by M3 ColorScheme.
class SoteriaColors extends ThemeExtension<SoteriaColors> {
  const SoteriaColors({
    required this.success,
    required this.warning,
    required this.info,
    required this.danger,
  });

  final Color success;
  final Color warning;
  final Color info;
  final Color danger;

  @override
  SoteriaColors copyWith({
    Color? success,
    Color? warning,
    Color? info,
    Color? danger,
  }) {
    return SoteriaColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      danger: danger ?? this.danger,
    );
  }

  @override
  SoteriaColors lerp(ThemeExtension<SoteriaColors>? other, double t) {
    if (other is! SoteriaColors) return this;
    return SoteriaColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
    );
  }
}
