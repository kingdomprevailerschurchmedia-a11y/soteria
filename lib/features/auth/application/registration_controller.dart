import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/repositories/auth_repository.dart';
import '../presentation/providers/auth_providers.dart';
import 'registration_state.dart';
import 'auth_controller.dart';

part 'registration_controller.g.dart';

@riverpod
class RegistrationController extends _$RegistrationController {
  late final AuthenticationRepository _repository;
  Timer? _usernameDebounce;

  @override
  RegistrationState build() {
    _repository = ref.watch(authenticationRepositoryProvider);
    return const RegistrationState();
  }

  void updateEmail(String value) => state = state.copyWith(email: value);
  void updatePassword(String value) => state = state.copyWith(password: value);
  void updateConfirmPassword(String value) => state = state.copyWith(confirmPassword: value);
  void updateFirstName(String value) => state = state.copyWith(firstName: value);
  void updateLastName(String value) => state = state.copyWith(lastName: value);
  void updateReferralCode(String value) => state = state.copyWith(referralCode: value);

  void updateUsername(String value) {
    state = state.copyWith(username: value, isUsernameAvailable: false);
    
    _usernameDebounce?.cancel();
    if (value.length >= 3) {
      _usernameDebounce = Timer(const Duration(milliseconds: 500), () {
        _checkUsername(value);
      });
    }
  }

  Future<void> _checkUsername(String value) async {
    state = state.copyWith(isCheckingUsername: true);
    final result = await _repository.checkUsernameAvailability(value);
    
    if (state.username == value) {
      state = state.copyWith(
        isCheckingUsername: false,
        isUsernameAvailable: result.dataOrNull ?? false,
      );
    }
  }

  void setStep(int step) {
    if (step >= 0 && step < state.totalSteps) {
      state = state.copyWith(currentStep: step);
    }
  }

  void nextStep() {
    if (state.currentStep < state.totalSteps - 1) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  Future<void> submit() async {
    state = state.copyWith(status: RegistrationStatus.submitting);
    
    await ref.read(authControllerProvider.notifier).register(
      state.email,
      state.password,
      state.username,
    );
  }
}
