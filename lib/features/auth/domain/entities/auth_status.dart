/// Represents the various states of a user's authentication lifecycle.
enum AuthStatus {
  /// The initial state before checking the session.
  initial,

  /// The user is not logged in.
  unauthenticated,

  /// The user is currently in the process of signing in or out.
  authenticating,

  /// The user is logged in as a permanent user.
  authenticated,

  /// The user is logged in as a guest.
  guest,

  /// The user was logged in, but the session has expired.
  sessionExpired,

  /// An error occurred during an authentication transition.
  error,
}
