import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/models/sync_models.dart';
import '../domain/services/sync_engine_service.dart';
import 'sync_engine.dart';

part 'sync_providers.g.dart';

@riverpod
StateReplicationService stateReplicationService(StateReplicationServiceRef ref) {
  throw UnimplementedError('StateReplicationService not provided');
}

@riverpod
StateValidationService stateValidationService(StateValidationServiceRef ref) {
  // Simple implementation for validation
  return _DefaultStateValidator();
}

@riverpod
SynchronizationEngine synchronizationEngine(SynchronizationEngineRef ref) {
  final replication = ref.watch(stateReplicationServiceProvider);
  final validation = ref.watch(stateValidationServiceProvider);
  
  final engine = SynchronizationEngine(
    replicationService: replication,
    validationService: validation,
  );
  
  ref.onDispose(() => engine.dispose());
  return engine;
}

@riverpod
Stream<ReplicatedState> replicatedState(ReplicatedStateRef ref) {
  final engine = ref.watch(synchronizationEngineProvider);
  return engine.stateStream;
}

@riverpod
class LatencyNotifier extends _$LatencyNotifier {
  @override
  LatencyMetrics build() {
    return const LatencyMetrics(
      pingMs: 0,
      jitterMs: 0,
      packetLossRate: 0.0,
      clockOffsetMs: 0,
    );
  }

  void updateMetrics(LatencyMetrics metrics) {
    state = metrics;
  }
}

class _DefaultStateValidator implements StateValidationService {
  @override
  bool validateChecksum(StateSnapshot snapshot, int expectedChecksum) => true;

  @override
  bool canApplyDelta(ReplicatedState currentState, StateDelta delta) {
    return delta.fromSequence == currentState.sequenceNumber;
  }
}
