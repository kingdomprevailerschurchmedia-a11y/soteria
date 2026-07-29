import 'package:flutter/material.dart';
import '../../../../../core/widgets/dialogs/soteria_dialogs.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key, required this.onConfirm});
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return SoteriaDialog(
      title: 'End Session?',
      message: 'Are you sure you want to log out? You will need to re-authenticate to access your profile and rewards.',
      confirmLabel: 'LOG OUT',
      cancelLabel: 'CANCEL',
      isDangerous: true,
      onConfirm: onConfirm,
    );
  }
}
