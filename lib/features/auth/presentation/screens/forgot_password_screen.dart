import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/utils/app_animations.dart';
import '../../../../core/widgets/inputs/soteria_text_field.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../../application/auth_controller.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      await ref.read(authControllerProvider.notifier).sendPasswordResetEmail(_emailController.text);
      setState(() => _isSuccess = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SoteriaSpacing.s24),
          child: _isSuccess ? _buildSuccessView() : _buildFormView(),
        ),
      ),
    );
  }

  Widget _buildFormView() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: SoteriaSpacing.s40),
          Text(
            'Forgot Password?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: SoteriaSpacing.s12),
          const Text(
            'Enter your registered email below to receive password reset instructions.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: SoteriaSpacing.s48),
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
          const Spacer(),
          SoteriaButton(
            onPressed: _onSubmit,
            label: 'SEND INSTRUCTIONS',
          ),
          const SizedBox(height: SoteriaSpacing.s24),
        ],
      ),
    );
  }

  Widget _buildSuccessView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(SoteriaSpacing.s24),
          decoration: BoxDecoration(
            color: SoteriaColors.success.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.mark_email_read_outlined, size: 64, color: SoteriaColors.success),
        ),
        const SizedBox(height: SoteriaSpacing.s40),
        Text(
          'Check Your Email',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: SoteriaSpacing.s16),
        Text(
          'We have sent password reset instructions to ${_emailController.text}.',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: SoteriaSpacing.s64),
        SoteriaButton(
          onPressed: () => context.pop(),
          label: 'BACK TO LOGIN',
          type: SoteriaButtonType.outlined,
        ),
      ],
    );
  }
}
