import 'package:flutter/foundation.dart';

/// Runtime utility to detect potential code quality or design system violations.
class QualityChecker {
  static final List<String> _violations = [];

  /// Returns the current list of recorded violations.
  static List<String> get violations => List.unmodifiable(_violations);

  /// Records a violation if in non-release mode.
  static void recordViolation(String message, {String? component}) {
    if (kReleaseMode) return;

    final formattedMessage = component != null ? '[$component] $message' : message;
    
    // Avoid duplicates in the same session
    if (_violations.contains(formattedMessage)) return;

    _violations.add(formattedMessage);
    
    // Also log via system logger
    debugPrint('⚠️ QUALITY VIOLATION: $formattedMessage');
  }

  /// Checks for missing semantics on a button-like component.
  static void checkSemantics(String? label, {required String component}) {
    if (label == null || label.isEmpty) {
      recordViolation('Missing semantic label', component: component);
    }
  }

  /// Checks for hardcoded values (colors, spacing) in a component.
  /// This is used for manual instrumentation during code reviews.
  static void checkDesignSystem(String? reason, {required String component}) {
    if (reason != null && reason.isNotEmpty) {
      recordViolation('Design System violation: $reason', component: component);
    }
  }

  /// Clears current violations.
  static void clear() => _violations.clear();
}
