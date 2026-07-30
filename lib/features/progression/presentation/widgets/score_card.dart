import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';

class ScoreCard extends StatelessWidget {
  final String label;
  final int value;
  final IconData icon;

  const ScoreCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: SoteriaColors.accentGold, size: 24),
          const SizedBox(height: SoteriaSpacing.s8),
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: SoteriaColors.textSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: SoteriaSpacing.s4),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: SoteriaColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
