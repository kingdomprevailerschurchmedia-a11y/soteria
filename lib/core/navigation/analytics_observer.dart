import 'package:flutter/material.dart';
import '../analytics/analytics_service.dart';

/// NavigatorObserver that automatically tracks screen views.
class AnalyticsObserver extends NavigatorObserver {
  AnalyticsObserver(this._analyticsService);

  final AnalyticsService _analyticsService;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _trackScreen(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      _trackScreen(previousRoute);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _trackScreen(newRoute);
    }
  }

  void _trackScreen(Route<dynamic> route) {
    final String? screenName = route.settings.name;
    if (screenName != null) {
      _analyticsService.trackScreen(screenName);
    }
  }
}
