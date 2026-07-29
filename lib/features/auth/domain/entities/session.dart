import 'package:freezed_annotation/freezed_annotation.dart';
import 'session_status.dart';
import 'auth_user.dart';
import 'auth_token.dart';

part 'session.freezed.dart';

/// Represents a complete user session state.
@freezed
abstract class Session with _$Session {
  const factory Session({
    required SessionStatus status,
    AuthUser? user,
    AuthToken? token,
    DateTime? lastActivityAt,
    @Default(false) bool rememberMe,
  }) = _Session;

  const Session._();

  /// Returns true if the session is considered active and valid.
  bool get isActive => 
    (status == SessionStatus.authenticated || status == SessionStatus.guest) &&
    (token == null || token!.isValid);
}
