import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaXPProgressBar shows user progress with a premium intelligent purple look.
class SoteriaXPProgressBar extends StatelessWidget {
  const SoteriaXPProgressBar({
    super.key,
    required this.progress,
    required this.level,
  });

  final double progress; // 0.0 to 1.0
  final int level;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'LEVEL $level',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: SoteriaColors.xpPurple,
                    letterSpacing: 1.2,
                  ),
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(height: SoteriaSpacing.s8),
        ClipRRect(
          borderRadius: BorderRadius.circular(SoteriaRadius.full),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            backgroundColor: SoteriaColors.xpPurple.withValues(alpha: 0.1),
            valueColor: const AlwaysStoppedAnimation<Color>(SoteriaColors.xpPurple),
          ),
        ),
      ],
    );
  }
}
