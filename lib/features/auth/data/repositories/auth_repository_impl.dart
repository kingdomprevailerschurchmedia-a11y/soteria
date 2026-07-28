import 'dart:convert';
import '../../../../core/models/result.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';
import '../models/auth_user_dto.dart';
import '../mappers/auth_mapper.dart';
import '../../../../core/errors/error_mapper.dart';
import '../../../../core/services/secure_storage_service.dart';

/// Production implementation of [AuthenticationRepository].
/// Delegates actual network/local calls to an [AuthenticationDataSource].
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl(this._dataSource, this._secureStorage);

  final AuthenticationDataSource _dataSource;
  final SecureStorageService _secureStorage;

  @override
  Future<Result<AuthUser>> signIn({
    required String email, 
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      final dto = await _dataSource.signIn(email, password);
      final user = AuthMapper.toEntity(dto);
      
      if (rememberMe) {
        await _secureStorage.saveUserData(jsonEncode(dto.toJson()));
        await _secureStorage.saveAccessToken('mock_access_token_${user.id}');
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
        // In a real app, you'd trigger local_auth here
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
      await _secureStorage.clearAuthData();
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
      // 1. Check remote first
      final dto = await _dataSource.getCurrentUser();
      if (dto != null) return Success(AuthMapper.toEntity(dto));
      
      // 2. Fallback to secure storage for "Remember Me"
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
      await _secureStorage.clearAuthData();
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
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return const Success(null);
  }
}
