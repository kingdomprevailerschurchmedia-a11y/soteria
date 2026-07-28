import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/failure.dart';

part 'registration_state.freezed.dart';

enum RegistrationStatus { idle, submitting, success, failure }

@freezed
abstract class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default(0) int currentStep,
    @Default(3) int totalSteps,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String username,
    @Default('') String referralCode,
    @Default(RegistrationStatus.idle) RegistrationStatus status,
    Failure? failure,
    @Default(false) bool isUsernameAvailable,
    @Default(false) bool isCheckingUsername,
  }) = _RegistrationState;

  const RegistrationState._();

  bool get isSubmitting => status == RegistrationStatus.submitting;
  bool get isSuccess => status == RegistrationStatus.success;
}
