import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/utils/app_animations.dart';
import '../../../../core/navigation/navigation_constants.dart';
import '../../application/auth_controller.dart';
import '../providers/auth_providers.dart';
import '../../domain/entities/auth_provider_type.dart';
import '../widgets/social_auth_buttons.dart';
import '../widgets/auth_footer.dart';

/// The primary entry point for unauthenticated users, offering social-first login options.
class SocialLoginScreen extends ConsumerWidget {
  const SocialLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authStateProvider.select((s) => s.isLoading));
    final lastProvider = ref.watch(authStateProvider.select((s) => s.lastUsedProvider));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SoteriaSpacing.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              
              AppAnimations.scaleIn(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(SoteriaSpacing.s24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.auto_awesome_rounded, 
                      size: 80, 
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: SoteriaSpacing.s48),
              
              AppAnimations.slideIn(
                child: Column(
                  children: [
                    Text(
                      'Welcome to Soteria',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: SoteriaSpacing.s12),
                    Text(
                      'Join the elite arena of scholars and compete for glory.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: SoteriaSpacing.s64),

              AppAnimations.slideIn(
                delay: const Duration(milliseconds: 200),
                child: Column(
                  children: [
                    SoteriaSocialButton(
                      provider: AuthProviderType.google,
                      onPressed: () => ref.read(authControllerProvider.notifier).signInWithGoogle(),
                      isLoading: isLoading && lastProvider == AuthProviderType.google,
                    ),
                    const SizedBox(height: SoteriaSpacing.s16),
                    SoteriaSocialButton(
                      provider: AuthProviderType.apple,
                      onPressed: () => ref.read(authControllerProvider.notifier).signInWithApple(),
                      isLoading: isLoading && lastProvider == AuthProviderType.apple,
                    ),
                    const SizedBox(height: SoteriaSpacing.s16),
                    SoteriaSocialButton(
                      provider: AuthProviderType.phone,
                      onPressed: () => _showPhoneDialog(context, ref),
                      isLoading: isLoading && lastProvider == AuthProviderType.phone,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: SoteriaSpacing.s24),
              
              AppAnimations.fadeIn(
                delay: const Duration(milliseconds: 400),
                child: Column(
                  children: [
                    GuestSignInButton(
                      onPressed: () => ref.read(authControllerProvider.notifier).signInAsGuest(),
                      isLoading: isLoading && lastProvider == AuthProviderType.anonymous,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              AppAnimations.fadeIn(
                delay: const Duration(milliseconds: 600),
                child: Column(
                  children: [
                    const Divider(),
                    AuthFooter(
                      message: "Prefer your own credentials?",
                      actionLabel: 'LOG IN WITH EMAIL',
                      onActionPressed: () => context.pushNamed(NavigationConstants.loginEmailName),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPhoneDialog(BuildContext context, WidgetRef ref) {
    // Story 2.6 logic
  }
}
