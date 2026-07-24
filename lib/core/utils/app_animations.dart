import 'package:flutter/material.dart';
import '../theme/tokens.dart';

/// AppAnimations provides reusable animation widgets for consistent motion.
class AppAnimations {
  /// Simple fade animation.
  static Widget fade({
    required Widget child,
    Duration duration = AppDuration.medium,
  }) {
    return AnimatedSwitcher(
      duration: duration,
      child: child,
    );
  }

  /// Scale and fade animation.
  static Widget scale({
    required Widget child,
    Duration duration = AppDuration.medium,
    double begin = 0.8,
    double end = 1.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: end),
      duration: duration,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
