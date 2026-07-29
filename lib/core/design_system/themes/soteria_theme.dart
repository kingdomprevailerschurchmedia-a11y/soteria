import 'package:flutter/material.dart';
import '../colors/soteria_colors.dart';
import '../typography/soteria_typography.dart';
import '../radius/soteria_radius.dart';
import '../elevation/soteria_elevation.dart';

/// SoteriaTheme provides the Material 3 theme configurations for Soteria v2.
/// 
/// [POLICY] Soteria is a DARK THEME ONLY application.
/// Light theme support has been removed to maintain brand consistency.
class SoteriaTheme {
  /// Returns the standard Soteria v2 Dark Theme configuration.
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      
      colorScheme: const ColorScheme.dark(
        primary: SoteriaColors.primary,
        onPrimary: SoteriaColors.onPrimary,
        secondary: SoteriaColors.secondary,
        onSecondary: SoteriaColors.onSecondary,
        surface: SoteriaColors.surfaceL1,
        onSurface: SoteriaColors.textPrimary,
        surfaceContainer: SoteriaColors.surfaceL2,
        error: SoteriaColors.error,
        onError: SoteriaColors.textPrimary,
        outline: SoteriaColors.outline,
      ),

      scaffoldBackgroundColor: SoteriaColors.background,
      
      textTheme: SoteriaTypography.textTheme,
      
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: SoteriaElevation.level0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: SoteriaColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      cardTheme: CardThemeData(
        elevation: SoteriaElevation.level0, // Shadows are minimal in v2
        color: SoteriaColors.surfaceL2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SoteriaRadius.surface),
          side: const BorderSide(
            color: SoteriaColors.premiumBorder,
            width: 1.0,
          ),
        ),
        margin: EdgeInsets.zero,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: SoteriaColors.primary,
          foregroundColor: SoteriaColors.onPrimary,
          disabledBackgroundColor: SoteriaColors.buttonDisabled,
          disabledForegroundColor: SoteriaColors.textDisabled,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SoteriaRadius.button),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0,
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: SoteriaColors.divider,
        thickness: 1.0,
        space: 1.0,
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: SoteriaColors.navigation,
        indicatorColor: SoteriaColors.primary.withValues(alpha: 0.1),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(color: SoteriaColors.primary, fontWeight: FontWeight.w600);
          }
          return const TextStyle(color: SoteriaColors.textSecondary);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: SoteriaColors.primary);
          }
          return const IconThemeData(color: SoteriaColors.textSecondary);
        }),
      ),

      extensions: const [
        SoteriaCustomColors(
          success: SoteriaColors.success,
          warning: SoteriaColors.warning,
          info: SoteriaColors.info,
          accentGold: SoteriaColors.accentGold,
        ),
      ],
    );
  }
}

/// CustomThemeExtension for colors and properties not fully covered by M3 ColorScheme.
class SoteriaCustomColors extends ThemeExtension<SoteriaCustomColors> {
  const SoteriaCustomColors({
    required this.success,
    required this.warning,
    required this.info,
    required this.accentGold,
  });

  final Color success;
  final Color warning;
  final Color info;
  final Color accentGold;

  @override
  SoteriaCustomColors copyWith({
    Color? success,
    Color? warning,
    Color? info,
    Color? accentGold,
  }) {
    return SoteriaCustomColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      accentGold: accentGold ?? this.accentGold,
    );
  }

  @override
  SoteriaCustomColors lerp(ThemeExtension<SoteriaCustomColors>? other, double t) {
    if (other is! SoteriaCustomColors) return this;
    return SoteriaCustomColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      accentGold: Color.lerp(accentGold, other.accentGold, t)!,
    );
  }
}
