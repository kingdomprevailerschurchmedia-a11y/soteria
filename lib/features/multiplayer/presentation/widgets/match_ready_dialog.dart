import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../models/player.dart';

class MatchReadyDialog extends StatelessWidget {
  final List<MatchPlayer> players;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const MatchReadyDialog({
    super.key,
    required this.players,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
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
            boxShadow: [
              BoxShadow(
                color: SoteriaColors.primary.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.flash_on, color: SoteriaColors.accentGold, size: 48),
              const SizedBox(height: 16),
              Text(
                'MATCH FOUND!',
                style: SoteriaTypography.headlineMedium.copyWith(
                  color: SoteriaColors.textPrimary,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 24),
              _buildPlayersList(),
              const SizedBox(height: 32),
              SoteriaButton(
                label: 'ACCEPT MATCH',
                onPressed: onAccept,
                type: SoteriaButtonType.primary,
              ),
              const SizedBox(height: 12),
              SoteriaButton(
                label: 'DECLINE',
                onPressed: onDecline,
                type: SoteriaButtonType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayersList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: players.map((mp) => _PlayerAvatar(player: mp.player)).toList(),
    );
  }
}

class _PlayerAvatar extends StatelessWidget {
  final Player player;

  const _PlayerAvatar({required this.player});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: SoteriaColors.primary, width: 2),
            image: player.avatarUrl != null
                ? DecorationImage(image: NetworkImage(player.avatarUrl!))
                : null,
          ),
          child: player.avatarUrl == null
              ? const Icon(Icons.person, color: Colors.white)
              : null,
        ),
        const SizedBox(height: 8),
        Text(
          player.displayName,
          style: SoteriaTypography.bodySmall.copyWith(color: SoteriaColors.textPrimary),
        ),
        Text(
          'Rank ${player.rank}',
          style: SoteriaTypography.labelSmall.copyWith(color: SoteriaColors.accentGold),
        ),
      ],
    );
  }
}
