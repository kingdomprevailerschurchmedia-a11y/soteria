import '../../domain/entities/auth_user.dart';
import '../models/auth_user_dto.dart';

/// Maps between Data Transfer Objects (DTOs) and Domain Entities.
class AuthMapper {
  /// Converts a [AuthUserDto] to an [AuthUser] entity.
  static AuthUser toEntity(AuthUserDto dto) {
    return AuthUser(
      id: dto.id,
      email: dto.email,
      username: dto.username,
      avatarUrl: dto.avatarUrl,
      isGuest: dto.isGuest,
    );
  }

  /// Converts an [AuthUser] entity back to a [AuthUserDto].
  static AuthUserDto toDto(AuthUser entity) {
    return AuthUserDto(
      id: entity.id,
      email: entity.email,
      username: entity.username,
      avatarUrl: entity.avatarUrl,
      isGuest: entity.isGuest,
    );
  }
}
