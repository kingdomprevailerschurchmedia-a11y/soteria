import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/models/session_models.dart';
import '../domain/services/session_sync_service.dart';
import 'session_manager.dart';
import '../../game_rules/application/rules_notifier.dart';

import 'session_coordinator.dart';
import '../../game_rules/application/rules_engine_provider.dart';
import '../../game_rules/application/rules_notifier.dart';

part 'session_notifier.g.dart';

@riverpod
SessionCoordinator sessionCoordinator(SessionCoordinatorRef ref) {
  final syncService = ref.watch(sessionSyncServiceProvider);
  return SessionCoordinator(syncService);
}

@riverpod
SessionManager sessionManager(SessionManagerRef ref) {
  final syncService = ref.watch(sessionSyncServiceProvider);
  final rulesEngine = ref.watch(gameRulesEngineProvider);
  return SessionManager(
    syncService: syncService,
    rulesEngine: rulesEngine,
  );
}

@riverpod
SessionSyncService sessionSyncService(SessionSyncServiceRef ref) {
  // This will be overridden in the ProviderScope with a concrete implementation
  throw UnimplementedError('SessionSyncService not provided');
}

@riverpod
class ActiveSessionNotifier extends _$ActiveSessionNotifier {
  StreamSubscription<GameSession>? _sessionSub;
  StreamSubscription<SessionEvent>? _eventSub;

  @override
  AsyncValue<GameSession?> build() {
    ref.onDispose(() {
      _sessionSub?.cancel();
      _eventSub?.cancel();
    });
    return const AsyncValue.data(null);
  }

  Future<void> joinSession(String sessionId, String playerId) async {
    state = const AsyncLoading();
    try {
      final manager = ref.read(sessionManagerProvider);
      await manager.initializeSession(sessionId);
      
      _sessionSub = manager.sessionStream(sessionId).listen((session) {
        state = AsyncValue.data(session);
      });
      
      _eventSub = manager.eventStream(sessionId).listen(_handleSessionEvent);
      
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void _handleSessionEvent(SessionEvent event) {
    // Handle events like player joined/left, etc.
    // Most state changes come through the session stream itself
  }

  Future<void> setReady(bool ready) async {
    final current = state.value;
    if (current == null) return;
    
    // In a real app, we'd get the current user ID from an Auth provider
    const mockPlayerId = 'current-user-id';
    await ref.read(sessionManagerProvider).markAsReady(current.sessionId, mockPlayerId);
  }

  Future<void> recoverSession(String sessionId) async {
    // Recovery logic: re-join and sync state
    await joinSession(sessionId, 'current-user-id');
  }

  Future<void> leave() async {
    final current = state.value;
    if (current != null) {
      await ref.read(sessionManagerProvider).leave(current.sessionId);
    }
    _sessionSub?.cancel();
    _eventSub?.cancel();
    state = const AsyncValue.data(null);
  }
}

@riverpod
SessionManager sessionManager(SessionManagerRef ref) {
  // Mock implementations for now
  throw UnimplementedError('SessionSyncService not provided');
}
