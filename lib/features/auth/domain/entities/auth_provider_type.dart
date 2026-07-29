/// Defines the types of authentication providers supported by the application.
enum AuthProviderType {
  /// Standard email and password authentication.
  email,

  /// Google Sign-In.
  google,

  /// Apple Sign-In.
  apple,

  /// Phone number (SMS) authentication.
  phone,

  /// Anonymous/Guest authentication.
  anonymous,

  /// Microsoft authentication (Future).
  microsoft,

  /// Facebook authentication (Future).
  facebook,

  /// GitHub authentication (Future).
  github,

  /// X (Twitter) authentication (Future).
  x,
}

extension AuthProviderTypeExtension on AuthProviderType {
  String get displayName {
    switch (this) {
      case AuthProviderType.email: return 'Email';
      case AuthProviderType.google: return 'Google';
      case AuthProviderType.apple: return 'Apple';
      case AuthProviderType.phone: return 'Phone';
      case AuthProviderType.anonymous: return 'Guest';
      case AuthProviderType.microsoft: return 'Microsoft';
      case AuthProviderType.facebook: return 'Facebook';
      case AuthProviderType.github: return 'GitHub';
      case AuthProviderType.x: return 'X';
    }
  }
}
