import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/models/matchmaking.dart';
import '../domain/models/match_types.dart';
import 'matchmaking_engine.dart';
import '../domain/services/multiplayer_services.dart';

part 'queue_notifier.g.dart';

@riverpod
MatchmakingEngine matchmakingEngine(MatchmakingEngineRef ref) {
  // In a real app, this would be injected via a concrete implementation of MatchmakingService
  // For now, we'll need a mock or provider for the service.
  throw UnimplementedError('MatchmakingService not provided');
}

@riverpod
class QueueNotifier extends _$QueueNotifier {
  Timer? _queueTimer;

  @override
  QueueState build() {
    ref.onDispose(() => _queueTimer?.cancel());
    return const QueueState(isQueued: false);
  }

  Future<void> joinQueue({
    required String playerId,
    required MatchType type,
    MatchmakingMode mode = MatchmakingMode.random,
  }) async {
    state = state.copyWith(isQueued: true);
    
    try {
      final engine = ref.read(matchmakingEngineProvider);
      final ticket = await engine.findMatch(
        playerId: playerId,
        type: type,
        mode: mode,
      );
      
      state = state.copyWith(ticket: ticket);
      _startTimer();
      
      // Listen for ticket updates
      ref.listenSelf((previous, next) {
        if (next.ticket?.status == MatchmakingStatus.completed) {
          _queueTimer?.cancel();
        }
      });
      
    } catch (e) {
      state = state.copyWith(isQueued: false, ticket: null);
      rethrow;
    }
  }

  Future<void> leaveQueue() async {
    final ticketId = state.ticket?.ticketId;
    if (ticketId != null) {
      await ref.read(matchmakingEngineProvider).cancelSearch(ticketId);
    }
    _queueTimer?.cancel();
    state = const QueueState(isQueued: false);
  }

  void _startTimer() {
    _queueTimer?.cancel();
    _queueTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state.copyWith(
        timeInQueueSeconds: state.timeInQueueSeconds + 1,
      );
    });
  }
}
