import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soteria/features/auth/application/session_controller.dart';
import 'package:soteria/features/auth/domain/entities/session.dart';
import 'package:soteria/features/auth/domain/entities/session_status.dart';
import 'package:soteria/features/auth/domain/entities/auth_user.dart';
import 'package:soteria/features/auth/presentation/providers/auth_providers.dart';
import 'package:soteria/core/models/result.dart';

import 'auth_controller_test.mocks.dart';

void main() {
  late MockAuthenticationRepository mockRepo;
  late ProviderContainer container;

  setUpAll(() {
    provideDummy<Result<Session?>>(const Success(null));
    provideDummy<Result<void>>(const Success(null));
  });

  setUp(() {
    mockRepo = MockAuthenticationRepository();
    
    when(mockRepo.persistSession(any)).thenAnswer((_) async => const Success(null));
    when(mockRepo.restoreSession()).thenAnswer((_) async => const Success(null));

    container = ProviderContainer(
      overrides: [
        authenticationRepositoryProvider.overrideWithValue(mockRepo),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('SessionController', () {
    test('initial state should be SessionStatus.restoring', () {
      final state = container.read(sessionControllerProvider);
      expect(state.status, SessionStatus.restoring);
    });

    test('restoreSession() should set authenticated session if valid', () async {
      const mockUser = AuthUser(id: '1', email: 'a@b.com', username: 'user');
      final mockSession = Session(
        status: SessionStatus.authenticated,
        user: mockUser,
      );
      
      when(mockRepo.restoreSession()).thenAnswer((_) async => Success(mockSession));
      
      await container.read(sessionControllerProvider.notifier).restoreSession();
      
      final state = container.read(sessionControllerProvider);
      expect(state.status, SessionStatus.authenticated);
      expect(state.user, mockUser);
    });

    test('setSession() should update state and persist', () async {
      const mockUser = AuthUser(id: '1', email: 'a@b.com', username: 'user');
      final mockSession = Session(
        status: SessionStatus.authenticated,
        user: mockUser,
      );
      
      container.read(sessionControllerProvider.notifier).setSession(mockSession);
      
      final state = container.read(sessionControllerProvider);
      expect(state.status, SessionStatus.authenticated);
      verify(mockRepo.persistSession(mockSession)).called(1);
    });
  });
}
