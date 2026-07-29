// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegistrationState {

 int get currentStep; int get totalSteps; String get email; String get password; String get confirmPassword; String get firstName; String get lastName; String get username; String get referralCode; RegistrationStatus get status; Failure? get failure; bool get isUsernameAvailable; bool get isCheckingUsername;
/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationStateCopyWith<RegistrationState> get copyWith => _$RegistrationStateCopyWithImpl<RegistrationState>(this as RegistrationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.totalSteps, totalSteps) || other.totalSteps == totalSteps)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.username, username) || other.username == username)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.isUsernameAvailable, isUsernameAvailable) || other.isUsernameAvailable == isUsernameAvailable)&&(identical(other.isCheckingUsername, isCheckingUsername) || other.isCheckingUsername == isCheckingUsername));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,totalSteps,email,password,confirmPassword,firstName,lastName,username,referralCode,status,failure,isUsernameAvailable,isCheckingUsername);

@override
String toString() {
  return 'RegistrationState(currentStep: $currentStep, totalSteps: $totalSteps, email: $email, password: $password, confirmPassword: $confirmPassword, firstName: $firstName, lastName: $lastName, username: $username, referralCode: $referralCode, status: $status, failure: $failure, isUsernameAvailable: $isUsernameAvailable, isCheckingUsername: $isCheckingUsername)';
}


}

/// @nodoc
abstract mixin class $RegistrationStateCopyWith<$Res>  {
  factory $RegistrationStateCopyWith(RegistrationState value, $Res Function(RegistrationState) _then) = _$RegistrationStateCopyWithImpl;
@useResult
$Res call({
 int currentStep, int totalSteps, String email, String password, String confirmPassword, String firstName, String lastName, String username, String referralCode, RegistrationStatus status, Failure? failure, bool isUsernameAvailable, bool isCheckingUsername
});




}
/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._self, this._then);

  final RegistrationState _self;
  final $Res Function(RegistrationState) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? totalSteps = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? firstName = null,Object? lastName = null,Object? username = null,Object? referralCode = null,Object? status = null,Object? failure = freezed,Object? isUsernameAvailable = null,Object? isCheckingUsername = null,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,totalSteps: null == totalSteps ? _self.totalSteps : totalSteps // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RegistrationStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,isUsernameAvailable: null == isUsernameAvailable ? _self.isUsernameAvailable : isUsernameAvailable // ignore: cast_nullable_to_non_nullable
as bool,isCheckingUsername: null == isCheckingUsername ? _self.isCheckingUsername : isCheckingUsername // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RegistrationState].
extension RegistrationStatePatterns on RegistrationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegistrationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistrationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegistrationState value)  $default,){
final _that = this;
switch (_that) {
case _RegistrationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegistrationState value)?  $default,){
final _that = this;
switch (_that) {
case _RegistrationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStep,  int totalSteps,  String email,  String password,  String confirmPassword,  String firstName,  String lastName,  String username,  String referralCode,  RegistrationStatus status,  Failure? failure,  bool isUsernameAvailable,  bool isCheckingUsername)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationState() when $default != null:
return $default(_that.currentStep,_that.totalSteps,_that.email,_that.password,_that.confirmPassword,_that.firstName,_that.lastName,_that.username,_that.referralCode,_that.status,_that.failure,_that.isUsernameAvailable,_that.isCheckingUsername);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStep,  int totalSteps,  String email,  String password,  String confirmPassword,  String firstName,  String lastName,  String username,  String referralCode,  RegistrationStatus status,  Failure? failure,  bool isUsernameAvailable,  bool isCheckingUsername)  $default,) {final _that = this;
switch (_that) {
case _RegistrationState():
return $default(_that.currentStep,_that.totalSteps,_that.email,_that.password,_that.confirmPassword,_that.firstName,_that.lastName,_that.username,_that.referralCode,_that.status,_that.failure,_that.isUsernameAvailable,_that.isCheckingUsername);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStep,  int totalSteps,  String email,  String password,  String confirmPassword,  String firstName,  String lastName,  String username,  String referralCode,  RegistrationStatus status,  Failure? failure,  bool isUsernameAvailable,  bool isCheckingUsername)?  $default,) {final _that = this;
switch (_that) {
case _RegistrationState() when $default != null:
return $default(_that.currentStep,_that.totalSteps,_that.email,_that.password,_that.confirmPassword,_that.firstName,_that.lastName,_that.username,_that.referralCode,_that.status,_that.failure,_that.isUsernameAvailable,_that.isCheckingUsername);case _:
  return null;

}
}

}

/// @nodoc


class _RegistrationState extends RegistrationState {
  const _RegistrationState({this.currentStep = 0, this.totalSteps = 3, this.email = '', this.password = '', this.confirmPassword = '', this.firstName = '', this.lastName = '', this.username = '', this.referralCode = '', this.status = RegistrationStatus.idle, this.failure, this.isUsernameAvailable = false, this.isCheckingUsername = false}): super._();
  

@override@JsonKey() final  int currentStep;
@override@JsonKey() final  int totalSteps;
@override@JsonKey() final  String email;
@override@JsonKey() final  String password;
@override@JsonKey() final  String confirmPassword;
@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  String username;
@override@JsonKey() final  String referralCode;
@override@JsonKey() final  RegistrationStatus status;
@override final  Failure? failure;
@override@JsonKey() final  bool isUsernameAvailable;
@override@JsonKey() final  bool isCheckingUsername;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationStateCopyWith<_RegistrationState> get copyWith => __$RegistrationStateCopyWithImpl<_RegistrationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.totalSteps, totalSteps) || other.totalSteps == totalSteps)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.username, username) || other.username == username)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.isUsernameAvailable, isUsernameAvailable) || other.isUsernameAvailable == isUsernameAvailable)&&(identical(other.isCheckingUsername, isCheckingUsername) || other.isCheckingUsername == isCheckingUsername));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,totalSteps,email,password,confirmPassword,firstName,lastName,username,referralCode,status,failure,isUsernameAvailable,isCheckingUsername);

@override
String toString() {
  return 'RegistrationState(currentStep: $currentStep, totalSteps: $totalSteps, email: $email, password: $password, confirmPassword: $confirmPassword, firstName: $firstName, lastName: $lastName, username: $username, referralCode: $referralCode, status: $status, failure: $failure, isUsernameAvailable: $isUsernameAvailable, isCheckingUsername: $isCheckingUsername)';
}


}

/// @nodoc
abstract mixin class _$RegistrationStateCopyWith<$Res> implements $RegistrationStateCopyWith<$Res> {
  factory _$RegistrationStateCopyWith(_RegistrationState value, $Res Function(_RegistrationState) _then) = __$RegistrationStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStep, int totalSteps, String email, String password, String confirmPassword, String firstName, String lastName, String username, String referralCode, RegistrationStatus status, Failure? failure, bool isUsernameAvailable, bool isCheckingUsername
});




}
/// @nodoc
class __$RegistrationStateCopyWithImpl<$Res>
    implements _$RegistrationStateCopyWith<$Res> {
  __$RegistrationStateCopyWithImpl(this._self, this._then);

  final _RegistrationState _self;
  final $Res Function(_RegistrationState) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? totalSteps = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? firstName = null,Object? lastName = null,Object? username = null,Object? referralCode = null,Object? status = null,Object? failure = freezed,Object? isUsernameAvailable = null,Object? isCheckingUsername = null,}) {
  return _then(_RegistrationState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,totalSteps: null == totalSteps ? _self.totalSteps : totalSteps // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RegistrationStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,isUsernameAvailable: null == isUsernameAvailable ? _self.isUsernameAvailable : isUsernameAvailable // ignore: cast_nullable_to_non_nullable
as bool,isCheckingUsername: null == isCheckingUsername ? _self.isCheckingUsername : isCheckingUsername // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
