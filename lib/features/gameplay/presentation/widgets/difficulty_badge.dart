import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../domain/entities/question_difficulty.dart';

class DifficultyBadge extends StatelessWidget {
  final QuestionDifficulty difficulty;

  const DifficultyBadge({super.key, required this.difficulty});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(SoteriaRadius.xs),
        border: Border.all(color: _getColor().withOpacity(0.5)),
      ),
      child: Text(
        difficulty.name.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: _getColor(),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
      ),
    );
  }

  Color _getColor() {
    switch (difficulty) {
      case QuestionDifficulty.beginner: return Colors.green;
      case QuestionDifficulty.intermediate: return SoteriaColors.primary;
      case QuestionDifficulty.advanced: return SoteriaColors.warning;
      case QuestionDifficulty.elite: return SoteriaColors.error;
    }
  }
}
