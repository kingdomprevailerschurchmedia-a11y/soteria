import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../../utils/app_animations.dart';

/// XPProgressBar shows user progress with a premium intelligent purple look.
class XPProgressBar extends StatelessWidget {
  const XPProgressBar({
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

/// CoinCounter displays user balance with a golden energetic look.
class CoinCounter extends StatelessWidget {
  const CoinCounter({
    super.key,
    required this.amount,
  });

  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SoteriaSpacing.s16,
        vertical: SoteriaSpacing.s8,
      ),
      decoration: BoxDecoration(
        color: SoteriaColors.coinGold.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(SoteriaRadius.l),
        border: Border.all(color: SoteriaColors.coinGold, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(SoteriaIcons.coin, color: SoteriaColors.coinGold, size: 20),
          const SizedBox(width: SoteriaSpacing.s8),
          Text(
            amount.toString(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.orange.shade900,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

/// StreakIndicator shows daily activity streaks with an energetic orange flame.
class StreakIndicator extends StatelessWidget {
  const StreakIndicator({
    super.key,
    required this.days,
  });

  final int days;

  @override
  Widget build(BuildContext context) {
    return AppAnimations.bounceClick(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(SoteriaIcons.streak,
              color: SoteriaColors.streakOrange, size: 32),
          Text(
            days.toString(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: SoteriaColors.streakOrange,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'DAYS',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: SoteriaColors.streakOrange,
                ),
          ),
        ],
      ),
    );
  }
}

/// LifeIndicator shows remaining chances with an energetic red heart look.
class LifeIndicator extends StatelessWidget {
  const LifeIndicator({
    super.key,
    required this.count,
    this.maxLives = 5,
  });

  final int count;
  final int maxLives;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxLives, (index) {
        final isActive = index < count;
        return Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
            isActive ? SoteriaIcons.life : Icons.favorite_border,
            color: isActive ? SoteriaColors.lifeRed : Colors.grey,
            size: 20,
          ),
        );
      }),
    );
  }
}
