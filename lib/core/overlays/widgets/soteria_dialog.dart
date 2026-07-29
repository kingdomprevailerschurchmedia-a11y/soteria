import 'package:flutter/material.dart';
import 'package:soteria/core/design_system/design_system.dart';

/// Reusable premium dialog component for Soteria.
class SoteriaDialog extends StatelessWidget {
  const SoteriaDialog({
    super.key,
    required this.title,
    this.content,
    this.actions,
  });

  final String title;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: SoteriaColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SoteriaRadius.l)),
      child: Padding(
        padding: const EdgeInsets.all(SoteriaSpacing.s24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: SoteriaTypography.headlineSmall),
            if (content != null) ...[
              const SizedBox(height: SoteriaSpacing.s16),
              content!,
            ],
            if (actions != null) ...[
              const SizedBox(height: SoteriaSpacing.s24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
