import 'dart:math' as math;

/// Logic for managing and clamping text scaling across different screen sizes.
class TextScaleManager {
  /// Returns a clamped text scale factor to prevent UI breaking on extreme settings.
  static double getClampedScale(double systemScale, {double min = 0.8, double max = 1.5}) {
    return math.max(min, math.min(systemScale, max));
  }
}
