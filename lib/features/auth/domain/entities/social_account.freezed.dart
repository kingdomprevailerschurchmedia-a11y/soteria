// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SocialAccount {

 String get uid; AuthProviderType get provider; String? get displayName; String? get email; String? get photoUrl; DateTime? get linkedAt;
/// Create a copy of SocialAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialAccountCopyWith<SocialAccount> get copyWith => _$SocialAccountCopyWithImpl<SocialAccount>(this as SocialAccount, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialAccount&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.linkedAt, linkedAt) || other.linkedAt == linkedAt));
}


@override
int get hashCode => Object.hash(runtimeType,uid,provider,displayName,email,photoUrl,linkedAt);

@override
String toString() {
  return 'SocialAccount(uid: $uid, provider: $provider, displayName: $displayName, email: $email, photoUrl: $photoUrl, linkedAt: $linkedAt)';
}


}

/// @nodoc
abstract mixin class $SocialAccountCopyWith<$Res>  {
  factory $SocialAccountCopyWith(SocialAccount value, $Res Function(SocialAccount) _then) = _$SocialAccountCopyWithImpl;
@useResult
$Res call({
 String uid, AuthProviderType provider, String? displayName, String? email, String? photoUrl, DateTime? linkedAt
});




}
/// @nodoc
class _$SocialAccountCopyWithImpl<$Res>
    implements $SocialAccountCopyWith<$Res> {
  _$SocialAccountCopyWithImpl(this._self, this._then);

  final SocialAccount _self;
  final $Res Function(SocialAccount) _then;

/// Create a copy of SocialAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? provider = null,Object? displayName = freezed,Object? email = freezed,Object? photoUrl = freezed,Object? linkedAt = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AuthProviderType,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,linkedAt: freezed == linkedAt ? _self.linkedAt : linkedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SocialAccount].
extension SocialAccountPatterns on SocialAccount {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialAccount() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialAccount value)  $default,){
final _that = this;
switch (_that) {
case _SocialAccount():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialAccount value)?  $default,){
final _that = this;
switch (_that) {
case _SocialAccount() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  AuthProviderType provider,  String? displayName,  String? email,  String? photoUrl,  DateTime? linkedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialAccount() when $default != null:
return $default(_that.uid,_that.provider,_that.displayName,_that.email,_that.photoUrl,_that.linkedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  AuthProviderType provider,  String? displayName,  String? email,  String? photoUrl,  DateTime? linkedAt)  $default,) {final _that = this;
switch (_that) {
case _SocialAccount():
return $default(_that.uid,_that.provider,_that.displayName,_that.email,_that.photoUrl,_that.linkedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  AuthProviderType provider,  String? displayName,  String? email,  String? photoUrl,  DateTime? linkedAt)?  $default,) {final _that = this;
switch (_that) {
case _SocialAccount() when $default != null:
return $default(_that.uid,_that.provider,_that.displayName,_that.email,_that.photoUrl,_that.linkedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SocialAccount implements SocialAccount {
  const _SocialAccount({required this.uid, required this.provider, this.displayName, this.email, this.photoUrl, this.linkedAt});
  

@override final  String uid;
@override final  AuthProviderType provider;
@override final  String? displayName;
@override final  String? email;
@override final  String? photoUrl;
@override final  DateTime? linkedAt;

/// Create a copy of SocialAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialAccountCopyWith<_SocialAccount> get copyWith => __$SocialAccountCopyWithImpl<_SocialAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialAccount&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.linkedAt, linkedAt) || other.linkedAt == linkedAt));
}


@override
int get hashCode => Object.hash(runtimeType,uid,provider,displayName,email,photoUrl,linkedAt);

@override
String toString() {
  return 'SocialAccount(uid: $uid, provider: $provider, displayName: $displayName, email: $email, photoUrl: $photoUrl, linkedAt: $linkedAt)';
}


}

/// @nodoc
abstract mixin class _$SocialAccountCopyWith<$Res> implements $SocialAccountCopyWith<$Res> {
  factory _$SocialAccountCopyWith(_SocialAccount value, $Res Function(_SocialAccount) _then) = __$SocialAccountCopyWithImpl;
@override @useResult
$Res call({
 String uid, AuthProviderType provider, String? displayName, String? email, String? photoUrl, DateTime? linkedAt
});




}
/// @nodoc
class __$SocialAccountCopyWithImpl<$Res>
    implements _$SocialAccountCopyWith<$Res> {
  __$SocialAccountCopyWithImpl(this._self, this._then);

  final _SocialAccount _self;
  final $Res Function(_SocialAccount) _then;

/// Create a copy of SocialAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? provider = null,Object? displayName = freezed,Object? email = freezed,Object? photoUrl = freezed,Object? linkedAt = freezed,}) {
  return _then(_SocialAccount(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AuthProviderType,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,linkedAt: freezed == linkedAt ? _self.linkedAt : linkedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
