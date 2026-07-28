import '../../../../core/errors/failure.dart';

/// Represents a failure during an authentication operation.
sealed class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

/// Thrown when the provided credentials (email/password) are incorrect.
class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure([super.message = 'Invalid email or password.']);
}

/// Thrown when a user tries to register with an email that is already in use.
class EmailAlreadyInUseFailure extends AuthFailure {
  const EmailAlreadyInUseFailure([super.message = 'This email address is already in use.']);
}

/// Thrown when the password does not meet the security requirements.
class WeakPasswordFailure extends AuthFailure {
  const WeakPasswordFailure([super.message = 'The password provided is too weak.']);
}

/// Thrown when a user's session has expired and they need to re-authenticate.
class SessionExpiredFailure extends AuthFailure {
  const SessionExpiredFailure([super.message = 'Your session has expired. Please log in again.']);
}

/// Thrown when a user is not authorized to perform a specific action.
class UnauthorizedFailure extends AuthFailure {
  const UnauthorizedFailure([super.message = 'You are not authorized to perform this action.']);
}
