import 'package:freezed_annotation/freezed_annotation.dart';
import 'auth_provider_type.dart';

part 'social_account.freezed.dart';

/// Represents a linked social identity for a user.
@freezed
abstract class SocialAccount with _$SocialAccount {
  const factory SocialAccount({
    required String uid,
    required AuthProviderType provider,
    String? displayName,
    String? email,
    String? photoUrl,
    DateTime? linkedAt,
  }) = _SocialAccount;
}
