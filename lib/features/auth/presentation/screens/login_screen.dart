import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/utils/app_animations.dart';
import '../../../../core/widgets/inputs/soteria_text_field.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../../../../core/services/ui_service.dart';
import '../../../../core/navigation/navigation_constants.dart';
import '../../application/auth_controller.dart';
import '../providers/auth_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = true;
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      await ref.read(authControllerProvider.notifier).signIn(
        _emailController.text,
        _passwordController.text,
        rememberMe: _rememberMe,
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
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authStateProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(SoteriaSpacing.s24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: SoteriaSpacing.s64),
                AppAnimations.scaleIn(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(SoteriaSpacing.s24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.shield_rounded, size: 64, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: SoteriaSpacing.s40),
                Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: SoteriaSpacing.s8),
                const Text(
                  'Log in to your scholar account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: SoteriaSpacing.s64),
                
                AppAnimations.slideIn(
                  child: SoteriaTextField(
                    controller: _emailController,
                    label: 'Email Address',
                    hintText: 'name@example.com',
                    type: SoteriaTextFieldType.email,
                    prefixIcon: const Icon(Icons.email_outlined),
                    validator: (v) => (v == null || !v.contains('@')) ? 'Invalid email' : null,
                  ),
                ),
                const SizedBox(height: SoteriaSpacing.s16),
                AppAnimations.slideIn(
                  child: SoteriaTextField(
                    controller: _passwordController,
                    label: 'Password',
                    hintText: 'Enter your password',
                    type: SoteriaTextFieldType.password,
                    prefixIcon: const Icon(Icons.lock_outline),
                    validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                  ),
                ),
                
                const SizedBox(height: SoteriaSpacing.s16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (v) => setState(() => _rememberMe = v ?? false),
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        const Text('Remember Me', style: TextStyle(fontSize: 13)),
                      ],
                    ),
                    TextButton(
                      onPressed: () => context.pushNamed(NavigationConstants.forgotPasswordName),
                      child: const Text('Forgot Password?', style: TextStyle(fontSize: 13)),
                    ),
                  ],
                ),

                const SizedBox(height: SoteriaSpacing.s40),
                SoteriaButton(
                  onPressed: _onLogin,
                  label: 'LOGIN',
                  isLoading: auth.isLoading,
                ),
                
                if (_canCheckBiometrics) ...[
                  const SizedBox(height: SoteriaSpacing.s16),
                  SoteriaButton(
                    onPressed: () => ref.read(authControllerProvider.notifier).signInWithBiometrics(),
                    label: 'USE BIOMETRICS',
                    type: SoteriaButtonType.outlined,
                    icon: Icons.fingerprint_rounded,
                  ),
                ],

                const SizedBox(height: SoteriaSpacing.s64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () => context.pushNamed(NavigationConstants.registerName),
                      child: const Text('SIGN UP'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
