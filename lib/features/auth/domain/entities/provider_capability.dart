/// Defines what an authentication provider is capable of doing.
enum ProviderCapability {
  /// The provider supports direct sign-in.
  signIn,

  /// The provider supports linking to an existing account.
  link,

  /// The provider supports unlinking from an account.
  unlink,

  /// The provider supports multi-factor authentication.
  mfa,

  /// The provider supports password resets.
  passwordReset,

  /// The provider supports email verification.
  emailVerification,
}
