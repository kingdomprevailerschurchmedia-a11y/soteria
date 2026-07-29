import 'package:freezed_annotation/freezed_annotation.dart';
import 'recovery_status.dart';

part 'recovery_session.freezed.dart';

/// Holds the state and context of an active account recovery attempt.
@freezed
abstract class RecoverySession with _$RecoverySession {
  const factory RecoverySession({
    required RecoveryStatus status,
    String? email,
    String? phoneNumber,
    @Default(false) bool isVerified,
    DateTime? expiresAt,
    @Default(60) int resendCountdown,
  }) = _RecoverySession;

  const RecoverySession._();

  /// Returns true if a code can be resent.
  bool get canResend => resendCountdown <= 0;
}
