/// Represents a collection of diagnostic information about the application.
class AppDiagnostics {
  const AppDiagnostics({
    required this.appName,
    required this.version,
    required this.buildNumber,
    required this.packageName,
    required this.environment,
    required this.isReleaseMode,
    required this.flutterVersion, // Placeholder or passed from build info
  });

  final String appName;
  final String version;
  final String buildNumber;
  final String packageName;
  final String environment;
  final bool isReleaseMode;
  final String flutterVersion;
}

/// Represents information about the hardware and software environment.
class DeviceDiagnostics {
  const DeviceDiagnostics({
    required this.platform,
    required this.osVersion,
    required this.deviceModel,
    required this.screenWidth,
    required this.screenHeight,
    required this.pixelRatio,
    required this.orientation,
  });

  final String platform;
  final String osVersion;
  final String deviceModel;
  final double screenWidth;
  final double screenHeight;
  final double pixelRatio;
  final String orientation;
}
