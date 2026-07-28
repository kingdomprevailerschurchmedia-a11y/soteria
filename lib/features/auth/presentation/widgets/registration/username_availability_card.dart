import 'package:flutter/material.dart';
import '../../../../../core/design_system/design_system.dart';

class UsernameAvailabilityCard extends StatelessWidget {
  const UsernameAvailabilityCard({
    super.key,
    required this.username,
    required this.isAvailable,
    required this.isChecking,
  });

  final String username;
  final bool isAvailable;
  final bool isChecking;

  @override
  Widget build(BuildContext context) {
    if (username.length < 3) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(SoteriaSpacing.s12),
      decoration: BoxDecoration(
        color: _getColor().withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(SoteriaRadius.m),
        border: Border.all(color: _getColor().withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          if (isChecking)
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else
            Icon(
              isAvailable ? Icons.check_circle_outline : Icons.error_outline,
              size: 16,
              color: _getColor(),
            ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              isChecking
                  ? 'Checking availability...'
                  : (isAvailable
                      ? 'Username "@$username" is available!'
                      : 'Username "@$username" is already taken.'),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: _getColor(),
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor() {
    if (isChecking) return Colors.blue;
    return isAvailable ? SoteriaColors.success : SoteriaColors.error;
  }
}
