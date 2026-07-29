// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeDashboard {

 UserStats get stats; List<Tournament> get activeTournaments; String get welcomeMessage;
/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDashboardCopyWith<HomeDashboard> get copyWith => _$HomeDashboardCopyWithImpl<HomeDashboard>(this as HomeDashboard, _$identity);

  /// Serializes this HomeDashboard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDashboard&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other.activeTournaments, activeTournaments)&&(identical(other.welcomeMessage, welcomeMessage) || other.welcomeMessage == welcomeMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stats,const DeepCollectionEquality().hash(activeTournaments),welcomeMessage);

@override
String toString() {
  return 'HomeDashboard(stats: $stats, activeTournaments: $activeTournaments, welcomeMessage: $welcomeMessage)';
}


}

/// @nodoc
abstract mixin class $HomeDashboardCopyWith<$Res>  {
  factory $HomeDashboardCopyWith(HomeDashboard value, $Res Function(HomeDashboard) _then) = _$HomeDashboardCopyWithImpl;
@useResult
$Res call({
 UserStats stats, List<Tournament> activeTournaments, String welcomeMessage
});


$UserStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$HomeDashboardCopyWithImpl<$Res>
    implements $HomeDashboardCopyWith<$Res> {
  _$HomeDashboardCopyWithImpl(this._self, this._then);

  final HomeDashboard _self;
  final $Res Function(HomeDashboard) _then;

/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stats = null,Object? activeTournaments = null,Object? welcomeMessage = null,}) {
  return _then(_self.copyWith(
stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as UserStats,activeTournaments: null == activeTournaments ? _self.activeTournaments : activeTournaments // ignore: cast_nullable_to_non_nullable
as List<Tournament>,welcomeMessage: null == welcomeMessage ? _self.welcomeMessage : welcomeMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserStatsCopyWith<$Res> get stats {
  
  return $UserStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeDashboard].
extension HomeDashboardPatterns on HomeDashboard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeDashboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeDashboard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeDashboard value)  $default,){
final _that = this;
switch (_that) {
case _HomeDashboard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeDashboard value)?  $default,){
final _that = this;
switch (_that) {
case _HomeDashboard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserStats stats,  List<Tournament> activeTournaments,  String welcomeMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeDashboard() when $default != null:
return $default(_that.stats,_that.activeTournaments,_that.welcomeMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserStats stats,  List<Tournament> activeTournaments,  String welcomeMessage)  $default,) {final _that = this;
switch (_that) {
case _HomeDashboard():
return $default(_that.stats,_that.activeTournaments,_that.welcomeMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserStats stats,  List<Tournament> activeTournaments,  String welcomeMessage)?  $default,) {final _that = this;
switch (_that) {
case _HomeDashboard() when $default != null:
return $default(_that.stats,_that.activeTournaments,_that.welcomeMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeDashboard implements HomeDashboard {
  const _HomeDashboard({required this.stats, required final  List<Tournament> activeTournaments, required this.welcomeMessage}): _activeTournaments = activeTournaments;
  factory _HomeDashboard.fromJson(Map<String, dynamic> json) => _$HomeDashboardFromJson(json);

@override final  UserStats stats;
 final  List<Tournament> _activeTournaments;
@override List<Tournament> get activeTournaments {
  if (_activeTournaments is EqualUnmodifiableListView) return _activeTournaments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeTournaments);
}

@override final  String welcomeMessage;

/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeDashboardCopyWith<_HomeDashboard> get copyWith => __$HomeDashboardCopyWithImpl<_HomeDashboard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeDashboardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeDashboard&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other._activeTournaments, _activeTournaments)&&(identical(other.welcomeMessage, welcomeMessage) || other.welcomeMessage == welcomeMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stats,const DeepCollectionEquality().hash(_activeTournaments),welcomeMessage);

@override
String toString() {
  return 'HomeDashboard(stats: $stats, activeTournaments: $activeTournaments, welcomeMessage: $welcomeMessage)';
}


}

/// @nodoc
abstract mixin class _$HomeDashboardCopyWith<$Res> implements $HomeDashboardCopyWith<$Res> {
  factory _$HomeDashboardCopyWith(_HomeDashboard value, $Res Function(_HomeDashboard) _then) = __$HomeDashboardCopyWithImpl;
@override @useResult
$Res call({
 UserStats stats, List<Tournament> activeTournaments, String welcomeMessage
});


@override $UserStatsCopyWith<$Res> get stats;

}
/// @nodoc
class __$HomeDashboardCopyWithImpl<$Res>
    implements _$HomeDashboardCopyWith<$Res> {
  __$HomeDashboardCopyWithImpl(this._self, this._then);

  final _HomeDashboard _self;
  final $Res Function(_HomeDashboard) _then;

/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stats = null,Object? activeTournaments = null,Object? welcomeMessage = null,}) {
  return _then(_HomeDashboard(
stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as UserStats,activeTournaments: null == activeTournaments ? _self._activeTournaments : activeTournaments // ignore: cast_nullable_to_non_nullable
as List<Tournament>,welcomeMessage: null == welcomeMessage ? _self.welcomeMessage : welcomeMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserStatsCopyWith<$Res> get stats {
  
  return $UserStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}

// dart format on
