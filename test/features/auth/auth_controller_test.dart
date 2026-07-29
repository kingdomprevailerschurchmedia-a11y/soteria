import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soteria/features/auth/application/auth_controller.dart';
import 'package:soteria/features/auth/domain/repositories/auth_repository.dart';
import 'package:soteria/features/auth/domain/entities/auth_user.dart';
import 'package:soteria/features/auth/domain/entities/auth_status.dart';
import 'package:soteria/features/auth/domain/entities/session.dart';
import 'package:soteria/features/auth/domain/entities/session_status.dart';
import 'package:soteria/features/auth/presentation/providers/auth_providers.dart';
import 'package:soteria/core/models/result.dart';

@GenerateMocks([AuthenticationRepository])
import 'auth_controller_test.mocks.dart';

void main() {
  late MockAuthenticationRepository mockRepo;
  late ProviderContainer container;

  setUpAll(() {
    provideDummy<Result<AuthUser>>(const Success(AuthUser(id: 'dummy', email: 'dummy', username: 'dummy')));
    provideDummy<Result<AuthUser?>>(const Success(null));
    provideDummy<Result<void>>(const Success(null));
    provideDummy<Result<Session?>>(const Success(null));
  });

  setUp(() {
    mockRepo = MockAuthenticationRepository();
    
    // Default stubs
    when(mockRepo.persistSession(any)).thenAnswer((_) async => const Success(null));
    when(mockRepo.restoreSession()).thenAnswer((_) async => const Success(null));
    when(mockRepo.signOut()).thenAnswer((_) async => const Success(null));

    container = ProviderContainer(
      overrides: [
        authenticationRepositoryProvider.overrideWithValue(mockRepo),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('AuthController', () {
    test('initial state should be AuthStatus.initial', () {
      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.initial);
    });

    test('initialize() should set authenticated user if found in session', () async {
      const mockUser = AuthUser(id: '1', email: 'a@b.com', username: 'user');
      final mockSession = Session(
        status: SessionStatus.authenticated,
        user: mockUser,
      );
      
      when(mockRepo.restoreSession()).thenAnswer((_) async => Success(mockSession));
      
      await container.read(authControllerProvider.notifier).initialize(mockRepo);
      
      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.authenticated);
      expect(state.user, mockUser);
    });

    test('signIn() should update state to authenticated on success', () async {
      const mockUser = AuthUser(id: '1', email: 'a@b.com', username: 'user');
      when(mockRepo.signIn(email: 'a@b.com', password: 'password', rememberMe: false))
          .thenAnswer((_) async => const Success(mockUser));
      
      await container.read(authControllerProvider.notifier).initialize(mockRepo);
      await container.read(authControllerProvider.notifier).signIn('a@b.com', 'password');
      
      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.authenticated);
      expect(state.user, mockUser);
    });

    test('signOut() should set state to unauthenticated', () async {
      await container.read(authControllerProvider.notifier).initialize(mockRepo);
      await container.read(authControllerProvider.notifier).signOut();
      
      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.unauthenticated);
      expect(state.user, isNull);
    });
  });
}
