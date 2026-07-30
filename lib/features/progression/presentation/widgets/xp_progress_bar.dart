import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';

class XPProgressBar extends StatelessWidget {
  final int currentXP;
  final int nextLevelXP;
  final double height;

  const XPProgressBar({
    super.key,
    required this.currentXP,
    required this.nextLevelXP,
    this.height = 8,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (currentXP / nextLevelXP).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'EXP PROGRESS',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: SoteriaColors.textSecondary,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            Text(
              '$currentXP / $nextLevelXP XP',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: SoteriaColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: SoteriaSpacing.s8),
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: SoteriaColors.surfaceL2,
            borderRadius: BorderRadius.circular(height / 2),
            border: Border.all(color: Colors.white10),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [SoteriaColors.primary, Color(0xFF4A90E2)],
                ),
                borderRadius: BorderRadius.circular(height / 2),
                boxShadow: [
                  BoxShadow(
                    color: SoteriaColors.primary.withOpacity(0.4),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
