import 'package:flutter/material.dart';
import '../../../../../core/design_system/design_system.dart';

enum PasswordStrength { weak, fair, good, strong }

class PasswordStrengthMeter extends StatelessWidget {
  const PasswordStrengthMeter({super.key, required this.password});
  final String password;

  @override
  Widget build(BuildContext context) {
    final strength = _calculateStrength();
    final color = _getColor(strength);
    final label = _getLabel(strength);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Security Strength',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: SoteriaSpacing.s8),
        Row(
          children: List.generate(4, (index) {
            final isActive = index <= strength.index;
            return Expanded(
              child: Container(
                height: 4,
                margin: EdgeInsets.only(right: index < 3 ? 4 : 0),
                decoration: BoxDecoration(
                  color: isActive ? color : Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(SoteriaRadius.full),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  PasswordStrength _calculateStrength() {
    if (password.isEmpty) return PasswordStrength.weak;
    int points = 0;
    if (password.length >= 8) points++;
    if (password.contains(RegExp(r'[A-Z]'))) points++;
    if (password.contains(RegExp(r'[0-9]'))) points++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) points++;

    if (points <= 1) return PasswordStrength.weak;
    if (points == 2) return PasswordStrength.fair;
    if (points == 3) return PasswordStrength.good;
    return PasswordStrength.strong;
  }

  Color _getColor(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.weak: return SoteriaColors.error;
      case PasswordStrength.fair: return Colors.orange;
      case PasswordStrength.good: return Colors.blue;
      case PasswordStrength.strong: return SoteriaColors.success;
    }
  }

  String _getLabel(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.weak: return 'WEAK';
      case PasswordStrength.fair: return 'FAIR';
      case PasswordStrength.good: return 'GOOD';
      case PasswordStrength.strong: return 'STRONG';
    }
  }
}
