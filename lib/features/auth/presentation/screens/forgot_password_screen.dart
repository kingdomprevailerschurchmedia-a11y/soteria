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

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      await ref.read(recoveryControllerProvider.notifier).requestReset(_emailController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    final recovery = ref.watch(recoveryControllerProvider);

    // Listen for status changes to navigate
    ref.listen(recoveryControllerProvider, (prev, next) {
      if (next.status == RecoveryStatus.codeSent) {
        context.pushNamed('verify-recovery');
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            ref.read(recoveryControllerProvider.notifier).reset();
            context.pop();
          },
        ),
        title: const RecoveryStepIndicator(currentStep: 0),
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
                  'Account Recovery',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: SoteriaSpacing.s12),
                const Text(
                  'Enter your registered email below. We will send you a 6-digit verification code to reset your password.',
                  style: TextStyle(color: Colors.grey, height: 1.5),
                ),
                const SizedBox(height: SoteriaSpacing.s48),
                AppAnimations.slideIn(
                  child: SoteriaTextField(
                    controller: _emailController,
                    label: 'Email Address',
                    hintText: 'scholar@soteria.app',
                    type: SoteriaTextFieldType.email,
                    prefixIcon: const Icon(Icons.email_outlined),
                    validator: Validators.email,
                    enabled: recovery.status != RecoveryStatus.loading,
                  ),
                ),
                const SizedBox(height: SoteriaSpacing.s64),
                SoteriaButton(
                  onPressed: _onSubmit,
                  label: 'SEND VERIFICATION CODE',
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
