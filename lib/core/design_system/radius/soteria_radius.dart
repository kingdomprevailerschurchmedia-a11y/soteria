/// SoteriaRadius defines consistent corner rounds for Soteria v2.
/// Optimized for the premium, soft-edged design language.
class SoteriaRadius {
  static const double none = 0.0;
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 12.0;
  
  /// Radius used for cards and primary surfaces (v2: 18.0)
  static const double surface = 18.0;
  
  /// Radius used for secondary surfaces and large cards (v2: 24.0)
  static const double surfaceLarge = 24.0;
  
  /// Standard button radius (v2: 20.0)
  static const double button = 20.0;
  
  static const double full = 999.0;

  // Legacy compatibility mappings
  static const double l = surface;
  static const double xl = surfaceLarge;
}
