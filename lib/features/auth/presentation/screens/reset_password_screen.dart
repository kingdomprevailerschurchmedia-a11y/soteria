import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/utils/app_animations.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/inputs/soteria_text_field.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../../application/recovery_controller.dart';
import '../../domain/entities/recovery_status.dart';
import '../widgets/recovery/recovery_step_indicator.dart';
import '../widgets/registration/password_strength_meter.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      // In a real app, we'd pass the actual verification code from state
      await ref.read(recoveryControllerProvider.notifier).resetPassword(
        _passwordController.text,
        'mock_verified_code',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final recovery = ref.watch(recoveryControllerProvider);

    ref.listen(recoveryControllerProvider, (prev, next) {
      if (next.status == RecoveryStatus.success) {
        context.pushReplacementNamed('recovery-success');
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
        title: const RecoveryStepIndicator(currentStep: 2),
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
                  'Create New Password',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: SoteriaSpacing.s12),
                const Text(
                  'Your identity is verified. Please choose a strong new password to secure your account.',
                  style: TextStyle(color: Colors.grey, height: 1.5),
                ),
                const SizedBox(height: SoteriaSpacing.s48),
                AppAnimations.slideIn(
                  child: Column(
                    children: [
                      SoteriaTextField(
                        controller: _passwordController,
                        label: 'New Password',
                        hintText: 'Enter new password',
                        type: SoteriaTextFieldType.password,
                        prefixIcon: const Icon(Icons.lock_outline),
                        validator: Validators.password,
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: SoteriaSpacing.s16),
                      PasswordStrengthMeter(password: _passwordController.text),
                      const SizedBox(height: SoteriaSpacing.s24),
                      SoteriaTextField(
                        controller: _confirmController,
                        label: 'Confirm New Password',
                        hintText: 'Repeat new password',
                        type: SoteriaTextFieldType.password,
                        prefixIcon: const Icon(Icons.lock_reset),
                        validator: (v) => Validators.confirmPassword(v, _passwordController.text),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: SoteriaSpacing.s64),
                SoteriaButton(
                  onPressed: _onSubmit,
                  label: 'RESET PASSWORD',
                  isLoading: recovery.status == RecoveryStatus.loading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
