import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/buttons/soteria_icon_button.dart';

/// UI placeholder for social authentication options (Google, Apple).
class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({
    super.key,
    required this.onGooglePressed,
    required this.onApplePressed,
  });

  final VoidCallback onGooglePressed;
  final VoidCallback onApplePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s16),
              child: Text(
                'OR CONTINUE WITH',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.grey,
                      letterSpacing: 1.2,
                    ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: SoteriaSpacing.s24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialButton(
              icon: Icons.g_mobiledata_rounded, // Replace with Google asset in future
              label: 'Google',
              onPressed: onGooglePressed,
            ),
            const SizedBox(width: SoteriaSpacing.s16),
            _SocialButton(
              icon: Icons.apple_rounded,
              label: 'Apple',
              onPressed: onApplePressed,
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 24),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: SoteriaSpacing.s24,
          vertical: SoteriaSpacing.s12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SoteriaRadius.m),
        ),
      ),
    );
  }
}
