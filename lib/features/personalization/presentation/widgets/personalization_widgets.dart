import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/cards/soteria_card.dart';

class SelectionCard<T> extends StatelessWidget {
  const SelectionCard({
    super.key,
    required this.title,
    required this.value,
    required this.selectedValue,
    required this.onSelected,
    this.subtitle,
    this.icon,
  });

  final String title;
  final String? subtitle;
  final T value;
  final T selectedValue;
  final ValueChanged<T> onSelected;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == selectedValue;
    final theme = Theme.of(context);

    return SoteriaCard(
      onTap: () => onSelected(value),
      borderColor: isSelected ? theme.primaryColor : Colors.transparent,
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      child: Row(
        children: [
          if (icon != null) ...[
            Container(
              padding: const EdgeInsets.all(SoteriaSpacing.s12),
              decoration: BoxDecoration(
                color: isSelected 
                    ? theme.primaryColor.withValues(alpha: 0.1) 
                    : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: isSelected ? theme.primaryColor : Colors.grey),
            ),
            const SizedBox(width: SoteriaSpacing.s16),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? theme.primaryColor : null,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                  ),
              ],
            ),
          ),
          if (isSelected)
            Icon(Icons.check_circle_rounded, color: theme.primaryColor),
        ],
      ),
    );
  }
}

class ProgressHeader extends StatelessWidget {
  const ProgressHeader({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.onBack,
  });

  final int currentStep;
  final int totalSteps;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final progress = (currentStep + 1) / totalSteps;

    return Column(
      children: [
        Row(
          children: [
            if (onBack != null)
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: onBack,
              )
            else
              const SizedBox(width: 48),
            Expanded(
              child: Center(
                child: Text(
                  'Step ${currentStep + 1} of $totalSteps',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            const SizedBox(width: 48),
          ],
        ),
        const SizedBox(height: SoteriaSpacing.s8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(SoteriaRadius.full),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            ),
          ),
        ),
      ],
    );
  }
}
