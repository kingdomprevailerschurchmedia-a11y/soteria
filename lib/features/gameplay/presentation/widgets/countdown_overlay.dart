import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../constants/gameplay_animations.dart';

class CountdownOverlay extends StatefulWidget {
  const CountdownOverlay({
    super.key,
    required this.count,
  });

  final int count;

  @override
  State<CountdownOverlay> createState() => _CountdownOverlayState();
}

class _CountdownOverlayState extends State<CountdownOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: GameplayAnimations.countdownTick,
    );

    _scaleAnimation = Tween<double>(begin: 2.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5)),
    );

    _controller.forward();
  }

  @override
  void didUpdateWidget(CountdownOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.count != widget.count) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Text(
                  widget.count == 0 ? 'GO!' : widget.count.toString(),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: SoteriaColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 120,
                    shadows: [
                      Shadow(
                        color: SoteriaColors.primary.withOpacity(0.5),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
