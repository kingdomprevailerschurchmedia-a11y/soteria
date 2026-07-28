import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../logging/logger_provider.dart';
import 'app_lifecycle_service.dart';

part 'lifecycle_provider.g.dart';

/// Provider for the [AppLifecycleService].
@Riverpod(keepAlive: true)
AppLifecycleService appLifecycleService(Ref ref) {
  final logger = ref.watch(loggerProvider);
  final service = AppLifecycleService(logger: logger);
  service.init();
  
  ref.onDispose(service.dispose);
  
  return service;
}
