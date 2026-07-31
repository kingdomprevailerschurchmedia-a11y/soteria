import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../domain/entities/question.dart';
import '../../domain/entities/question_type.dart';
import '../../application/assist_state.dart';
import '../constants/gameplay_animations.dart';
import 'option_tile.dart';
import 'difficulty_badge.dart';
import 'category_indicator.dart';

class QuestionRenderer extends StatelessWidget {
  const QuestionRenderer({
    super.key,
    required this.question,
    required this.selectedOptionIds,
    required this.onOptionSelected,
    this.assistState = const AssistState(),
    this.isLocked = false,
    this.revealedCorrectOptionIds = const [],
  });

  final Question question;
  final List<String> selectedOptionIds;
  final ValueChanged<List<String>> onOptionSelected;
  final AssistState assistState;
  final bool isLocked;
  final List<String> revealedCorrectOptionIds;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: SoteriaAnimations.medium,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: GameplayAnimations.questionSlideOffset,
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: Column(
        key: ValueKey<String>(question.id),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuestionHeader(context),
          const SizedBox(height: SoteriaSpacing.s24),
          Text(
            question.text,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: SoteriaColors.textPrimary,
            ),
          ),
          const SizedBox(height: SoteriaSpacing.s32),
          ..._buildOptions(context),
          if (assistState.activeInsight != null) ...[
            const SizedBox(height: SoteriaSpacing.s8),
            _buildInsightStatus(context),
          ],
          if (question.hint != null) ...[
            const SizedBox(height: SoteriaSpacing.s24),
            _buildHint(context),
          ],
        ],
      ),
    );
  }

  Widget _buildQuestionHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: SoteriaSpacing.s8,
                vertical: SoteriaSpacing.s4,
              ),
              decoration: BoxDecoration(
                color: SoteriaColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(SoteriaRadius.xs),
                border: Border.all(color: SoteriaColors.primary.withOpacity(0.5)),
              ),
              child: Text(
                question.type.name.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: SoteriaColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            DifficultyBadge(difficulty: question.difficulty),
          ],
        ),
        if (question.categories.isNotEmpty) ...[
          const SizedBox(height: SoteriaSpacing.s12),
          CategoryIndicator(categories: question.categories),
        ],
      ],
    );
  }

  List<Widget> _buildOptions(BuildContext context) {
    return question.options.map((option) {
      final isSelected = selectedOptionIds.contains(option.id);
      final isEliminated = assistState.eliminatedOptionIds.contains(option.id);
      final percentage = assistState.activeInsight?.statistics[option.id];
      
      OptionState state = OptionState.idle;
      if (isEliminated) {
        state = OptionState.disabled;
      } else if (revealedCorrectOptionIds.isNotEmpty) {
        if (revealedCorrectOptionIds.contains(option.id)) {
          state = OptionState.correct;
        } else if (isSelected) {
          state = OptionState.incorrect;
        } else {
          state = OptionState.locked;
        }
      } else if (isSelected) {
        state = OptionState.selected;
      } else if (isLocked) {
        state = OptionState.locked;
      }

      return OptionTile(
        option: option,
        state: state,
        percentage: percentage,
        onTap: () {
          if (isLocked) return;
          if (question.type == QuestionType.multipleChoice || question.type == QuestionType.trueFalse) {
            onOptionSelected([option.id]);
          } else {
            final newList = List<String>.from(selectedOptionIds);
            if (newList.contains(option.id)) {
              newList.remove(option.id);
            } else {
              newList.add(option.id);
            }
            onOptionSelected(newList);
          }
        },
      );
    }).toList();
  }

  Widget _buildInsightStatus(BuildContext context) {
    return Text(
      assistState.activeInsight!.isSimulated 
          ? 'Historical data is currently limited. Showing difficulty estimates.' 
          : 'Based on global community results.',
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: SoteriaColors.textSecondary,
            fontStyle: FontStyle.italic,
          ),
    );
  }

  Widget _buildHint(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SoteriaSpacing.s12),
      decoration: BoxDecoration(
        color: SoteriaColors.info.withOpacity(0.05),
        borderRadius: BorderRadius.circular(SoteriaRadius.m),
        border: Border.all(color: SoteriaColors.info.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.lightbulb_outline, color: SoteriaColors.info, size: 20),
          const SizedBox(width: SoteriaSpacing.s8),
          Expanded(
            child: Text(
              'HINT: ${question.hint}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: SoteriaColors.info,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
