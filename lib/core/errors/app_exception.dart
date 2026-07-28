/// Base class for all application-specific exceptions.
sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;

  @override
  String toString() => message;
}

/// Thrown when a network request fails.
class NetworkException extends AppException {
  const NetworkException([super.message = 'Network connection failed. Please check your internet.']);
}

/// Thrown when a server-side error occurs.
class ServerException extends AppException {
  const ServerException([super.message = 'The server encountered an issue. Please try again later.']);
}

/// Thrown when authentication fails.
class AuthException extends AppException {
  const AuthException([super.message = 'Authentication failed. Please check your credentials.']);
}

/// Thrown when user input is invalid.
class ValidationException extends AppException {
  const ValidationException(super.message);
}

/// Thrown when an operation times out.
class TimeoutException extends AppException {
  const TimeoutException([super.message = 'The operation timed out. Please try again.']);
}

/// Thrown for any other unexpected errors.
class UnknownException extends AppException {
  const UnknownException([super.message = 'An unexpected error occurred.']);
}
