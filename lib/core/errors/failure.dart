/// Failure represents an error that is suitable for presentation to the user.
abstract class Failure {
  const Failure(this.message);
  final String message;

  @override
  String toString() => message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

/// Represents a network connectivity error.
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

/// Represents a server-side error.
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'A server error occurred']);
}

/// Represents an authentication error.
class GeneralAuthFailure extends Failure {
  const GeneralAuthFailure([super.message = 'Authentication failed']);
}

/// Represents a data validation error.
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// Represents an operation timeout.
class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = 'The operation timed out']);
}

/// Represents an unknown or unhandled error.
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred']);
}
