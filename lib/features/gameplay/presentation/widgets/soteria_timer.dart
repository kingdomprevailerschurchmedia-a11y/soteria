import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../domain/entities/timer_state.dart';
import '../domain/entities/timer_status.dart';

class CircularTimer extends StatelessWidget {
  const CircularTimer({
    super.key,
    required this.timerState,
    this.size = 64.0,
  });

  final TimerState timerState;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = _getTimerColor(timerState.status);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _PulseEffect(
            isActive: timerState.status == TimerStatus.critical,
            color: color,
            child: CircularProgressIndicator(
              value: timerState.progress,
              strokeWidth: 4,
              backgroundColor: SoteriaColors.surfaceL2,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          Text(
            timerState.remainingSeconds.toString(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }

  Color _getTimerColor(TimerStatus status) {
    switch (status) {
      case TimerStatus.warning:
        return SoteriaColors.warning;
      case TimerStatus.critical:
        return SoteriaColors.error;
      case TimerStatus.frozen:
        return SoteriaColors.primary;
      case TimerStatus.expired:
        return SoteriaColors.textDisabled;
      default:
        return SoteriaColors.primary;
    }
  }
}

class LinearTimer extends StatelessWidget {
  const LinearTimer({
    super.key,
    required this.timerState,
    this.height = 4.0,
  });

  final TimerState timerState;
  final double height;

  @override
  Widget build(BuildContext context) {
    final color = _getTimerColor(timerState.status);

    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: SoteriaColors.surfaceL2,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: timerState.progress.clamp(0.0, 1.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(height / 2),
            boxShadow: [
              if (timerState.status == TimerStatus.critical)
                BoxShadow(
                  color: color.withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTimerColor(TimerStatus status) {
    switch (status) {
      case TimerStatus.warning:
        return SoteriaColors.warning;
      case TimerStatus.critical:
        return SoteriaColors.error;
      case TimerStatus.frozen:
        return SoteriaColors.primary;
      default:
        return SoteriaColors.primary;
    }
  }
}

class _PulseEffect extends StatefulWidget {
  const _PulseEffect({
    required this.child,
    required this.isActive,
    required this.color,
  });

  final Widget child;
  final bool isActive;
  final Color color;

  @override
  State<_PulseEffect> createState() => _PulseEffectState();
}

class _PulseEffectState extends State<_PulseEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isActive) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(0.3 * _controller.value),
                blurRadius: 15 * _controller.value,
                spreadRadius: 5 * _controller.value,
              ),
            ],
          ),
          child: widget.child,
        );
      },
    );
  }
}
