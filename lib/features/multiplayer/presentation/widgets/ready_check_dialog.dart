import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../application/session_notifier.dart';
import '../domain/models/session_models.dart';

class ReadyCheckDialog extends ConsumerWidget {
  final GameSession session;

  const ReadyCheckDialog({super.key, required this.session});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: SoteriaColors.surfaceL1.withOpacity(0.9),
            borderRadius: BorderRadius.circular(SoteriaRadius.surfaceLarge),
            border: Border.all(color: SoteriaColors.primary.withOpacity(0.3), width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_outline, color: SoteriaColors.primary, size: 48),
              const SizedBox(height: 16),
              Text(
                'READY CHECK',
                style: SoteriaTypography.headlineSmall.copyWith(color: SoteriaColors.textPrimary),
              ),
              const SizedBox(height: 24),
              _buildPlayersStatus(),
              const SizedBox(height: 32),
              SoteriaButton(
                label: 'I AM READY',
                onPressed: () => ref.read(activeSessionNotifierProvider.notifier).setReady(true),
                type: SoteriaButtonType.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayersStatus() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: session.players.map((p) => _PlayerReadyIndicator(player: p)).toList(),
    );
  }
}

class _PlayerReadyIndicator extends StatelessWidget {
  final PlayerState player;

  const _PlayerReadyIndicator({required this.player});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: SoteriaColors.surfaceL2,
              child: const Icon(Icons.person, color: SoteriaColors.textSecondary),
            ),
            if (player.isReady)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: SoteriaColors.success,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, size: 12, color: Colors.white),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          player.displayName,
          style: SoteriaTypography.bodySmall.copyWith(
            color: player.isReady ? SoteriaColors.textPrimary : SoteriaColors.textMuted,
          ),
        ),
      ],
    );
  }
}
