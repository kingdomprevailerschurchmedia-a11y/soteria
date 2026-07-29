import 'package:flutter/material.dart';

/// SoteriaColors defines the complete color system for the Soteria application.
///
/// [POLICY] Soteria is a DARK THEME ONLY application.
/// All tokens are optimized for depth, luxury, and visual hierarchy.
class SoteriaColors {
  // --- BRAND PALETTE (v2) ---
  
  /// Royal Indigo: The primary brand color for main actions and identity.
  static const Color primary = Color(0xFF5B3FD9);
  static const Color onPrimary = Color(0xFFFFFFFF);
  
  /// Electric Violet: Used for pressed states and secondary highlights.
  static const Color secondary = Color(0xFF7C4DFF);
  static const Color onSecondary = Color(0xFFFFFFFF);

  /// Gold Accent: Reserved for achievements, rewards, and premium moments.
  static const Color accentGold = Color(0xFFD8B24A);
  static const Color onAccentGold = Color(0xFF000000);

  // --- SURFACE & BACKGROUND ---

  /// Premium Wallpaper Gradient Stops
  static const List<Color> wallpaperGradient = [
    Color(0xFF17112F), // Top Left
    Color(0xFF120A2A),
    Color(0xFF0D081E),
    Color(0xFF090514), // Bottom Right
  ];

  /// Surface Level 1: Main surfaces, dialogs, and bottom sheets.
  static const Color surfaceL1 = Color(0xFF17112F);
  
  /// Surface Level 2: Cards and elevated components.
  static const Color surfaceL2 = Color(0xFF1E1638);
  
  /// Navigation Surface: Bottom bars and navigation rails.
  static const Color navigation = Color(0xFF120A2A);

  /// Default background for fallbacks (matches gradient start).
  static const Color background = Color(0xFF090514);

  // --- TYPOGRAPHY ---

  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB9B6C9);
  static const Color textMuted = Color(0xFF77728A);
  static const Color textDisabled = Color(0xFF5F5A73);

  // --- FUNCTIONAL ---

  static const Color success = Color(0xFF2DD36F);
  static const Color error = Color(0xFFFF5A6B);
  static const Color info = Color(0xFF5AA9FF);
  static const Color warning = Color(0xFFD8B24A); // Redirects to Gold in v2

  // Gamification Palette (Preserved for compatibility)
  static const Color coinGold = Color(0xFFFFD700);
  static const Color xpPurple = Color(0xFFA020F0);
  static const Color streakOrange = Color(0xFFFF8C00);
  static const Color lifeRed = Color(0xFFFF4500);

  // --- AMBIENT GLOWS ---
  
  static const Color glowPurple = Color(0xFF5B3FD9);
  static const Color glowIndigo = Color(0xFF3F51B5);
  static const Color glowGold = Color(0xFFD8B24A);


  // --- BUTTON STATES ---
  
  static const Color buttonDisabled = Color(0xFF2A2348);
  static const Color buttonPressed = secondary;

  // --- BORDERS & SHADOWS ---
  
  static const Color premiumBorder = Color(0x0FFFFFFF); // rgba(255,255,255,0.06)

  // Legacy Redirects
  static const Color primaryLight = primary;
  static const Color backgroundLight = background;
  static const Color backgroundDark = background;
  static const Color outlineLight = outline;

  // --- LEGACY COMPATIBILITY (Neutralized to Dark) ---
  
  static const Color outline = Color(0xFF3E3A4F);
  static const Color divider = Color(0x1FFFFFFF);
  
  static const Color onBackground = textPrimary;
  static const Color onSurface = textPrimary;
  static const Color onSurfaceVariant = textSecondary;
  
  static const Color surface = surfaceL1;
  static const Color surfaceContainer = surfaceL2;

}
