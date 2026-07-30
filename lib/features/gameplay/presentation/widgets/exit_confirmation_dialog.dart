import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';

class ExitConfirmationDialog extends StatelessWidget {
  const ExitConfirmationDialog({
    super.key,
    required this.onConfirm,
  });

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: SoteriaColors.surfaceDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SoteriaRadius.l)),
      title: const Text('ABANDON MATCH?'),
      content: const Text('Your current progress will be lost. Are you sure you want to exit?'),
      actions: [
        SoteriaButton(
          label: 'CONTINUE PLAYING',
          onPressed: () => Navigator.of(context).pop(),
        ),
        const SizedBox(height: SoteriaSpacing.s8),
        SoteriaButton(
          label: 'ABANDON',
          type: SoteriaButtonType.outlined,
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.all(SoteriaSpacing.s16),
    );
  }
}
