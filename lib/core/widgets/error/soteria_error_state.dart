import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../buttons/soteria_button.dart';

/// SoteriaErrorState displays an error message and an optional retry button.
class SoteriaErrorState extends StatelessWidget {
  const SoteriaErrorState({
    super.key,
    required this.message,
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(SoteriaSpacing.s32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(SoteriaIcons.error, size: 80, color: SoteriaColors.error),
            const SizedBox(height: SoteriaSpacing.s24),
            Text(
              'Oops! Something went wrong',
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
