import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import 'soteria_card.dart';

/// QuizCard displays a summary of a quiz.
class SoteriaQuizCard extends StatelessWidget {
  const SoteriaQuizCard({
    super.key,
    required this.title,
    required this.questionCount,
    required this.difficulty,
    this.onTap,
  });

  final String title;
  final int questionCount;
  final String difficulty;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: SoteriaSpacing.s8),
          Row(
            children: [
              const Icon(Icons.help_outline, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text('$questionCount Questions', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(SoteriaRadius.s),
                ),
                child: Text(
                  difficulty.toUpperCase(),
                  style: const TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
