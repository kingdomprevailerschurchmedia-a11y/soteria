/// FailureResult is the base class for all application failures.
sealed class FailureResult {
  const FailureResult(this.message);
  final String message;

  @override
  String toString() => message;
}

/// Represents a server-side error.
class ServerFailure extends FailureResult {
  const ServerFailure([super.message = 'A server error occurred']);
}

/// Represents a network connectivity error.
class NetworkFailure extends FailureResult {
  const NetworkFailure([super.message = 'No internet connection']);
}

/// Represents an error during data caching.
class CacheFailure extends FailureResult {
  const CacheFailure([super.message = 'Failed to access local cache']);
}

/// Represents a data validation error.
class ValidationFailure extends FailureResult {
  const ValidationFailure(super.message);
}

/// Represents an authentication error.
class AuthenticationFailure extends FailureResult {
  const AuthenticationFailure([super.message = 'Authentication failed']);
}

/// Represents a permission/authorization error.
class PermissionFailure extends FailureResult {
  const PermissionFailure([super.message = 'Access denied']);
}

/// Represents an operation timeout.
class TimeoutFailure extends FailureResult {
  const TimeoutFailure([super.message = 'The operation timed out']);
}

/// Represents an unknown or unhandled error.
class UnknownFailure extends FailureResult {
  const UnknownFailure([super.message = 'An unexpected error occurred']);
}
