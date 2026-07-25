import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_provider.g.dart';

/// OnboardingNotifier tracks whether the user has completed the initial walkthrough.
@riverpod
class Onboarding extends _$Onboarding {
  static const _key = 'onboarding_completed';

  @override
  bool build() {
    // Initial value is managed by startup_service to be synchronous here if needed,
    // or we can read it directly if we ensure SharedPreferences is ready.
    return false; 
  }

  /// Sets the onboarding status to completed.
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
    state = true;
  }
  
  /// Internal method to set state during initialization.
  void setCompleted(bool value) {
    state = value;
  }
}
