import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

/// AuthUser represents the core identity of a logged-in user in the domain layer.
@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String id,
    required String email,
    required String username,
    String? avatarUrl,
    @Default(false) bool isGuest,
  }) = _AuthUser;
}
