import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';

class MatchCountdownOverlay extends StatefulWidget {
  final int count;
  final VoidCallback onFinished;

  const MatchCountdownOverlay({
    super.key,
    required this.count,
    required this.onFinished,
  });

  @override
  State<MatchCountdownOverlay> createState() => _MatchCountdownOverlayState();
}

class _MatchCountdownOverlayState extends State<MatchCountdownOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late int _currentCount;

  @override
  void initState() {
    super.initState();
    _currentCount = widget.count;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(begin: 2.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5, curve: Curves.easeIn)),
    );

    _startCountdown();
  }

  void _startCountdown() async {
    for (int i = widget.count; i > 0; i--) {
      if (!mounted) return;
      setState(() => _currentCount = i);
      _controller.reset();
      _controller.forward();
      await Future.delayed(const Duration(milliseconds: 1000));
    }
    widget.onFinished();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'GET READY',
                      style: SoteriaTypography.headlineMedium.copyWith(
                        color: SoteriaColors.primary,
                        letterSpacing: 8,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '$_currentCount',
                      style: SoteriaTypography.displayLarge.copyWith(
                        fontSize: 120,
                        color: SoteriaColors.textPrimary,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                            color: SoteriaColors.primary.withOpacity(0.5),
                            blurRadius: 20,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
