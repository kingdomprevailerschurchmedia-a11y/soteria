import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../domain/entities/assist_type.dart';
import '../../domain/entities/assist_usage.dart';
import '../../domain/entities/assist_status.dart';

class AssistButton extends StatelessWidget {
  const AssistButton({
    super.key,
    required this.usage,
    required this.onTap,
    this.isLoading = false,
  });

  final AssistUsage usage;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final isUsed = usage.status == AssistStatus.used;
    final isDisabled = usage.status == AssistStatus.disabled;

    return Semantics(
      button: true,
      label: 'Use ${usage.type.label} assist',
      hint: isUsed ? 'Already used this round' : 'Removes difficulty from the question',
      enabled: !isUsed && !isDisabled && !isLoading,
      child: Opacity(
        opacity: (isUsed || isDisabled) ? 0.4 : 1.0,
        child: InkWell(
          onTap: (isUsed || isDisabled || isLoading) ? null : onTap,
          borderRadius: BorderRadius.circular(SoteriaRadius.m),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: SoteriaSpacing.s12,
              vertical: SoteriaSpacing.s8,
            ),
            decoration: BoxDecoration(
              color: SoteriaColors.surfaceL2,
              borderRadius: BorderRadius.circular(SoteriaRadius.m),
              border: Border.all(
                color: isUsed ? Colors.transparent : SoteriaColors.outline,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLoading)
                  const SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  Text(usage.type.icon, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: SoteriaSpacing.s8),
                Text(
                  isUsed ? 'Used' : usage.type.label,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isUsed ? SoteriaColors.textDisabled : SoteriaColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
