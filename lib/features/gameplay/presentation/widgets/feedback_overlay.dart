import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../constants/gameplay_animations.dart';

enum FeedbackType {
  correct,
  incorrect,
  timeout,
}

class FeedbackOverlay extends StatefulWidget {
  const FeedbackOverlay({
    super.key,
    required this.type,
    this.message,
    this.onFinished,
  });

  final FeedbackType type;
  final String? message;
  final VoidCallback? onFinished;

  @override
  State<FeedbackOverlay> createState() => _FeedbackOverlayState();
}

class _FeedbackOverlayState extends State<FeedbackOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: SoteriaAnimations.slow,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 0.5, end: 1.1), weight: 40),
      TweenSequenceItem(tween: Tween<double>(begin: 1.1, end: 1.0), weight: 60),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.4)),
    );

    _controller.forward().then((_) {
      Future.delayed(GameplayAnimations.feedbackHold, () {
        if (mounted) {
          _controller.reverse().then((_) {
            widget.onFinished?.call();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    final icon = _getIcon();
    final label = _getLabel();

    return Material(
      color: Colors.black45,
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  padding: const EdgeInsets.all(SoteriaSpacing.s32),
                  decoration: BoxDecoration(
                    color: SoteriaColors.surfaceDark,
                    borderRadius: BorderRadius.circular(SoteriaRadius.xl),
                    border: Border.all(color: color, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, color: color, size: 64),
                      const SizedBox(height: SoteriaSpacing.s16),
                      Text(
                        label,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (widget.message != null) ...[
                        const SizedBox(height: SoteriaSpacing.s8),
                        Text(
                          widget.message!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: SoteriaColors.textSecondary),
                        ),
                      ],
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

  Color _getColor() {
    switch (widget.type) {
      case FeedbackType.correct: return SoteriaColors.success;
      case FeedbackType.incorrect: return SoteriaColors.error;
      case FeedbackType.timeout: return SoteriaColors.warning;
    }
  }

  IconData _getIcon() {
    switch (widget.type) {
      case FeedbackType.correct: return Icons.check_circle_outline;
      case FeedbackType.incorrect: return Icons.highlight_off;
      case FeedbackType.timeout: return Icons.timer_outlined;
    }
  }

  String _getLabel() {
    switch (widget.type) {
      case FeedbackType.correct: return 'CORRECT!';
      case FeedbackType.incorrect: return 'INCORRECT';
      case FeedbackType.timeout: return 'TIME EXPIRED';
    }
  }
}
