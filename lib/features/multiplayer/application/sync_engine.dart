import 'dart:async';
import '../domain/models/sync_models.dart';
import '../domain/models/session_models.dart';
import '../domain/services/sync_engine_service.dart';

class SynchronizationEngine {
  final StateReplicationService _replicationService;
  final StateValidationService _validationService;
  
  final _stateController = StreamController<ReplicatedState>.broadcast();
  ReplicatedState? _currentState;

  SynchronizationEngine({
    required StateReplicationService replicationService,
    required StateValidationService validationService,
  }) : _replicationService = replicationService,
       _validationService = validationService;

  Stream<ReplicatedState> get stateStream => _stateController.stream;

  Future<void> startSync(String sessionId) async {
    // 1. Initial Sync
    final initialState = await _replicationService.requestFullSync(sessionId);
    _updateState(initialState);

    // 2. Listen for Snapshots and Deltas
    _replicationService.watchSnapshots(sessionId).listen(_handleSnapshot);
    _replicationService.watchDeltas(sessionId).listen(_handleDelta);
  }

  void _handleSnapshot(StateSnapshot snapshot) {
    if (_currentState == null) return;
    
    // Check sequence
    if (snapshot.sequenceNumber > _currentState!.sequenceNumber) {
      // Apply snapshot
      final newState = _currentState!.copyWith(
        sequenceNumber: snapshot.sequenceNumber,
        session: GameSession.fromJson(snapshot.data),
        serverTime: snapshot.timestamp,
      );
      _updateState(newState);
    }
  }

  void _handleDelta(StateDelta delta) {
    if (_currentState == null) return;

    if (_validationService.canApplyDelta(_currentState!, delta)) {
      // Apply delta logic (merging maps, etc.)
      // In a real implementation, this would involve complex merging
    } else if (delta.toSequence > _currentState!.sequenceNumber + 1) {
      // Detected gap in sequence, request full sync
      _triggerRecovery(delta.sessionId);
    }
  }

  void _updateState(ReplicatedState state) {
    _currentState = state;
    _stateController.add(state);
  }

  Future<void> _triggerRecovery(String sessionId) async {
    final recoveredState = await _replicationService.requestFullSync(sessionId);
    _updateState(recoveredState);
  }

  void dispose() {
    _stateController.close();
  }
}

class ConflictResolver {
  ConflictResolutionResult resolve(
    ReplicatedState localState,
    ReplicatedState serverState,
    ConflictResolutionStrategy strategy,
  ) {
    switch (strategy) {
      case ConflictResolutionStrategy.serverWins:
        return ConflictResolutionResult(
          resolved: true,
          finalState: serverState,
          strategy: strategy,
        );
      case ConflictResolutionStrategy.latestTimestamp:
        final finalState = localState.serverTime.isAfter(serverState.serverTime)
            ? localState
            : serverState;
        return ConflictResolutionResult(
          resolved: true,
          finalState: finalState,
          strategy: strategy,
        );
      case ConflictResolutionStrategy.sequencePriority:
        final finalState = localState.sequenceNumber >= serverState.sequenceNumber
            ? localState
            : serverState;
        return ConflictResolutionResult(
          resolved: true,
          finalState: finalState,
          strategy: strategy,
        );
      default:
        return ConflictResolutionResult(
          resolved: true,
          finalState: serverState,
          strategy: ConflictResolutionStrategy.serverWins,
        );
    }
  }
}
