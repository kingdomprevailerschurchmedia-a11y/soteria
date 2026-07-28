import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../buttons/soteria_button.dart';

/// SoteriaDialog provides standardized pop-up windows.
class SoteriaDialog extends StatelessWidget {
  const SoteriaDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel = 'OK',
    this.cancelLabel,
    this.onConfirm,
    this.onCancel,
    this.isDangerous = false,
    this.icon,
    this.iconColor,
  });

  final String title;
  final String message;
  final String confirmLabel;
  final String? cancelLabel;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool isDangerous;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SoteriaRadius.xl)),
      titlePadding: const EdgeInsets.fromLTRB(SoteriaSpacing.s24, SoteriaSpacing.s24, SoteriaSpacing.s24, 0),
      contentPadding: const EdgeInsets.fromLTRB(SoteriaSpacing.s24, SoteriaSpacing.s16, SoteriaSpacing.s24, SoteriaSpacing.s24),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 48, color: iconColor ?? Theme.of(context).primaryColor),
            const SizedBox(height: SoteriaSpacing.s16),
          ],
          Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade700),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.fromLTRB(SoteriaSpacing.s24, 0, SoteriaSpacing.s24, SoteriaSpacing.s24),
      actions: [
        if (cancelLabel != null)
          SoteriaButton(
            onPressed: onCancel ?? () => Navigator.of(context).pop(),
            label: cancelLabel!,
            type: SoteriaButtonType.text,
            fullWidth: false,
          ),
        SoteriaButton(
          onPressed: onConfirm ?? () => Navigator.of(context).pop(),
          label: confirmLabel,
          type: isDangerous ? SoteriaButtonType.destructive : SoteriaButtonType.primary,
          fullWidth: cancelLabel == null,
        ),
      ],
    );
  }
}
