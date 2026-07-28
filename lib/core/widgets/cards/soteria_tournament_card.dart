import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import 'soteria_card.dart';

/// TournamentCard displays a high-energy competition summary.
class SoteriaTournamentCard extends StatelessWidget {
  const SoteriaTournamentCard({
    super.key,
    required this.title,
    required this.prizePool,
    required this.timeLeft,
    required this.entryFee,
    this.onTap,
  });

  final String title;
  final String prizePool;
  final String timeLeft;
  final String entryFee;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      onTap: onTap,
      borderColor: SoteriaColors.xpPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(SoteriaIcons.trophy, color: SoteriaColors.coinGold),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: SoteriaSpacing.s8, 
                  vertical: SoteriaSpacing.s4
                ),
                decoration: BoxDecoration(
                  color: SoteriaColors.xpPurple.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(SoteriaRadius.s),
                ),
                child: Text(
                  timeLeft,
                  style: const TextStyle(
                    color: SoteriaColors.xpPurple,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: SoteriaSpacing.s8),
          Text(
            'Prize Pool: $prizePool',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: SoteriaColors.coinGold,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Entry Fee: $entryFee',
                  style: Theme.of(context).textTheme.labelMedium),
              const Icon(SoteriaIcons.chevronRight, size: 14),
            ],
          ),
        ],
      ),
    );
  }
}
