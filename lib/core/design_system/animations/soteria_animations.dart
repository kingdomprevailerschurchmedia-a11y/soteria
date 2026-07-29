import 'package:flutter/material.dart';

/// SoteriaAnimations defines standard animation durations and curves for Soteria v2.
/// Optimized for smooth, elegant transitions.
class SoteriaAnimations {
  // Durations
  static const Duration instant = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 200);
  
  /// Preferred standard duration for v2 transitions (250ms)
  static const Duration medium = Duration(milliseconds: 250);
  
  /// Slower duration for larger transitions (350ms)
  static const Duration slow = Duration(milliseconds: 350);
  
  static const Duration extraSlow = Duration(milliseconds: 600);

  // Curves
  static const Curve standard = Curves.easeInOutCubic;
  static const Curve decelerate = Curves.easeOutCubic;
  static const Curve accelerate = Curves.easeInCubic;
  
  /// [POLICY] Avoid bounce animations in v2 to maintain a premium feel.
  static const Curve smooth = Curves.linearToEaseOut;
  static const Curve bounce = Curves.elasticOut;
}
