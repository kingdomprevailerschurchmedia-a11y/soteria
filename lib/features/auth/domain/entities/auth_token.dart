import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.freezed.dart';
part 'auth_token.g.dart';

/// Represents secure authentication tokens.
@freezed
abstract class AuthToken with _$AuthToken {
  const factory AuthToken({
    required String accessToken,
    required DateTime expiresAt,
    String? refreshToken,
  }) = _AuthToken;

  const AuthToken._();

  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);

  /// Returns true if the access token is still valid.
  bool get isValid => DateTime.now().isBefore(expiresAt);

  /// Returns true if the token is near expiration (e.g. within 5 minutes).
  bool get isNearExpiration => 
    DateTime.now().isAfter(expiresAt.subtract(const Duration(minutes: 5)));
}
