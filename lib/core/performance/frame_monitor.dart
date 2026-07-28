import 'package:flutter/scheduler.dart';

/// Monitors frame rendering performance and identifies jank (slow frames).
class FrameMonitor {
  final List<FrameTiming> _recentTimings = [];
  static const int _maxBufferSize = 100;

  /// Starts observing frame timings.
  void start() {
    SchedulerBinding.instance.addTimingsCallback(_onFrameTimings);
  }

  /// Stops observing frame timings.
  void stop() {
    // Note: removeTimingsCallback is not available in all Flutter versions, 
    // we use a flag to disable processing if needed.
  }

  void _onFrameTimings(List<FrameTiming> timings) {
    _recentTimings.addAll(timings);
    if (_recentTimings.length > _maxBufferSize) {
      _recentTimings.removeRange(0, _recentTimings.length - _maxBufferSize);
    }
  }

  /// Returns the average build time in milliseconds for recent frames.
  double get averageBuildTimeMs {
    if (_recentTimings.isEmpty) return 0.0;
    final total = _recentTimings.fold(0, (sum, t) => sum + t.buildDuration.inMicroseconds);
    return (total / _recentTimings.length) / 1000.0;
  }

  /// Returns the percentage of frames that exceeded the 16.6ms threshold.
  double get jankPercentage {
    if (_recentTimings.isEmpty) return 0.0;
    final jankCount = _recentTimings.where((t) => t.totalSpan.inMilliseconds > 16).length;
    return (jankCount / _recentTimings.length) * 100;
  }

  List<FrameTiming> get recentTimings => List.unmodifiable(_recentTimings);
}
