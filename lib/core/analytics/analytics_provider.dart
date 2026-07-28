import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../logging/logger_provider.dart';
import 'analytics_service.dart';
import 'analytics_logger.dart';

part 'analytics_provider.g.dart';

/// Provider for the centralized [AnalyticsService].
@Riverpod(keepAlive: true)
AnalyticsService analyticsService(Ref ref) {
  final logger = ref.watch(loggerProvider);
  
  return AnalyticsService(
    engines: [
      ConsoleAnalyticsEngine(logger),
      // Add more engines here in the future
    ],
  );
}

/// A notifier that exposes the current state of analytics for the dashboard.
@riverpod
class AnalyticsState extends _$AnalyticsState {
  @override
  AnalyticsSnapshot build() {
    final service = ref.watch(analyticsServiceProvider);
    return AnalyticsSnapshot(
      events: service.recentEvents,
      properties: service.userProperties,
      isEnabled: service.isEnabled,
    );
  }

  void refresh() {
    final service = ref.read(analyticsServiceProvider);
    state = AnalyticsSnapshot(
      events: service.recentEvents,
      properties: service.userProperties,
      isEnabled: service.isEnabled,
    );
  }

  void setEnabled(bool enabled) {
    ref.read(analyticsServiceProvider).setEnabled(enabled);
    refresh();
  }
}

class AnalyticsSnapshot {
  const AnalyticsSnapshot({
    required this.events,
    required this.properties,
    required this.isEnabled,
  });

  final List<AnalyticsEventEntry> events;
  final Map<String, String?> properties;
  final bool isEnabled;
}
