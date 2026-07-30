import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';

class QuestionNavigatorBar extends StatelessWidget {
  const QuestionNavigatorBar({
    super.key,
    required this.onPrevious,
    required this.onNext,
    required this.onSkip,
    required this.hasNext,
    required this.hasPrevious,
    required this.isAnswered,
    required this.onFinish,
    required this.isLastQuestion,
  });

  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final VoidCallback onFinish;
  final bool hasNext;
  final bool hasPrevious;
  final bool isAnswered;
  final bool isLastQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      decoration: BoxDecoration(
        color: SoteriaColors.surfaceL1,
        border: const Border(
          top: BorderSide(color: SoteriaColors.premiumBorder),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            if (hasPrevious)
              IconButton(
                onPressed: onPrevious,
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Previous Question',
              )
            else
              const SizedBox(width: 48),
            const SizedBox(width: SoteriaSpacing.s8),
            Expanded(
              child: isAnswered || isLastQuestion
                  ? SoteriaButton(
                      label: isLastQuestion ? 'FINISH' : 'NEXT',
                      onPressed: isLastQuestion ? onFinish : onNext,
                    )
                  : SoteriaButton(
                      label: 'SKIP',
                      type: SoteriaButtonType.outlined,
                      onPressed: onSkip,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
