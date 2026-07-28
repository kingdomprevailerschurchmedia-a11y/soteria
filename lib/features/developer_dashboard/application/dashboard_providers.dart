import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/app_diagnostics.dart';
import '../../../core/config/app_config.dart';
import '../../../core/logging/logger_provider.dart';
import '../../../core/logging/log_entry.dart';

part 'dashboard_providers.g.dart';

/// Provider that collects application diagnostic information.
@riverpod
Future<AppDiagnostics> appDiagnostics(Ref ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  final config = ref.watch(appConfigProvider);

  return AppDiagnostics(
    appName: packageInfo.appName,
    version: packageInfo.version,
    buildNumber: packageInfo.buildNumber,
    packageName: packageInfo.packageName,
    environment: config.environment.name,
    isReleaseMode: kReleaseMode,
    flutterVersion: '3.44.6', // Ideal to pull from build info if possible
  );
}

/// Provider that collects device diagnostic information.
@riverpod
DeviceDiagnostics deviceDiagnostics(Ref ref) {
  final window = PlatformDispatcher.instance.views.first;
  final size = window.physicalSize / window.devicePixelRatio;
  
  return DeviceDiagnostics(
    platform: defaultTargetPlatform.name,
    osVersion: 'Unknown',
    deviceModel: 'Simulator/Device',
    screenWidth: size.width,
    screenHeight: size.height,
    pixelRatio: window.devicePixelRatio,
    orientation: size.width > size.height ? 'Landscape' : 'Portrait',
  );
}

/// Provider that exposes the current log buffer for the dashboard.
@riverpod
List<LogEntry> debugLogs(Ref ref) {
  final logger = ref.watch(loggerProvider);
  
  // We use a periodic timer or a simple signal to refresh logs if needed.
  // For now, we'll just return the current buffer.
  return logger.logs;
}
