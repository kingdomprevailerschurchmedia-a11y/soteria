import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../buttons/soteria_button.dart';

/// SoteriaErrorState displays an error message and an optional retry button.
class SoteriaErrorState extends StatelessWidget {
  const SoteriaErrorState({
    super.key,
    required this.message,
    this.title = 'Oops! Something went wrong',
    this.icon = SoteriaIcons.error,
    this.onRetry,
  });

  final String message;
  final String title;
  final IconData icon;
  final VoidCallback? onRetry;

  /// Convenience constructor for offline state.
  static Widget offline({VoidCallback? onRetry}) {
    return SoteriaErrorState(
      title: 'Connection Lost',
      message: 'It seems you are offline. Please check your internet connection and try again.',
      icon: Icons.wifi_off_rounded,
      onRetry: onRetry,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(SoteriaSpacing.s32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: SoteriaColors.error),
            const SizedBox(height: SoteriaSpacing.s24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: SoteriaSpacing.s8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: SoteriaSpacing.s32),
              SoteriaButton(
                onPressed: onRetry,
                label: 'RETRY',
                type: SoteriaButtonType.outlined,
                fullWidth: false,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
