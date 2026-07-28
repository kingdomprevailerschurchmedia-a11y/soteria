import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'accessibility_service.dart';

part 'accessibility_provider.g.dart';

/// Provider for the [AccessibilityService].
@Riverpod(keepAlive: true)
AccessibilityService accessibilityService(Ref ref) {
  return AccessibilityService();
}
