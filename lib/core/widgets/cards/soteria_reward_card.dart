import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import 'soteria_card.dart';

/// RewardCard is a premium golden card for celebrating wins and achievements.
class SoteriaRewardCard extends StatelessWidget {
  const SoteriaRewardCard({
    super.key,
    required this.title,
    required this.reward,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String reward;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      onTap: onTap,
      isGlass: true,
      color: SoteriaColors.coinGold,
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      child: Column(
        children: [
          Icon(icon, color: Colors.black87, size: 48),
          const SizedBox(height: SoteriaSpacing.s16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black87,
                ),
          ),
          Text(
            reward,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
