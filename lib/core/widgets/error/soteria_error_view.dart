import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../buttons/soteria_button.dart';

/// Types of error views to display different content and severity.
enum SoteriaErrorType { fatal, retry, unexpected }

/// Full-screen error view with premium design system styling.
class SoteriaErrorView extends StatelessWidget {
  const SoteriaErrorView({
    super.key,
    required this.message,
    this.type = SoteriaErrorType.unexpected,
    this.onActionPressed,
    this.actionLabel,
  });

  final String message;
  final SoteriaErrorType type;
  final VoidCallback? onActionPressed;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(SoteriaSpacing.s32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIcon(context),
              const SizedBox(height: SoteriaSpacing.s32),
              Text(
                _getTitle(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: SoteriaSpacing.s16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(height: SoteriaSpacing.s48),
              if (onActionPressed != null)
                SoteriaButton(
                  onPressed: onActionPressed!,
                  label: actionLabel ?? _getDefaultActionLabel(),
                  type: type == SoteriaErrorType.fatal 
                      ? SoteriaButtonType.destructive 
                      : SoteriaButtonType.primary,
                  fullWidth: false,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    IconData icon;
    Color color;

    switch (type) {
      case SoteriaErrorType.fatal:
        icon = Icons.error_outline_rounded;
        color = SoteriaColors.error;
        break;
      case SoteriaErrorType.retry:
        icon = Icons.refresh_rounded;
        color = Theme.of(context).primaryColor;
        break;
      case SoteriaErrorType.unexpected:
        icon = Icons.sentiment_very_dissatisfied_rounded;
        color = Colors.orange;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 64, color: color),
    );
  }

  String _getTitle() {
    switch (type) {
      case SoteriaErrorType.fatal: return 'Critical Error';
      case SoteriaErrorType.retry: return 'Connection Lost';
      case SoteriaErrorType.unexpected: return 'Something Went Wrong';
    }
  }

  String _getDefaultActionLabel() {
    switch (type) {
      case SoteriaErrorType.fatal: return 'RESTART APP';
      case SoteriaErrorType.retry: return 'RETRY';
      case SoteriaErrorType.unexpected: return 'GO HOME';
    }
  }
}
