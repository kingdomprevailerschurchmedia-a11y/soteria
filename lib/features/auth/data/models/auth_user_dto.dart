import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/auth_user.dart';

part 'auth_user_dto.freezed.dart';
part 'auth_user_dto.g.dart';

/// AuthUserDto is the data transfer object for user identity.
/// It handles JSON serialization for API communication.
@freezed
abstract class AuthUserDto with _$AuthUserDto {
  const factory AuthUserDto({
    required String id,
    required String email,
    required String username,
    String? avatarUrl,
    @Default(false) bool isGuest,
  }) = _AuthUserDto;

  const AuthUserDto._();

  factory AuthUserDto.fromJson(Map<String, dynamic> json) =>
      _$AuthUserDtoFromJson(json);

  /// Converts the DTO to a Domain Entity.
  AuthUser toEntity() => AuthUser(
        id: id,
        email: email,
        username: username,
        avatarUrl: avatarUrl,
        isGuest: isGuest,
      );
}
