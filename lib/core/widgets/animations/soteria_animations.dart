import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaFade is a simple wrapper for fade-in animations.
class SoteriaFade extends StatelessWidget {
  const SoteriaFade({
    super.key,
    required this.child,
    this.duration = SoteriaAnimations.medium,
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: child,
    );
  }
}

/// SoteriaScale is a simple wrapper for scale-in animations.
class SoteriaScale extends StatelessWidget {
  const SoteriaScale({
    super.key,
    required this.child,
    this.duration = SoteriaAnimations.medium,
    this.begin = 0.8,
  });

  final Widget child;
  final Duration duration;
  final double begin;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: 1.0),
      duration: duration,
      curve: SoteriaAnimations.bounce,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: child,
    );
  }
}
