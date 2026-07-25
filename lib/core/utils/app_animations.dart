import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../design_system/design_system.dart';

/// AppAnimations provides reusable animation widgets for consistent motion.
class AppAnimations {
  /// A wrapper that adds a subtle scale down effect on tap and triggers haptics.
  static Widget bounceClick({
    required Widget child,
    required VoidCallback onTap,
    bool isDisabled = false,
  }) {
    return _BounceClickWrapper(
      onTap: onTap,
      isDisabled: isDisabled,
      child: child,
    );
  }

  /// Fade and slide up animation for content entrance.
  static Widget slideIn({
    required Widget child,
    Duration duration = SoteriaAnimations.medium,
    Offset offset = const Offset(0, 0.1),
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: SoteriaAnimations.decelerate,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 20),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  /// Scale entrance animation.
  static Widget scaleIn({
    required Widget child,
    Duration duration = SoteriaAnimations.medium,
    double begin = 0.9,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: 1.0),
      duration: duration,
      curve: SoteriaAnimations.bounce,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: (value - begin) / (1 - begin),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class _BounceClickWrapper extends StatefulWidget {
  const _BounceClickWrapper({
    required this.child,
    required this.onTap,
    this.isDisabled = false,
  });

  final Widget child;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  State<_BounceClickWrapper> createState() => _BounceClickWrapperState();
}

class _BounceClickWrapperState extends State<_BounceClickWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: SoteriaAnimations.instant,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.isDisabled) {
      _controller.forward();
      HapticFeedback.lightImpact();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.isDisabled) {
      _controller.reverse();
      widget.onTap();
    }
  }

  void _handleTapCancel() {
    if (!widget.isDisabled) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
