import '../../domain/entities/session.dart';
import '../../domain/entities/session_status.dart';
import '../models/auth_user_dto.dart';
import 'auth_mapper.dart';
import '../../domain/entities/auth_token.dart';

/// Maps between Session data components and the Domain Entity.
class SessionMapper {
  static Session toEntity({
    required String statusName,
    AuthUserDto? userDto,
    AuthToken? token,
    DateTime? lastActivity,
    bool rememberMe = false,
  }) {
    return Session(
      status: _mapStatus(statusName),
      user: userDto != null ? AuthMapper.toEntity(userDto) : null,
      token: token,
      lastActivityAt: lastActivity,
      rememberMe: rememberMe,
    );
  }

  static SessionStatus _mapStatus(String name) {
    try {
      return SessionStatus.values.byName(name);
    } catch (_) {
      return SessionStatus.loggedOut;
    }
  }
}
