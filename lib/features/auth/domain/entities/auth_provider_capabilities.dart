import 'auth_provider_type.dart';
import 'provider_capability.dart';

/// Defines the capabilities of each supported authentication provider.
class AuthProviderCapabilities {
  static Map<AuthProviderType, List<ProviderCapability>> get capabilities => {
    AuthProviderType.email: [
      ProviderCapability.signIn,
      ProviderCapability.passwordReset,
      ProviderCapability.emailVerification,
    ],
    AuthProviderType.google: [
      ProviderCapability.signIn,
      ProviderCapability.link,
      ProviderCapability.unlink,
    ],
    AuthProviderType.apple: [
      ProviderCapability.signIn,
      ProviderCapability.link,
      ProviderCapability.unlink,
    ],
    AuthProviderType.phone: [
      ProviderCapability.signIn,
      ProviderCapability.mfa,
    ],
    AuthProviderType.anonymous: [
      ProviderCapability.signIn,
      ProviderCapability.link,
    ],
  };
}
