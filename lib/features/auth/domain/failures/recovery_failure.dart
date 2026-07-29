import '../../../../core/errors/failure.dart';

/// Represents a failure during an account recovery operation.
sealed class RecoveryFailure extends Failure {
  const RecoveryFailure(super.message);
}

/// Thrown when the provided email is not registered.
class AccountNotFoundFailure extends RecoveryFailure {
  const AccountNotFoundFailure([super.message = 'No account found with this email.']);
}

/// Thrown when the recovery code is incorrect.
class InvalidCodeFailure extends RecoveryFailure {
  const InvalidCodeFailure([super.message = 'The verification code is incorrect.']);
}

/// Thrown when the recovery code has expired.
class ExpiredCodeFailure extends RecoveryFailure {
  const ExpiredCodeFailure([super.message = 'This code has expired. Please request a new one.']);
}

/// Thrown when too many reset attempts have been made.
class TooManyAttemptsFailure extends RecoveryFailure {
  const TooManyAttemptsFailure([super.message = 'Too many attempts. Please try again later.']);
}
