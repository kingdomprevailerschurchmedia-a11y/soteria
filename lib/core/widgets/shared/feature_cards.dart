import 'package:flutter/material.dart';
import 'soteria_card.dart';
import '../../theme/tokens.dart';

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
            padding: const EdgeInsets.all(AppSpacing.m),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withAlpha(25),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Theme.of(context).primaryColor),
          ),
          const SizedBox(width: AppSpacing.m),
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

/// WalletCard displays the user's balance.
class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    required this.balance,
  });

  final String balance;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Balance',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.white70,
                ),
          ),
          const SizedBox(height: AppSpacing.s),
          Text(
            balance,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
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
          const SizedBox(height: AppSpacing.s),
          Row(
            children: [
              const Icon(Icons.help_outline, size: 16),
              const SizedBox(width: 4),
              Text('$questionCount Questions'),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange.withAlpha(25),
                  borderRadius: BorderRadius.circular(4),
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
