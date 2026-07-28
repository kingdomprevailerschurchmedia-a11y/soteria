import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'analytics_constants.dart';
import 'analytics_service.dart';

/// Handles registering default user properties during app initialization.
class AnalyticsRegistry {
  static Future<void> registerDefaultProperties(AnalyticsService service) async {
    final packageInfo = await PackageInfo.fromPlatform();
    
    await service.setUserProperty(
      AnalyticsConstants.propAppVersion, 
      '${packageInfo.version}+${packageInfo.buildNumber}',
    );
    
    await service.setUserProperty(
      AnalyticsConstants.propPlatform, 
      defaultTargetPlatform.name,
    );
    
    await service.setUserProperty(
      AnalyticsConstants.propEnvironment, 
      kReleaseMode ? 'production' : 'development',
    );
  }
}
