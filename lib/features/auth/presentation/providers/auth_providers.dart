import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/guest_repository.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/guest_repository_impl.dart';
import '../../data/datasources/mock_auth_datasource.dart';
import '../../data/datasources/session_local_datasource.dart';
import '../../application/auth_controller.dart';
import '../../application/auth_state.dart';
import '../../../../core/services/secure_storage_service.dart';
import '../../../../core/services/startup_service.dart';

part 'auth_providers.g.dart';

/// Provides the data source for authentication.
@riverpod
MockAuthenticationDataSource authDataSource(Ref ref) {
  return MockAuthenticationDataSource();
}

/// Provides the local data source for session management.
@riverpod
SessionLocalDataSource sessionLocalDataSource(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  return SessionLocalDataSource(prefs, secureStorage);
}

/// Provides the repository for authentication.
@riverpod
AuthenticationRepository authenticationRepository(Ref ref) {
  final dataSource = ref.watch(authDataSourceProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  final sessionLocal = ref.watch(sessionLocalDataSourceProvider);
  return AuthenticationRepositoryImpl(dataSource, secureStorage, sessionLocal);
}

/// Provides the local repository for guest data.
@riverpod
GuestRepository guestRepository(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return GuestRepositoryImpl(prefs);
}

/// Exposes the user's authentication state.
@riverpod
AuthState authState(Ref ref) {
  return ref.watch(authControllerProvider);
}
