import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_session.freezed.dart';

/// Represents an active authentication session.
@freezed
abstract class AuthSession with _$AuthSession {
  const factory AuthSession({
    required String accessToken,
    required DateTime expiresAt,
    String? refreshToken,
    @Default(false) bool isPersistent,
  }) = _AuthSession;

  const AuthSession._();

  /// Returns true if the session is still valid.
  bool get isValid => DateTime.now().isBefore(expiresAt);
}
