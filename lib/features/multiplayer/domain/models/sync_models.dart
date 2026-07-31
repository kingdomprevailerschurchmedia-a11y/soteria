import 'package:freezed_annotation/freezed_annotation.dart';
import 'session_models.dart';

part 'sync_models.freezed.dart';
part 'sync_models.g.dart';

@freezed
class ReplicatedState with _$ReplicatedState {
  const factory ReplicatedState({
    required String sessionId,
    required int sequenceNumber,
    required GameSession session,
    required DateTime serverTime,
    @Default(0) int checksum,
  }) = _ReplicatedState;

  factory ReplicatedState.fromJson(Map<String, dynamic> json) =>
      _$ReplicatedStateFromJson(json);
}

@freezed
class StateSnapshot with _$StateSnapshot {
  const factory StateSnapshot({
    required String sessionId,
    required int sequenceNumber,
    required Map<String, dynamic> data,
    required DateTime timestamp,
  }) = _StateSnapshot;

  factory StateSnapshot.fromJson(Map<String, dynamic> json) =>
      _$StateSnapshotFromJson(json);
}

@freezed
class StateDelta with _$StateDelta {
  const factory StateDelta({
    required String sessionId,
    required int fromSequence,
    required int toSequence,
    required Map<String, dynamic> changes,
  }) = _StateDelta;

  factory StateDelta.fromJson(Map<String, dynamic> json) =>
      _$StateDeltaFromJson(json);
}

@freezed
class SyncFrame with _$SyncFrame {
  const factory SyncFrame({
    required int frameId,
    required DateTime timestamp,
    required List<SessionEvent> events,
  }) = _SyncFrame;

  factory SyncFrame.fromJson(Map<String, dynamic> json) =>
      _$SyncFrameFromJson(json);
}

@freezed
class LatencyMetrics with _$LatencyMetrics {
  const factory LatencyMetrics({
    required int pingMs,
    required int jitterMs,
    required double packetLossRate,
    required int clockOffsetMs,
  }) = _LatencyMetrics;
}

enum ConflictResolutionStrategy {
  serverWins,
  latestTimestamp,
  sequencePriority,
  manual,
}

@freezed
class ConflictResolutionResult with _$ConflictResolutionResult {
  const factory ConflictResolutionResult({
    required bool resolved,
    required ReplicatedState finalState,
    required ConflictResolutionStrategy strategy,
  }) = _ConflictResolutionResult;
}
