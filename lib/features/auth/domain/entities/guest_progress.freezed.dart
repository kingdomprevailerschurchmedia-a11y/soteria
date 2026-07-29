// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GuestProgress {

 int get xp; int get coins; List<String> get completedQuizIds; List<String> get unlockedAchievements; Map<String, dynamic> get localSettings;
/// Create a copy of GuestProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestProgressCopyWith<GuestProgress> get copyWith => _$GuestProgressCopyWithImpl<GuestProgress>(this as GuestProgress, _$identity);

  /// Serializes this GuestProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestProgress&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.coins, coins) || other.coins == coins)&&const DeepCollectionEquality().equals(other.completedQuizIds, completedQuizIds)&&const DeepCollectionEquality().equals(other.unlockedAchievements, unlockedAchievements)&&const DeepCollectionEquality().equals(other.localSettings, localSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,xp,coins,const DeepCollectionEquality().hash(completedQuizIds),const DeepCollectionEquality().hash(unlockedAchievements),const DeepCollectionEquality().hash(localSettings));

@override
String toString() {
  return 'GuestProgress(xp: $xp, coins: $coins, completedQuizIds: $completedQuizIds, unlockedAchievements: $unlockedAchievements, localSettings: $localSettings)';
}


}

/// @nodoc
abstract mixin class $GuestProgressCopyWith<$Res>  {
  factory $GuestProgressCopyWith(GuestProgress value, $Res Function(GuestProgress) _then) = _$GuestProgressCopyWithImpl;
@useResult
$Res call({
 int xp, int coins, List<String> completedQuizIds, List<String> unlockedAchievements, Map<String, dynamic> localSettings
});




}
/// @nodoc
class _$GuestProgressCopyWithImpl<$Res>
    implements $GuestProgressCopyWith<$Res> {
  _$GuestProgressCopyWithImpl(this._self, this._then);

  final GuestProgress _self;
  final $Res Function(GuestProgress) _then;

/// Create a copy of GuestProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? xp = null,Object? coins = null,Object? completedQuizIds = null,Object? unlockedAchievements = null,Object? localSettings = null,}) {
  return _then(_self.copyWith(
xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,coins: null == coins ? _self.coins : coins // ignore: cast_nullable_to_non_nullable
as int,completedQuizIds: null == completedQuizIds ? _self.completedQuizIds : completedQuizIds // ignore: cast_nullable_to_non_nullable
as List<String>,unlockedAchievements: null == unlockedAchievements ? _self.unlockedAchievements : unlockedAchievements // ignore: cast_nullable_to_non_nullable
as List<String>,localSettings: null == localSettings ? _self.localSettings : localSettings // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [GuestProgress].
extension GuestProgressPatterns on GuestProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuestProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuestProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuestProgress value)  $default,){
final _that = this;
switch (_that) {
case _GuestProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuestProgress value)?  $default,){
final _that = this;
switch (_that) {
case _GuestProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int xp,  int coins,  List<String> completedQuizIds,  List<String> unlockedAchievements,  Map<String, dynamic> localSettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuestProgress() when $default != null:
return $default(_that.xp,_that.coins,_that.completedQuizIds,_that.unlockedAchievements,_that.localSettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int xp,  int coins,  List<String> completedQuizIds,  List<String> unlockedAchievements,  Map<String, dynamic> localSettings)  $default,) {final _that = this;
switch (_that) {
case _GuestProgress():
return $default(_that.xp,_that.coins,_that.completedQuizIds,_that.unlockedAchievements,_that.localSettings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int xp,  int coins,  List<String> completedQuizIds,  List<String> unlockedAchievements,  Map<String, dynamic> localSettings)?  $default,) {final _that = this;
switch (_that) {
case _GuestProgress() when $default != null:
return $default(_that.xp,_that.coins,_that.completedQuizIds,_that.unlockedAchievements,_that.localSettings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuestProgress implements GuestProgress {
  const _GuestProgress({this.xp = 0, this.coins = 0, final  List<String> completedQuizIds = const [], final  List<String> unlockedAchievements = const [], final  Map<String, dynamic> localSettings = const {}}): _completedQuizIds = completedQuizIds,_unlockedAchievements = unlockedAchievements,_localSettings = localSettings;
  factory _GuestProgress.fromJson(Map<String, dynamic> json) => _$GuestProgressFromJson(json);

@override@JsonKey() final  int xp;
@override@JsonKey() final  int coins;
 final  List<String> _completedQuizIds;
@override@JsonKey() List<String> get completedQuizIds {
  if (_completedQuizIds is EqualUnmodifiableListView) return _completedQuizIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedQuizIds);
}

 final  List<String> _unlockedAchievements;
@override@JsonKey() List<String> get unlockedAchievements {
  if (_unlockedAchievements is EqualUnmodifiableListView) return _unlockedAchievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unlockedAchievements);
}

 final  Map<String, dynamic> _localSettings;
@override@JsonKey() Map<String, dynamic> get localSettings {
  if (_localSettings is EqualUnmodifiableMapView) return _localSettings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_localSettings);
}


/// Create a copy of GuestProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuestProgressCopyWith<_GuestProgress> get copyWith => __$GuestProgressCopyWithImpl<_GuestProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuestProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuestProgress&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.coins, coins) || other.coins == coins)&&const DeepCollectionEquality().equals(other._completedQuizIds, _completedQuizIds)&&const DeepCollectionEquality().equals(other._unlockedAchievements, _unlockedAchievements)&&const DeepCollectionEquality().equals(other._localSettings, _localSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,xp,coins,const DeepCollectionEquality().hash(_completedQuizIds),const DeepCollectionEquality().hash(_unlockedAchievements),const DeepCollectionEquality().hash(_localSettings));

@override
String toString() {
  return 'GuestProgress(xp: $xp, coins: $coins, completedQuizIds: $completedQuizIds, unlockedAchievements: $unlockedAchievements, localSettings: $localSettings)';
}


}

/// @nodoc
abstract mixin class _$GuestProgressCopyWith<$Res> implements $GuestProgressCopyWith<$Res> {
  factory _$GuestProgressCopyWith(_GuestProgress value, $Res Function(_GuestProgress) _then) = __$GuestProgressCopyWithImpl;
@override @useResult
$Res call({
 int xp, int coins, List<String> completedQuizIds, List<String> unlockedAchievements, Map<String, dynamic> localSettings
});




}
/// @nodoc
class __$GuestProgressCopyWithImpl<$Res>
    implements _$GuestProgressCopyWith<$Res> {
  __$GuestProgressCopyWithImpl(this._self, this._then);

  final _GuestProgress _self;
  final $Res Function(_GuestProgress) _then;

/// Create a copy of GuestProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? xp = null,Object? coins = null,Object? completedQuizIds = null,Object? unlockedAchievements = null,Object? localSettings = null,}) {
  return _then(_GuestProgress(
xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,coins: null == coins ? _self.coins : coins // ignore: cast_nullable_to_non_nullable
as int,completedQuizIds: null == completedQuizIds ? _self._completedQuizIds : completedQuizIds // ignore: cast_nullable_to_non_nullable
as List<String>,unlockedAchievements: null == unlockedAchievements ? _self._unlockedAchievements : unlockedAchievements // ignore: cast_nullable_to_non_nullable
as List<String>,localSettings: null == localSettings ? _self._localSettings : localSettings // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
