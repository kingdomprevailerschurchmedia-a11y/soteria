import '../../../../core/errors/failure.dart';

/// Represents a failure during a session management operation.
sealed class SessionFailure extends Failure {
  const SessionFailure(super.message);
}

/// Thrown when a session is found to be expired.
class SessionExpiredFailure extends SessionFailure {
  const SessionExpiredFailure([super.message = 'Your session has expired.']);
}

/// Thrown when the session data is corrupted or cannot be parsed.
class CorruptedSessionFailure extends SessionFailure {
  const CorruptedSessionFailure([super.message = 'Session data is invalid.']);
}

/// Thrown when an authenticated action is attempted but no session exists.
class MissingSessionFailure extends SessionFailure {
  const MissingSessionFailure([super.message = 'No active session found.']);
}

/// Thrown when session restoration fails due to security reasons.
class SecuritySessionFailure extends SessionFailure {
  const SecuritySessionFailure([super.message = 'A security error occurred while restoring your session.']);
}
