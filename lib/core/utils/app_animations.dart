import 'package:flutter/material.dart';
import '../design_system/design_system.dart';

/// AppAnimations provides centralized access to the design system's motion tokens
/// and reusable animation wrappers.
class AppAnimations {
  /// Simple fade-in animation.
  static Widget fadeIn({
    required Widget child,
    Duration duration = SoteriaAnimations.medium,
    Duration delay = Duration.zero,
  }) {
    return _AnimatedWrapper(
      delay: delay,
      builder: (context, controller) => FadeTransition(
        opacity: controller.drive(CurveTween(curve: SoteriaAnimations.standard)),
        child: child,
      ),
    );
  }

  /// Slide-in from bottom with fade.
  static Widget slideIn({
    required Widget child,
    Offset offset = const Offset(0, 0.1),
    Duration duration = SoteriaAnimations.medium,
    Duration delay = Duration.zero,
  }) {
    return _AnimatedWrapper(
      delay: delay,
      builder: (context, controller) {
        final animation = CurvedAnimation(
          parent: controller,
          curve: SoteriaAnimations.decelerate,
        );

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: offset,
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
    );
  }

  /// Scale-in with bounce effect.
  static Widget scaleIn({
    required Widget child,
    double begin = 0.8,
    Duration duration = SoteriaAnimations.slow,
    Duration delay = Duration.zero,
  }) {
    return _AnimatedWrapper(
      delay: delay,
      builder: (context, controller) => ScaleTransition(
        scale: Tween<double>(begin: begin, end: 1.0).animate(
          CurvedAnimation(parent: controller, curve: SoteriaAnimations.bounce),
        ),
        child: child,
      ),
    );
  }

  /// Reusable click bounce animation for interactive elements.
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
}

class _AnimatedWrapper extends StatefulWidget {
  const _AnimatedWrapper({required this.builder, required this.delay});
  final Widget Function(BuildContext, AnimationController) builder;
  final Duration delay;

  @override
  State<_AnimatedWrapper> createState() => _AnimatedWrapperState();
}

class _AnimatedWrapperState extends State<_AnimatedWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: SoteriaAnimations.medium,
    );

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _controller);
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
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scale = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.isDisabled ? null : (_) => _controller.forward(),
      onTapUp: widget.isDisabled ? null : (_) => _controller.reverse(),
      onTapCancel: widget.isDisabled ? null : () => _controller.reverse(),
      onTap: widget.isDisabled ? null : widget.onTap,
      child: ScaleTransition(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
