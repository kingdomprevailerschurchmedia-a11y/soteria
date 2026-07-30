import '../models/sync_models.dart';
import '../models/session_models.dart';

abstract class StateReplicationService {
  /// Emits new state snapshots from the server.
  Stream<StateSnapshot> watchSnapshots(String sessionId);

  /// Emits incremental deltas.
  Stream<StateDelta> watchDeltas(String sessionId);

  /// Pushes local changes to the server for replication.
  Future<void> replicateLocalChange(String sessionId, Map<String, dynamic> changes);

  /// Requests a full state resynchronization.
  Future<ReplicatedState> requestFullSync(String sessionId);
}

abstract class ClockSynchronizationService {
  /// Returns the estimated offset between client and server time.
  Future<int> calculateClockOffset();

  /// Gets the synchronized server time.
  DateTime getSynchronizedTime();

  /// Watches for changes in latency metrics.
  Stream<LatencyMetrics> watchLatencyMetrics();
}

abstract class StateValidationService {
  /// Validates the integrity of a state snapshot using checksums.
  bool validateChecksum(StateSnapshot snapshot, int expectedChecksum);

  /// Verifies if a delta can be safely applied to the current state.
  bool canApplyDelta(ReplicatedState currentState, StateDelta delta);
}
