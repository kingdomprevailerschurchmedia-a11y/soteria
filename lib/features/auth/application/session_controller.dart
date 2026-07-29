import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/session.dart';
import '../domain/entities/session_status.dart';
import '../domain/repositories/auth_repository.dart';
import '../presentation/providers/auth_providers.dart';
import '../../../core/lifecycle/lifecycle_provider.dart';
import '../../../core/analytics/analytics_provider.dart';
import '../../../core/analytics/analytics_event.dart';

part 'session_controller.g.dart';

/// Notifier that manages the global user session lifecycle.
@Riverpod(keepAlive: true)
class SessionController extends _$SessionController {
  late AuthenticationRepository _repository;
  Timer? _idleTimer;

  @override
  Session build() {
    _repository = ref.watch(authenticationRepositoryProvider);
    _observeLifecycle();
    ref.onDispose(() => _idleTimer?.cancel());
    return const Session(status: SessionStatus.restoring);
  }

  void _observeLifecycle() {
    ref.listen(appLifecycleServiceProvider, (prev, next) {
      if (next.isBackground) {
        _startIdleTimer();
      } else if (next.isForeground) {
        _stopIdleTimer();
        _checkSessionExpiration();
      }
    });
  }

  /// Restores a persistent session from local storage.
  Future<void> restoreSession() async {
    state = state.copyWith(status: SessionStatus.restoring);
    final result = await _repository.restoreSession();
    
    if (!ref.mounted) return;

    if (result.isSuccess && result.dataOrNull != null) {
      state = result.dataOrNull!;
      if (state.isActive) {
        unawaited(ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('session_restored')));
      } else {
        _handleExpiration();
      }
    } else {
      state = const Session(status: SessionStatus.loggedOut);
    }
  }

  /// Refreshes the session token.
  Future<void> refreshSession() async {
    final result = await _repository.refreshSession();
    if (!ref.mounted) return;
    
    if (result.isSuccess) {
      // update state with new token
    }
  }

  void updateLastActivity() {
    state = state.copyWith(lastActivityAt: DateTime.now());
    if (ref.mounted) {
      unawaited(_repository.persistSession(state));
    }
  }

  void setSession(Session session) {
    state = session;
    if (ref.mounted) {
      unawaited(_repository.persistSession(state));
    }
  }

  void _startIdleTimer() {
    _idleTimer?.cancel();
    _idleTimer = Timer(const Duration(minutes: 30), _handleExpiration);
  }

  void _stopIdleTimer() {
    _idleTimer?.cancel();
  }

  void _checkSessionExpiration() {
    if (state.token != null && !state.token!.isValid) {
      _handleExpiration();
    }
  }

  void _handleExpiration() {
    state = state.copyWith(status: SessionStatus.expired);
    unawaited(ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('session_expired')));
  }

  Future<void> logout() async {
    await _repository.signOut();
    state = const Session(status: SessionStatus.loggedOut);
    await ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('logout'));
  }
}
