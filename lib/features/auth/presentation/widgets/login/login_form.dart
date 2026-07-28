import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/inputs/soteria_text_field.dart';
import '../../../../core/navigation/navigation_constants.dart';
import 'package:go_router/go_router.dart';

/// Modular form component for the login screen.
class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.onLogin,
    this.isLoading = false,
  });

  final Function(String email, String password, bool rememberMe) onLogin;
  final bool isLoading;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = true;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onLogin(
        _emailController.text.trim(),
        _passwordController.text,
        _rememberMe,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SoteriaTextField(
            controller: _emailController,
            label: 'Email Address',
            hintText: 'scholar@soteria.app',
            type: SoteriaTextFieldType.email,
            prefixIcon: const Icon(Icons.email_outlined),
            validator: Validators.email,
            enabled: !widget.isLoading,
          ),
          const SizedBox(height: SoteriaSpacing.s24),
          SoteriaTextField(
            controller: _passwordController,
            label: 'Password',
            hintText: 'Enter your password',
            type: _isPasswordVisible ? SoteriaTextFieldType.standard : SoteriaTextFieldType.password,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility),
              onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
            ),
            validator: (v) => (v == null || v.isEmpty) ? 'Password is required' : null,
            enabled: !widget.isLoading,
          ),
          const SizedBox(height: SoteriaSpacing.s12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: widget.isLoading ? null : (v) => setState(() => _rememberMe = v ?? false),
                    activeColor: Theme.of(context).primaryColor,
                  ),
                  const Text('Remember Me', style: TextStyle(fontSize: 13)),
                ],
              ),
              TextButton(
                onPressed: widget.isLoading ? null : () => context.pushNamed(NavigationConstants.forgotPasswordName),
                child: const Text('Forgot Password?', style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
          const SizedBox(height: SoteriaSpacing.s32),
          ElevatedButton(
            onPressed: widget.isLoading ? null : _onLogin,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SoteriaRadius.m)),
            ),
            child: widget.isLoading 
                ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('LOGIN'),
          ),
        ],
      ),
    );
  }
}
