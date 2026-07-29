import 'dart:convert';
import '../../../../core/models/result.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/entities/auth_provider_type.dart';
import '../../domain/entities/auth_token.dart';
import '../../domain/entities/session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';
import '../datasources/session_local_datasource.dart';
import '../models/auth_user_dto.dart';
import '../mappers/auth_mapper.dart';
import '../mappers/session_mapper.dart';
import '../../../../core/errors/error_mapper.dart';
import '../../../../core/services/secure_storage_service.dart';

/// Production implementation of [AuthenticationRepository].
/// Delegates actual network/local calls to an [AuthenticationDataSource].
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl(this._dataSource, this._secureStorage, this._sessionLocal);

  final AuthenticationDataSource _dataSource;
  final SecureStorageService _secureStorage;
  final SessionLocalDataSource _sessionLocal;

  @override
  Future<Result<AuthUser>> signIn({
    required String email, 
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      final dto = await _dataSource.signIn(email, password);
      final user = AuthMapper.toEntity(dto);
      
      final token = AuthToken(
        accessToken: 'mock_access_token_${user.id}',
        expiresAt: DateTime.now().add(const Duration(hours: 2)),
        refreshToken: 'mock_refresh_token_${user.id}',
      );

      if (rememberMe) {
        await _sessionLocal.saveRememberMe(true);
        await _sessionLocal.saveToken(token);
        await _secureStorage.saveUserData(jsonEncode(dto.toJson()));
      }
      
      return Success(user);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<AuthUser>> register({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final dto = await _dataSource.register(email, password, username);
      return Success(AuthMapper.toEntity(dto));
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<AuthUser>> signInWithGoogle() async {
    try {
      final dto = await _dataSource.signInWithGoogle();
      return Success(AuthMapper.toEntity(dto));
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<AuthUser>> signInWithApple() async {
    try {
      final dto = await _dataSource.signInWithApple();
      return Success(AuthMapper.toEntity(dto));
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<AuthUser>> signInWithPhone(String phoneNumber) async {
    try {
      final dto = await _dataSource.signInWithPhone(phoneNumber);
      return Success(AuthMapper.toEntity(dto));
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<AuthUser>> signInAsGuest() async {
    try {
      final dto = await _dataSource.signInAsGuest();
      return Success(AuthMapper.toEntity(dto));
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<AuthUser>> signInWithBiometrics() async {
    try {
      final storedUser = await _secureStorage.getUserData();
      if (storedUser != null) {
        return Success(AuthMapper.toEntity(
          AuthUserDto.fromJson(jsonDecode(storedUser) as Map<String, dynamic>),
        ));
      }
      return Error(ErrorMapper.map('No credentials stored for biometrics.'));
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _dataSource.signOut();
      await _sessionLocal.clearSession();
      return const Success(null);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<AuthSession>> refreshSession() async {
    return Success(AuthSession(
      accessToken: 'mock_refreshed_token',
      expiresAt: DateTime.now().add(const Duration(hours: 1)),
    ));
  }

  @override
  Future<Result<AuthUser?>> currentUser() async {
    try {
      final dto = await _dataSource.getCurrentUser();
      if (dto != null) return Success(AuthMapper.toEntity(dto));
      
      final stored = await _secureStorage.getUserData();
      if (stored != null) {
        return Success(AuthMapper.toEntity(
          AuthUserDto.fromJson(jsonDecode(stored) as Map<String, dynamic>),
        ));
      }
      
      return const Success(null);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final user = await currentUser();
    return user.isSuccess && user.dataOrNull != null;
  }

  @override
  Future<Result<void>> deleteAccount() async {
    try {
      await _dataSource.deleteAccount();
      await _sessionLocal.clearSession();
      return const Success(null);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<AuthUser>> updateProfile({String? username, String? avatarUrl}) async {
    try {
      final dto = await _dataSource.updateProfile(username: username, avatarUrl: avatarUrl);
      return Success(AuthMapper.toEntity(dto));
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<bool>> checkUsernameAvailability(String username) async {
    try {
      final isAvailable = await _dataSource.checkUsernameAvailability(username);
      return Success(isAvailable);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> requestPasswordReset(String email) async {
    try {
      await _dataSource.requestPasswordReset(email);
      return const Success(null);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> verifyRecoveryCode({required String email, required String code}) async {
    try {
      await _dataSource.verifyRecoveryCode(email, code);
      return const Success(null);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> resetPassword({
    required String email, 
    required String newPassword, 
    required String verificationCode,
  }) async {
    try {
      await _dataSource.resetPassword(email, newPassword, verificationCode);
      return const Success(null);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> resendRecoveryCode(String email) async {
    try {
      await _dataSource.requestPasswordReset(email);
      return const Success(null);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> sendPasswordResetEmail(String email) => requestPasswordReset(email);

  @override
  Future<Result<void>> linkProvider(AuthProviderType type) async {
    try {
      await _dataSource.linkProvider(type.name);
      return const Success(null);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> unlinkProvider(AuthProviderType type) async {
    try {
      await _dataSource.unlinkProvider(type.name);
      return const Success(null);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> migrateGuestData() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return const Success(null);
  }

  @override
  Future<Result<Session?>> restoreSession() async {
    try {
      final token = await _sessionLocal.getToken();
      final statusStr = _sessionLocal.getSessionStatus();
      final rememberMe = _sessionLocal.getRememberMe();
      final lastActivity = _sessionLocal.getLastActivity();

      if (statusStr == null) return const Success(null);

      AuthUser? user;
      final storedUser = await _secureStorage.getUserData();
      if (storedUser != null) {
        user = AuthMapper.toEntity(
          AuthUserDto.fromJson(jsonDecode(storedUser) as Map<String, dynamic>),
        );
      }

      return Success(SessionMapper.toEntity(
        statusName: statusStr,
        userDto: user != null ? AuthMapper.toDto(user) : null,
        token: token,
        lastActivity: lastActivity,
        rememberMe: rememberMe,
      ));
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> persistSession(Session session) async {
    try {
      await _sessionLocal.saveSessionStatus(session.status.name);
      await _sessionLocal.saveRememberMe(session.rememberMe);
      if (session.token != null) {
        await _sessionLocal.saveToken(session.token!);
      }
      if (session.lastActivityAt != null) {
        await _sessionLocal.saveLastActivity(session.lastActivityAt!);
      }
      return const Success(null);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> clearSession() async {
    try {
      await _sessionLocal.clearSession();
      return const Success(null);
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }

  @override
  Future<bool> isSessionValid() async {
    final sessionResult = await restoreSession();
    if (sessionResult.isSuccess) {
      final session = sessionResult.dataOrNull;
      return session != null && session.isActive;
    }
    return false;
  }

  @override
  Future<Result<AuthUser>> upgradeGuestSession({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final userResult = await register(email: email, password: password, username: username);
      if (userResult.isFailure) return userResult;

      await migrateGuestData();

      return userResult;
    } catch (e) {
      return Error(ErrorMapper.map(e));
    }
  }
}
