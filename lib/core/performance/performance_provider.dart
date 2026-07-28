import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'performance_service.dart';

part 'performance_provider.g.dart';

/// Provider for the [PerformanceService].
@Riverpod(keepAlive: true)
PerformanceService performanceService(Ref ref) {
  final service = PerformanceService();
  service.initialize();
  return service;
}
