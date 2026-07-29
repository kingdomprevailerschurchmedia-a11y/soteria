import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/utils/app_animations.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../../../../core/services/ui_service.dart';
import '../../../../core/navigation/navigation_constants.dart';
import '../../application/auth_controller.dart';
import '../providers/auth_providers.dart';
import '../widgets/login/login_form.dart';
import '../widgets/social_auth_section.dart';
import '../widgets/auth_footer.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _canCheckBiometrics = false;

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
  }

  Future<void> _checkBiometrics() async {
    final auth = LocalAuthentication();
    final canCheck = await auth.canCheckBiometrics;
    if (mounted) setState(() => _canCheckBiometrics = canCheck);
  }

  Future<void> _onLogin(String email, String password, bool rememberMe) async {
    await ref.read(authControllerProvider.notifier).signIn(
      email,
      password,
      rememberMe: rememberMe,
    );

    final auth = ref.read(authStateProvider);
    if (auth.failure != null && mounted) {
      ref.read(uiServiceProvider).showSnackBar(
        context: context,
        message: auth.failure!.message,
        type: SnackBarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authStateProvider.select((s) => s.isLoading));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(SoteriaSpacing.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: SoteriaSpacing.s48),
              
              // Animated Hero Section
              AppAnimations.scaleIn(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(SoteriaSpacing.s24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.shield_rounded, 
                      size: 64, 
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: SoteriaSpacing.s32),
              
              AppAnimations.slideIn(
                child: Column(
                  children: [
                    Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: SoteriaSpacing.s8),
                    const Text(
                      'Log in to your scholar account.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: SoteriaSpacing.s48),
              
              // Login Form Component
              AppAnimations.slideIn(
                delay: const Duration(milliseconds: 200),
                child: LoginForm(
                  onLogin: _onLogin,
                  isLoading: isLoading,
                ),
              ),
              
              const SizedBox(height: SoteriaSpacing.s32),

              // Social Auth Section
              AppAnimations.fadeIn(
                delay: const Duration(milliseconds: 400),
                child: SocialAuthSection(
                  onGooglePressed: () {}, // Future implementation
                  onApplePressed: () {},  // Future implementation
                ),
              ),

              const SizedBox(height: SoteriaSpacing.s32),

              // Alternative Actions
              AppAnimations.fadeIn(
                delay: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    if (_canCheckBiometrics)
                      SoteriaButton(
                        onPressed: () => ref.read(authControllerProvider.notifier).signInWithBiometrics(),
                        label: 'USE BIOMETRICS',
                        type: SoteriaButtonType.outlined,
                        icon: Icons.fingerprint_rounded,
                        fullWidth: false,
                      ),
                    
                    const SizedBox(height: SoteriaSpacing.s16),
                    
                    TextButton(
                      onPressed: () => ref.read(authControllerProvider.notifier).signInAsGuest(),
                      child: const Text('CONTINUE AS GUEST'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: SoteriaSpacing.s32),

              // Auth Footer
              AppAnimations.fadeIn(
                delay: const Duration(milliseconds: 600),
                child: AuthFooter(
                  message: "Don't have an account?",
                  actionLabel: 'SIGN UP',
                  onActionPressed: () => context.pushNamed(NavigationConstants.registerName),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
