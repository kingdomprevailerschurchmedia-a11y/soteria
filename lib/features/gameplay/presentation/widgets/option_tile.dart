import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/cards/soteria_card.dart';
import '../../domain/entities/question_option.dart';

enum OptionState {
  idle,
  selected,
  correct,
  incorrect,
  locked,
  disabled,
}

class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.option,
    required this.state,
    required this.onTap,
    this.percentage,
    this.showCorrectness = false,
  });

  final QuestionOption option;
  final OptionState state;
  final VoidCallback onTap;
  final double? percentage;
  final bool showCorrectness;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = state == OptionState.disabled || state == OptionState.locked;
    final bool isSelected = state == OptionState.selected || 
                           state == OptionState.correct || 
                           state == OptionState.incorrect;
    
    return AnimatedOpacity(
      duration: SoteriaAnimations.fast,
      opacity: state == OptionState.disabled ? 0.3 : 1.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: SoteriaSpacing.s12),
        child: AnimatedContainer(
          duration: SoteriaAnimations.fast,
          curve: SoteriaAnimations.standard,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SoteriaRadius.surface),
            boxShadow: isSelected ? [
              BoxShadow(
                color: _getBorderColor().withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ] : null,
          ),
          child: SoteriaCard(
            onTap: isDisabled ? null : onTap,
            borderColor: _getBorderColor(),
            padding: EdgeInsets.zero,
            child: Stack(
              children: [
                if (percentage != null)
                  Positioned.fill(
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: percentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: SoteriaColors.primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(SoteriaRadius.surface),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SoteriaSpacing.s16,
                    vertical: SoteriaSpacing.s12,
                  ),
                  child: Row(
                    children: [
                      _buildIndicator(),
                      const SizedBox(width: SoteriaSpacing.s16),
                      Expanded(
                        child: Text(
                          option.text,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: _getTextColor(),
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                      if (percentage != null)
                        Text(
                          '${(percentage! * 100).toInt()}%',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: SoteriaColors.textSecondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    final color = _getBorderColor();
    final IconData? icon = _getIcon();

    return AnimatedContainer(
      duration: SoteriaAnimations.fast,
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 2,
        ),
        color: (state == OptionState.selected || state == OptionState.correct || state == OptionState.incorrect) 
            ? color 
            : Colors.transparent,
      ),
      child: icon != null 
          ? Icon(icon, size: 16, color: Colors.white)
          : null,
    );
  }

  Color _getBorderColor() {
    switch (state) {
      case OptionState.correct:
        return SoteriaColors.success;
      case OptionState.incorrect:
        return SoteriaColors.error;
      case OptionState.selected:
        return SoteriaColors.primary;
      case OptionState.locked:
        return SoteriaColors.outline;
      case OptionState.disabled:
        return SoteriaColors.outline.withOpacity(0.5);
      case OptionState.idle:
        return SoteriaColors.outline;
    }
  }

  Color _getTextColor() {
    switch (state) {
      case OptionState.correct:
        return SoteriaColors.success;
      case OptionState.incorrect:
        return SoteriaColors.error;
      case OptionState.selected:
        return SoteriaColors.primary;
      case OptionState.disabled:
        return SoteriaColors.textDisabled;
      default:
        return SoteriaColors.textPrimary;
    }
  }

  IconData? _getIcon() {
    switch (state) {
      case OptionState.correct:
        return Icons.check;
      case OptionState.incorrect:
        return Icons.close;
      case OptionState.selected:
        return Icons.check;
      default:
        return null;
    }
  }
}
