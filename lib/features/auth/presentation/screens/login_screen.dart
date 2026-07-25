import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/widget_previews.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/utils/app_animations.dart';
import '../../../../core/widgets/forms/soteria_text_field.dart';
import '../../../../core/widgets/shared/soteria_button.dart';
import '../../../../core/services/ui_service.dart';
import '../../../../core/routes/route_constants.dart';
import '../providers/auth_provider.dart';

/// LoginScreen allows users to authenticate with their existing credentials.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      await ref.read(authProvider.notifier).login(
        _emailController.text,
        _passwordController.text,
      );

      final authState = ref.read(authProvider);
      if (authState.isFailure) {
        if (mounted) {
          ref.read(uiServiceProvider).showSnackBar(
            context: context,
            message: authState.failureOrNull?.message ?? 'Login failed',
            type: SnackBarType.error,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

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
                  child: const Center(
                    child: FlutterLogo(size: 80),
                  ),
                ),
                const SizedBox(height: SoteriaSpacing.s40),
                Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: SoteriaSpacing.s8),
                Text(
                  'Log in to continue your journey.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: SoteriaSpacing.s64),
                
                AppAnimations.slideIn(
                  child: SoteriaTextField(
                    controller: _emailController,
                    label: 'Email Address',
                    hintText: 'name@example.com',
                    prefixIcon: const Icon(Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) => (v == null || !v.contains('@')) ? 'Invalid email' : null,
                  ),
                ),
                const SizedBox(height: SoteriaSpacing.s16),
                AppAnimations.slideIn(
                  child: SoteriaTextField(
                    controller: _passwordController,
                    label: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    obscureText: true,
                    validator: (v) => (v == null || v.length < 6) ? 'Password too short' : null,
                  ),
                ),
                const SizedBox(height: SoteriaSpacing.s64),
                
                SoteriaButton(
                  onPressed: _onLogin,
                  label: 'LOGIN',
                  isLoading: authState.isLoading,
                ),
                const SizedBox(height: SoteriaSpacing.s24),
                
                TextButton(
                  onPressed: () => context.pushNamed(RouteConstants.home), // Placeholder for testing
                  child: const Text('FORGOT PASSWORD?'),
                ),
                
                const SizedBox(height: SoteriaSpacing.s80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () => context.pushNamed(RouteConstants.register),
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

// --- Previews ---

@Preview(name: 'Auth - Login')
Widget loginPreview() {
  return const ProviderScope(
    child: MaterialApp(
      home: LoginScreen(),
    ),
  );
}
