import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../application/queue_notifier.dart';

class SearchingForOpponent extends ConsumerWidget {
  const SearchingForOpponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queueState = ref.watch(queueNotifierProvider);
    
    if (!queueState.isQueued) return const SizedBox.shrink();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SoteriaRadius.surfaceLarge),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(SoteriaRadius.surfaceLarge),
                border: Border.all(color: SoteriaColors.premiumBorder),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildAnimatedRadar(),
                  const SizedBox(height: 32),
                  Text(
                    'Searching for Opponent...',
                    style: SoteriaTypography.headlineSmall.copyWith(
                      color: SoteriaColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Estimated wait: ${queueState.ticket?.estimatedWaitSeconds ?? 30}s',
                    style: SoteriaTypography.bodyMedium.copyWith(
                      color: SoteriaColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildQueueTimer(queueState.timeInQueueSeconds),
                  const SizedBox(height: 40),
                  SoteriaButton(
                    label: 'CANCEL SEARCH',
                    onPressed: () => ref.read(queueNotifierProvider.notifier).leaveQueue(),
                    type: SoteriaButtonType.outlined,
                    fullWidth: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedRadar() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: SoteriaColors.primary.withOpacity(0.2), width: 2),
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer pulse
            _PulseCircle(delay: 0, size: 100),
            _PulseCircle(delay: 0.5, size: 100),
            // Inner brand icon or avatar
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: SoteriaColors.primary,
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQueueTimer(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    final timeString = '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: SoteriaColors.surfaceL2,
        borderRadius: BorderRadius.circular(SoteriaRadius.button),
      ),
      child: Text(
        timeString,
        style: SoteriaTypography.titleMedium.copyWith(
          color: SoteriaColors.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }
}

class _PulseCircle extends StatefulWidget {
  final double delay;
  final double size;

  const _PulseCircle({required this.delay, required this.size});

  @override
  State<_PulseCircle> createState() => _PulseCircleState();
}

class _PulseCircleState extends State<_PulseCircle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(begin: 0.6, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Future.delayed(Duration(milliseconds: (widget.delay * 1000).toInt()), () {
      if (mounted) _controller.repeat();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: (1.0 - _controller.value).clamp(0.0, 1.0),
          child: Container(
            width: widget.size * _animation.value,
            height: widget.size * _animation.value,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: SoteriaColors.primary, width: 2),
            ),
          ),
        );
      },
    );
  }
}
