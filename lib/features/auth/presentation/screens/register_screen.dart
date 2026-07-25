import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widget_previews.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/utils/app_animations.dart';
import '../../../../core/widgets/forms/soteria_text_field.dart';
import '../../../../core/widgets/shared/soteria_button.dart';
import '../../../../core/services/ui_service.dart';
import '../providers/auth_provider.dart';

/// RegisterScreen allows new users to create an account.
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onRegister() async {
    if (_formKey.currentState?.validate() ?? false) {
      await ref.read(authProvider.notifier).register(
        _emailController.text,
        _passwordController.text,
        _usernameController.text,
      );

      final authState = ref.read(authProvider);
      if (authState.isFailure) {
        if (mounted) {
          ref.read(uiServiceProvider).showSnackBar(
            context: context,
            message: authState.failureOrNull?.message ?? 'Registration failed',
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
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(SoteriaSpacing.s24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: SoteriaSpacing.s40),
                Text(
                  'Join Soteria',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: SoteriaSpacing.s8),
                const Text(
                  'Enter your details to start competing.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: SoteriaSpacing.s64),
                
                AppAnimations.slideIn(
                  child: SoteriaTextField(
                    controller: _usernameController,
                    label: 'Username',
                    hintText: 'e.g. ScholarKing',
                    prefixIcon: const Icon(Icons.person_outline),
                    validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                  ),
                ),
                const SizedBox(height: SoteriaSpacing.s16),
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
                    hintText: 'Minimum 6 characters',
                    prefixIcon: const Icon(Icons.lock_outline),
                    obscureText: true,
                    validator: (v) => (v == null || v.length < 6) ? 'Password too short' : null,
                  ),
                ),
                const SizedBox(height: SoteriaSpacing.s64),
                
                SoteriaButton(
                  onPressed: _onRegister,
                  label: 'CREATE ACCOUNT',
                  isLoading: authState.isLoading,
                ),
                const SizedBox(height: SoteriaSpacing.s24),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('LOG IN'),
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

@Preview(name: 'Auth - Register')
Widget registerPreview() {
  return const ProviderScope(
    child: MaterialApp(
      home: RegisterScreen(),
    ),
  );
}
