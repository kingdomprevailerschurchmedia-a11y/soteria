import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/recovery_status.dart';
import '../domain/entities/recovery_session.dart';
import '../domain/repositories/auth_repository.dart';
import '../presentation/providers/auth_providers.dart';
import '../../../core/analytics/analytics_provider.dart';
import '../../../core/analytics/analytics_event.dart';

part 'recovery_controller.g.dart';

/// Notifier that manages the multi-step account recovery process.
@riverpod
class RecoveryController extends _$RecoveryController {
  late AuthenticationRepository _repository;
  Timer? _timer;

  @override
  RecoverySession build() {
    _repository = ref.watch(authenticationRepositoryProvider);
    ref.onDispose(() => _timer?.cancel());
    return const RecoverySession(status: RecoveryStatus.idle);
  }

  /// Requests a password reset code for the given email.
  Future<void> requestReset(String email) async {
    state = state.copyWith(status: RecoveryStatus.loading, email: email);
    
    final result = await _repository.requestPasswordReset(email);
    
    if (!ref.mounted) return;

    if (result.isSuccess) {
      state = state.copyWith(
        status: RecoveryStatus.codeSent,
        resendCountdown: 60,
      );
      _startCountdown();
      unawaited(ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('recovery_requested')));
    } else {
      state = state.copyWith(status: RecoveryStatus.failure);
    }
  }

  /// Verifies the recovery code entered by the user.
  Future<void> verifyCode(String code) async {
    if (state.email == null) return;
    
    state = state.copyWith(status: RecoveryStatus.loading);
    final result = await _repository.verifyRecoveryCode(
      email: state.email!,
      code: code,
    );

    if (!ref.mounted) return;

    if (result.isSuccess) {
      state = state.copyWith(status: RecoveryStatus.codeVerified, isVerified: true);
      _timer?.cancel();
      unawaited(ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('recovery_code_verified')));
    } else {
      state = state.copyWith(status: RecoveryStatus.failure);
    }
  }

  /// Resets the password using the new credentials.
  Future<void> resetPassword(String newPassword, String verificationCode) async {
    if (state.email == null) return;

    state = state.copyWith(status: RecoveryStatus.loading);
    final result = await _repository.resetPassword(
      email: state.email!,
      newPassword: newPassword,
      verificationCode: verificationCode,
    );

    if (!ref.mounted) return;

    if (result.isSuccess) {
      state = state.copyWith(status: RecoveryStatus.success);
      unawaited(ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('password_reset_completed')));
    } else {
      state = state.copyWith(status: RecoveryStatus.failure);
    }
  }

  /// Resends the recovery code and restarts the countdown.
  Future<void> resendCode() async {
    if (state.email == null || !state.canResend) return;

    state = state.copyWith(status: RecoveryStatus.loading);
    final result = await _repository.resendRecoveryCode(state.email!);

    if (!ref.mounted) return;

    if (result.isSuccess) {
      state = state.copyWith(
        status: RecoveryStatus.codeSent,
        resendCountdown: 60,
      );
      _startCountdown();
      unawaited(ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('recovery_code_resent')));
    } else {
      state = state.copyWith(status: RecoveryStatus.failure);
    }
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.resendCountdown > 0) {
        state = state.copyWith(resendCountdown: state.resendCountdown - 1);
      } else {
        _timer?.cancel();
      }
    });
  }

  void reset() {
    _timer?.cancel();
    state = const RecoverySession(status: RecoveryStatus.idle);
  }
}
