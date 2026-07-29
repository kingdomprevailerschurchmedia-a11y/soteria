// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider that collects application diagnostic information.

@ProviderFor(appDiagnostics)
final appDiagnosticsProvider = AppDiagnosticsProvider._();

/// Provider that collects application diagnostic information.

final class AppDiagnosticsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppDiagnostics>,
          AppDiagnostics,
          FutureOr<AppDiagnostics>
        >
    with $FutureModifier<AppDiagnostics>, $FutureProvider<AppDiagnostics> {
  /// Provider that collects application diagnostic information.
  AppDiagnosticsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDiagnosticsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDiagnosticsHash();

  @$internal
  @override
  $FutureProviderElement<AppDiagnostics> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppDiagnostics> create(Ref ref) {
    return appDiagnostics(ref);
  }
}

String _$appDiagnosticsHash() => r'97c912f8b5c0416d247fbd28af9256e37d5bd8f2';

/// Provider that collects device diagnostic information.

@ProviderFor(deviceDiagnostics)
final deviceDiagnosticsProvider = DeviceDiagnosticsProvider._();

/// Provider that collects device diagnostic information.

final class DeviceDiagnosticsProvider
    extends
        $FunctionalProvider<
          DeviceDiagnostics,
          DeviceDiagnostics,
          DeviceDiagnostics
        >
    with $Provider<DeviceDiagnostics> {
  /// Provider that collects device diagnostic information.
  DeviceDiagnosticsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceDiagnosticsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceDiagnosticsHash();

  @$internal
  @override
  $ProviderElement<DeviceDiagnostics> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeviceDiagnostics create(Ref ref) {
    return deviceDiagnostics(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceDiagnostics value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceDiagnostics>(value),
    );
  }
}

String _$deviceDiagnosticsHash() => r'04f9b9041386dc4639955cc75b6ddb6b2fc9d2c8';

/// Provider that exposes the current log buffer for the dashboard.

@ProviderFor(debugLogs)
final debugLogsProvider = DebugLogsProvider._();

/// Provider that exposes the current log buffer for the dashboard.

final class DebugLogsProvider
    extends $FunctionalProvider<List<LogEntry>, List<LogEntry>, List<LogEntry>>
    with $Provider<List<LogEntry>> {
  /// Provider that exposes the current log buffer for the dashboard.
  DebugLogsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugLogsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugLogsHash();

  @$internal
  @override
  $ProviderElement<List<LogEntry>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<LogEntry> create(Ref ref) {
    return debugLogs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LogEntry> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LogEntry>>(value),
    );
  }
}

String _$debugLogsHash() => r'01ca77c4681f78569878cc76031e30ed78ab8201';
