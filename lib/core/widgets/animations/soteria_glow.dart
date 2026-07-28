import 'package:flutter/material.dart';

/// SoteriaGlow adds a soft, breathing glow effect to its child.
class SoteriaGlow extends StatefulWidget {
  const SoteriaGlow({
    super.key,
    required this.child,
    this.color,
    this.enabled = true,
    this.duration = const Duration(seconds: 2),
  });

  final Widget child;
  final Color? color;
  final bool enabled;
  final Duration duration;

  @override
  State<SoteriaGlow> createState() => _SoteriaGlowState();
}

class _SoteriaGlowState extends State<SoteriaGlow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: 4.0, end: 12.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.enabled) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(SoteriaGlow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled != oldWidget.enabled) {
      if (widget.enabled) {
        _controller.repeat(reverse: true);
      } else {
        _controller.stop();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final glowColor = widget.color ?? Theme.of(context).primaryColor;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              if (widget.enabled)
                BoxShadow(
                  color: glowColor.withValues(alpha: 0.3),
                  blurRadius: _animation.value,
                  spreadRadius: _animation.value / 2,
                ),
            ],
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
