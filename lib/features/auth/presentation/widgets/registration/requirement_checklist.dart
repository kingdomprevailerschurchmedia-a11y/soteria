import 'package:flutter/material.dart';
import '../../../../../core/design_system/design_system.dart';

class RequirementChecklist extends StatelessWidget {
  const RequirementChecklist({super.key, required this.password});
  final String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RequirementItem(
          label: 'At least 8 characters',
          isMet: password.length >= 8,
        ),
        _RequirementItem(
          label: 'Uppercase letter (A-Z)',
          isMet: password.contains(RegExp(r'[A-Z]')),
        ),
        _RequirementItem(
          label: 'Lowercase letter (a-z)',
          isMet: password.contains(RegExp(r'[a-z]')),
        ),
        _RequirementItem(
          label: 'One number (0-9)',
          isMet: password.contains(RegExp(r'[0-9]')),
        ),
        _RequirementItem(
          label: 'Special character (!@#\$%)',
          isMet: password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
        ),
      ],
    );
  }
}

class _RequirementItem extends StatelessWidget {
  const _RequirementItem({required this.label, required this.isMet});
  final String label;
  final bool isMet;

  @override
  Widget build(BuildContext context) {
    final color = isMet ? SoteriaColors.success : Colors.grey;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(
            isMet ? Icons.check_circle_rounded : Icons.circle_outlined,
            size: 14,
            color: color,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: isMet ? FontWeight.bold : null,
                ),
          ),
        ],
      ),
    );
  }
}
