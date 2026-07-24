import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// AppColors defines the Material 3 color palette and custom functional colors.
class AppColors {
  // Primary
  static const Color primaryLight = Color(0xFF6750A4);
  static const Color onPrimaryLight = Color(0xFFFFFFFF);
  static const Color primaryContainerLight = Color(0xFFEADDFF);
  static const Color onPrimaryContainerLight = Color(0xFF21005D);

  static const Color primaryDark = Color(0xFFD0BCFF);
  static const Color onPrimaryDark = Color(0xFF381E72);
  static const Color primaryContainerDark = Color(0xFF4F378B);
  static const Color onPrimaryContainerDark = Color(0xFFEADDFF);

  // Secondary
  static const Color secondaryLight = Color(0xFF625B71);
  static const Color onSecondaryLight = Color(0xFFFFFFFF);
  static const Color secondaryContainerLight = Color(0xFFE8DEF8);
  static const Color onSecondaryContainerLight = Color(0xFF1D192B);

  static const Color secondaryDark = Color(0xFFCCC2DC);
  static const Color onSecondaryDark = Color(0xFF332D41);
  static const Color secondaryContainerDark = Color(0xFF4A4458);
  static const Color onSecondaryContainerDark = Color(0xFFE8DEF8);

  // Success (Custom)
  static const Color success = Color(0xFF4CAF50);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFFE8F5E9);

  // Warning (Custom)
  static const Color warning = Color(0xFFFFC107);
  static const Color onWarning = Color(0xFF000000);
  static const Color warningContainer = Color(0xFFFFF8E1);

  // Danger/Error
  static const Color danger = Color(0xFFB3261E);
  static const Color onDanger = Color(0xFFFFFFFF);
  static const Color dangerContainer = Color(0xFFF9DEDC);

  // Info (Custom)
  static const Color info = Color(0xFF2196F3);
  static const Color onInfo = Color(0xFFFFFFFF);
  static const Color infoContainer = Color(0xFFE3F2FD);

  // Neutrals
  static const Color backgroundLight = Color(0xFFFEF7FF);
  static const Color onBackgroundLight = Color(0xFF1D1B20);
  static const Color surfaceLight = Color(0xFFFEF7FF);
  static const Color onSurfaceLight = Color(0xFF1D1B20);
  static const Color outlineLight = Color(0xFF79747E);

  static const Color backgroundDark = Color(0xFF141218);
  static const Color onBackgroundDark = Color(0xFFE6E1E5);
  static const Color surfaceDark = Color(0xFF141218);
  static const Color onSurfaceDark = Color(0xFFE6E1E5);
  static const Color outlineDark = Color(0xFF938F99);
}

/// AppTypography defines the standard Material 3 typography scale.
class AppTypography {
  static TextTheme get textTheme => GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        displaySmall: GoogleFonts.inter(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      );
}

/// AppSpacing defines consistent layout gaps.
class AppSpacing {
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;
}

/// AppRadius defines consistent corner rounds.
class AppRadius {
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 12.0;
  static const double l = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
  static const double circular = 999.0;
}

/// AppElevation defines standard shadow heights.
class AppElevation {
  static const double none = 0.0;
  static const double level1 = 1.0;
  static const double level2 = 3.0;
  static const double level3 = 6.0;
  static const double level4 = 8.0;
  static const double level5 = 12.0;
}

/// AppDuration defines standard animation timings.
class AppDuration {
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
}

/// AppShadows defines standard elevation shadows.
class AppShadows {
  static List<BoxShadow> get low => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get medium => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get high => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.15),
          blurRadius: 16,
          offset: const Offset(0, 8),
        ),
      ];
}

/// AppOpacity defines standard transparency levels.
class AppOpacity {
  static const double disabled = 0.38;
  static const double hint = 0.6;
  static const double high = 0.87;
  static const double medium = 0.6;
  static const double low = 0.38;
}

/// AppBorders defines standard border widths.
class AppBorders {
  static const double thin = 1.0;
  static const double medium = 2.0;
  static const double thick = 4.0;
}

/// AppIconSizes defines consistent icon dimensions.
class AppIconSizes {
  static const double s = 16.0;
  static const double m = 24.0;
  static const double l = 32.0;
  static const double xl = 48.0;
}

/// AppBreakpoints defines responsive layout thresholds.
class AppBreakpoints {
  static const double mobile = 480.0;
  static const double tablet = 768.0;
  static const double desktop = 1024.0;
}
