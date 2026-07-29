/// Defines the various stages of the account recovery process.
enum RecoveryStatus {
  /// Initial state, awaiting email entry.
  idle,

  /// Currently requesting a recovery code or verifying.
  loading,

  /// Recovery code has been sent to the user's email/phone.
  codeSent,

  /// The recovery code has been successfully verified.
  codeVerified,

  /// Password has been successfully reset.
  success,

  /// The recovery process has failed.
  failure,

  /// The recovery code or session has expired.
  expired,
}
