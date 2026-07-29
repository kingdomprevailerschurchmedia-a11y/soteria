import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/utils/app_animations.dart';
import '../../../../core/widgets/inputs/soteria_otp_field.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../../application/recovery_controller.dart';
import '../../domain/entities/recovery_status.dart';
import '../widgets/recovery/recovery_step_indicator.dart';
import '../widgets/recovery/countdown_timer_widget.dart';

class VerifyCodeScreen extends ConsumerStatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  ConsumerState<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends ConsumerState<VerifyCodeScreen> {
  String _code = '';

  Future<void> _onVerify() async {
    if (_code.length == 6) {
      await ref.read(recoveryControllerProvider.notifier).verifyCode(_code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final recovery = ref.watch(recoveryControllerProvider);

    ref.listen(recoveryControllerProvider, (prev, next) {
      if (next.status == RecoveryStatus.codeVerified) {
        context.pushNamed('reset-password');
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
        title: const RecoveryStepIndicator(currentStep: 1),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(SoteriaSpacing.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: SoteriaSpacing.s40),
              Text(
                'Verify Identity',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: SoteriaSpacing.s12),
              Text.rich(
                TextSpan(
                  text: 'Enter the 6-digit code we sent to ',
                  children: [
                    TextSpan(
                      text: recovery.email ?? 'your email',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: SoteriaColors.textPrimary),
                    ),
                  ],
                ),
                style: const TextStyle(color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: SoteriaSpacing.s48),
              AppAnimations.slideIn(
                child: SoteriaOtpField(
                  length: 6,
                  onChanged: (v) => _code = v,
                  enabled: recovery.status != RecoveryStatus.loading,
                ),
              ),
              const SizedBox(height: SoteriaSpacing.s32),
              CountdownTimerWidget(
                seconds: recovery.resendCountdown,
                onResend: () => ref.read(recoveryControllerProvider.notifier).resendCode(),
              ),
              const SizedBox(height: SoteriaSpacing.s64),
              SoteriaButton(
                onPressed: _onVerify,
                label: 'VERIFY CODE',
                isLoading: recovery.status == RecoveryStatus.loading,
                isDisabled: _code.length != 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
