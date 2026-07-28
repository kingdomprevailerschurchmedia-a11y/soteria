import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';

/// Standardized footer for authentication screens to switch between Login and Registration.
class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.message,
    required this.actionLabel,
    required this.onActionPressed,
  });

  final String message;
  final String actionLabel;
  final VoidCallback onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SoteriaSpacing.s24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          TextButton(
            onPressed: onActionPressed,
            child: Text(
              actionLabel,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
