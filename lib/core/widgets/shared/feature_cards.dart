import 'package:flutter/material.dart';
import 'soteria_card.dart';
import '../../design_system/design_system.dart';

/// TournamentCard displays a high-energy competition summary.
class TournamentCard extends StatelessWidget {
  const TournamentCard({
    super.key,
    required this.title,
    required this.prizePool,
    required this.timeLeft,
    required this.entryFee,
  });

  final String title;
  final String prizePool;
  final String timeLeft;
  final String entryFee;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      borderColor: SoteriaColors.xpPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.emoji_events, color: SoteriaColors.coinGold),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
          Text(title, style: Theme.of(context).textTheme.titleLarge),
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

/// RewardCard is a premium golden card for celebrating wins.
class RewardCard extends StatelessWidget {
  const RewardCard({
    super.key,
    required this.title,
    required this.reward,
    required this.icon,
  });

  final String title;
  final String reward;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      isGlass: true,
      color: SoteriaColors.coinGold,
      child: Column(
        children: [
          Icon(icon, color: SoteriaColors.onWarning, size: 48),
          const SizedBox(height: SoteriaSpacing.s16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: SoteriaColors.onWarning,
                ),
          ),
          Text(
            reward,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: SoteriaColors.onWarning,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

/// StatisticCard displays intelligence metrics.
class StatisticCard extends StatelessWidget {
  const StatisticCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.trend,
  });

  final String label;
  final String value;
  final IconData icon;
  final String? trend;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: SoteriaColors.info, size: 24),
          const Spacer(),
          Text(value, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: SoteriaSpacing.s4),
          Row(
            children: [
              Text(label, style: Theme.of(context).textTheme.labelSmall),
              if (trend != null) ...[
                const Spacer(),
                Text(
                  trend!,
                  style: const TextStyle(color: SoteriaColors.success, fontSize: 10),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// QuizCard displays a summary of a quiz.
class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.title,
    required this.questionCount,
    required this.difficulty,
  });

  final String title;
  final int questionCount;
  final String difficulty;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: SoteriaSpacing.s8),
          Row(
            children: [
              const Icon(Icons.help_outline, size: 16),
              const SizedBox(width: 4),
              Text('$questionCount Questions'),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(SoteriaRadius.s),
                ),
                child: Text(
                  difficulty,
                  style: const TextStyle(color: Colors.orange, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// AchievementCard displays a user's achievement.
class AchievementCard extends StatelessWidget {
  const AchievementCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(SoteriaSpacing.s16),
            decoration: BoxDecoration(
              color: SoteriaColors.xpPurple.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: SoteriaColors.xpPurple),
          ),
          const SizedBox(width: SoteriaSpacing.s16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Text(description, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ProfileCard displays user overview in a premium glass style.
class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.rank,
    required this.avatarUrl,
  });

  final String name;
  final String rank;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      isGlass: true,
      color: SoteriaColors.primaryLight,
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: SoteriaSpacing.s16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                rank,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.white70,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// LeaderboardCard displays a user's position in a ranking list.
class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({
    super.key,
    required this.position,
    required this.name,
    required this.score,
    this.isCurrentUser = false,
  });

  final int position;
  final String name;
  final String score;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      padding: const EdgeInsets.symmetric(
        horizontal: SoteriaSpacing.s24,
        vertical: SoteriaSpacing.s16,
      ),
      borderColor: isCurrentUser ? SoteriaColors.coinGold : null,
      elevation: isCurrentUser ? SoteriaElevation.level2 : SoteriaElevation.level1,
      child: Row(
        children: [
          Text(
            '#$position',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: position <= 3 ? SoteriaColors.coinGold : null,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(width: SoteriaSpacing.s16),
          const CircleAvatar(radius: 16, child: Icon(SoteriaIcons.person, size: 16)),
          const SizedBox(width: SoteriaSpacing.s16),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: isCurrentUser ? FontWeight.bold : null,
                ),
          ),
          const Spacer(),
          Text(
            score,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: SoteriaColors.xpPurple,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
