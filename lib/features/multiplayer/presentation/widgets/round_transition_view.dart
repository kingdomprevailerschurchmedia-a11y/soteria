import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../domain/models/session_models.dart';

class RoundTransitionView extends StatelessWidget {
  final int roundCompleted;
  final List<PlayerState> players;

  const RoundTransitionView({
    super.key,
    required this.roundCompleted,
    required this.players,
  });

  @override
  Widget build(BuildContext context) {
    // Sort players by score for this round's mini-leaderboard
    final sortedPlayers = List<PlayerState>.from(players)
      ..sort((a, b) => b.score.compareTo(a.score));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ROUND $roundCompleted COMPLETE',
                style: SoteriaTypography.headlineSmall.copyWith(
                  color: SoteriaColors.accentGold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: SoteriaColors.surfaceL1.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(SoteriaRadius.surfaceLarge),
                  border: Border.all(color: SoteriaColors.premiumBorder),
                ),
                child: Column(
                  children: sortedPlayers.map((p) => _ScoreRow(player: p)).toList(),
                ),
              ),
              const SizedBox(height: 40),
              const SoteriaCircularLoader(),
              const SizedBox(height: 16),
              Text(
                'Next round starting soon...',
                style: SoteriaTypography.bodyMedium.copyWith(color: SoteriaColors.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreRow extends StatelessWidget {
  final PlayerState player;

  const _ScoreRow({required this.player});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: SoteriaColors.primary,
            child: Text(
              player.displayName[0],
              style: SoteriaTypography.labelSmall.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            player.displayName,
            style: SoteriaTypography.bodyLarge.copyWith(color: SoteriaColors.textPrimary),
          ),
          const Spacer(),
          Text(
            '${player.score} pts',
            style: SoteriaTypography.titleMedium.copyWith(
              color: SoteriaColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
