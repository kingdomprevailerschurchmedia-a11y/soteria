import 'package:flutter/material.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../../domain/entities/auth_provider_type.dart';

/// A set of premium social authentication buttons.
class SoteriaSocialButton extends StatelessWidget {
  const SoteriaSocialButton({
    super.key,
    required this.provider,
    required this.onPressed,
    this.isLoading = false,
  });

  final AuthProviderType provider;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SoteriaButton(
      onPressed: onPressed,
      label: 'Continue with ${provider.displayName}',
      type: SoteriaButtonType.outlined,
      isLoading: isLoading,
      icon: _getIcon(),
      fullWidth: true,
    );
  }

  IconData _getIcon() {
    switch (provider) {
      case AuthProviderType.google: return Icons.g_mobiledata_rounded;
      case AuthProviderType.apple: return Icons.apple_rounded;
      case AuthProviderType.phone: return Icons.phone_android_rounded;
      default: return Icons.login_rounded;
    }
  }
}

class GuestSignInButton extends StatelessWidget {
  const GuestSignInButton({super.key, required this.onPressed, this.isLoading = false});
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: const Icon(Icons.person_outline_rounded),
      label: const Text('CONTINUE AS GUEST'),
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey.shade600,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
