// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recovery_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecoverySession {

 RecoveryStatus get status; String? get email; String? get phoneNumber; bool get isVerified; DateTime? get expiresAt; int get resendCountdown;
/// Create a copy of RecoverySession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecoverySessionCopyWith<RecoverySession> get copyWith => _$RecoverySessionCopyWithImpl<RecoverySession>(this as RecoverySession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoverySession&&(identical(other.status, status) || other.status == status)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.resendCountdown, resendCountdown) || other.resendCountdown == resendCountdown));
}


@override
int get hashCode => Object.hash(runtimeType,status,email,phoneNumber,isVerified,expiresAt,resendCountdown);

@override
String toString() {
  return 'RecoverySession(status: $status, email: $email, phoneNumber: $phoneNumber, isVerified: $isVerified, expiresAt: $expiresAt, resendCountdown: $resendCountdown)';
}


}

/// @nodoc
abstract mixin class $RecoverySessionCopyWith<$Res>  {
  factory $RecoverySessionCopyWith(RecoverySession value, $Res Function(RecoverySession) _then) = _$RecoverySessionCopyWithImpl;
@useResult
$Res call({
 RecoveryStatus status, String? email, String? phoneNumber, bool isVerified, DateTime? expiresAt, int resendCountdown
});




}
/// @nodoc
class _$RecoverySessionCopyWithImpl<$Res>
    implements $RecoverySessionCopyWith<$Res> {
  _$RecoverySessionCopyWithImpl(this._self, this._then);

  final RecoverySession _self;
  final $Res Function(RecoverySession) _then;

/// Create a copy of RecoverySession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? email = freezed,Object? phoneNumber = freezed,Object? isVerified = null,Object? expiresAt = freezed,Object? resendCountdown = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RecoveryStatus,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resendCountdown: null == resendCountdown ? _self.resendCountdown : resendCountdown // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RecoverySession].
extension RecoverySessionPatterns on RecoverySession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecoverySession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecoverySession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecoverySession value)  $default,){
final _that = this;
switch (_that) {
case _RecoverySession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecoverySession value)?  $default,){
final _that = this;
switch (_that) {
case _RecoverySession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecoveryStatus status,  String? email,  String? phoneNumber,  bool isVerified,  DateTime? expiresAt,  int resendCountdown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecoverySession() when $default != null:
return $default(_that.status,_that.email,_that.phoneNumber,_that.isVerified,_that.expiresAt,_that.resendCountdown);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecoveryStatus status,  String? email,  String? phoneNumber,  bool isVerified,  DateTime? expiresAt,  int resendCountdown)  $default,) {final _that = this;
switch (_that) {
case _RecoverySession():
return $default(_that.status,_that.email,_that.phoneNumber,_that.isVerified,_that.expiresAt,_that.resendCountdown);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecoveryStatus status,  String? email,  String? phoneNumber,  bool isVerified,  DateTime? expiresAt,  int resendCountdown)?  $default,) {final _that = this;
switch (_that) {
case _RecoverySession() when $default != null:
return $default(_that.status,_that.email,_that.phoneNumber,_that.isVerified,_that.expiresAt,_that.resendCountdown);case _:
  return null;

}
}

}

/// @nodoc


class _RecoverySession extends RecoverySession {
  const _RecoverySession({required this.status, this.email, this.phoneNumber, this.isVerified = false, this.expiresAt, this.resendCountdown = 60}): super._();
  

@override final  RecoveryStatus status;
@override final  String? email;
@override final  String? phoneNumber;
@override@JsonKey() final  bool isVerified;
@override final  DateTime? expiresAt;
@override@JsonKey() final  int resendCountdown;

/// Create a copy of RecoverySession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecoverySessionCopyWith<_RecoverySession> get copyWith => __$RecoverySessionCopyWithImpl<_RecoverySession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecoverySession&&(identical(other.status, status) || other.status == status)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.resendCountdown, resendCountdown) || other.resendCountdown == resendCountdown));
}


@override
int get hashCode => Object.hash(runtimeType,status,email,phoneNumber,isVerified,expiresAt,resendCountdown);

@override
String toString() {
  return 'RecoverySession(status: $status, email: $email, phoneNumber: $phoneNumber, isVerified: $isVerified, expiresAt: $expiresAt, resendCountdown: $resendCountdown)';
}


}

/// @nodoc
abstract mixin class _$RecoverySessionCopyWith<$Res> implements $RecoverySessionCopyWith<$Res> {
  factory _$RecoverySessionCopyWith(_RecoverySession value, $Res Function(_RecoverySession) _then) = __$RecoverySessionCopyWithImpl;
@override @useResult
$Res call({
 RecoveryStatus status, String? email, String? phoneNumber, bool isVerified, DateTime? expiresAt, int resendCountdown
});




}
/// @nodoc
class __$RecoverySessionCopyWithImpl<$Res>
    implements _$RecoverySessionCopyWith<$Res> {
  __$RecoverySessionCopyWithImpl(this._self, this._then);

  final _RecoverySession _self;
  final $Res Function(_RecoverySession) _then;

/// Create a copy of RecoverySession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? email = freezed,Object? phoneNumber = freezed,Object? isVerified = null,Object? expiresAt = freezed,Object? resendCountdown = null,}) {
  return _then(_RecoverySession(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RecoveryStatus,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resendCountdown: null == resendCountdown ? _self.resendCountdown : resendCountdown // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
