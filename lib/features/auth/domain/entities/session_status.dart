/// Represents the lifecycle status of a user session.
enum SessionStatus {
  /// The session is currently being restored from local storage.
  restoring,

  /// The user is authenticated with a valid session.
  authenticated,

  /// The user is operating as a guest.
  guest,

  /// The session has expired (token expired or idle timeout).
  expired,

  /// The session is locked (e.g. app in background for too long).
  locked,

  /// The user has manually logged out.
  loggedOut,

  /// An error occurred during session management.
  failure,
}
