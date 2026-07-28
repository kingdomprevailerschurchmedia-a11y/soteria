import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/datasources/mock_auth_datasource.dart';
import '../../application/auth_controller.dart';
import '../../application/auth_state.dart';
import '../../../../core/services/secure_storage_service.dart';

part 'auth_providers.g.dart';

/// Provides the data source for authentication.
@riverpod
MockAuthenticationDataSource authDataSource(Ref ref) {
  return MockAuthenticationDataSource();
}

/// Provides the repository for authentication.
@riverpod
AuthenticationRepository authenticationRepository(Ref ref) {
  final dataSource = ref.watch(authDataSourceProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  return AuthenticationRepositoryImpl(dataSource, secureStorage);
}

/// Exposes the user's authentication state.
@riverpod
AuthState authState(Ref ref) {
  return ref.watch(authControllerProvider);
}
