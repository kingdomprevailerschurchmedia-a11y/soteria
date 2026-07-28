import 'frame_monitor.dart';
import 'memory_monitor.dart';
import 'startup_metrics.dart';

/// Central coordinator for application performance monitoring.
class PerformanceService {
  PerformanceService()
      : frameMonitor = FrameMonitor(),
        memoryMonitor = MemoryMonitor();

  final FrameMonitor frameMonitor;
  final MemoryMonitor memoryMonitor;
  
  final Map<String, int> _rebuildCounts = {};

  /// Initializes performance monitoring.
  void initialize() {
    frameMonitor.start();
  }

  /// Increments the rebuild count for a specific widget or component.
  void recordRebuild(String component) {
    _rebuildCounts[component] = (_rebuildCounts[component] ?? 0) + 1;
  }

  /// Returns the current rebuild stats.
  Map<String, int> getRebuildStats() => Map.unmodifiable(_rebuildCounts);

  /// Captures a custom timing metric.
  void trackTiming(String name, Duration duration) {
    // Report to analytics or internal buffer
  }

  /// Returns a summary of current performance health.
  Map<String, dynamic> getHealthSummary() {
    return {
      'startup_ms': StartupMetrics.totalStartupTime?.inMilliseconds,
      'avg_frame_build_ms': frameMonitor.averageBuildTimeMs,
      'jank_p': frameMonitor.jankPercentage,
    };
  }
}
