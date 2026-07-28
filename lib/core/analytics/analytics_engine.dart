import 'analytics_event.dart';

/// Interface for analytics providers (e.g. Firebase, Mixpanel, Console).
abstract class AnalyticsEngine {
  Future<void> initialize();
  Future<void> trackEvent(AnalyticsEvent event);
  Future<void> trackScreen(String screenName);
  Future<void> setUserId(String? userId);
  Future<void> setUserProperty(String key, String? value);
  Future<void> reset();
}
