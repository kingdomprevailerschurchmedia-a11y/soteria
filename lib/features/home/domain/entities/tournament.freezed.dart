// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournament.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tournament {

 String get id; String get title; String get prizePool; String get timeLeft; String get entryFee; String get category;
/// Create a copy of Tournament
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentCopyWith<Tournament> get copyWith => _$TournamentCopyWithImpl<Tournament>(this as Tournament, _$identity);

  /// Serializes this Tournament to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tournament&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.prizePool, prizePool) || other.prizePool == prizePool)&&(identical(other.timeLeft, timeLeft) || other.timeLeft == timeLeft)&&(identical(other.entryFee, entryFee) || other.entryFee == entryFee)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,prizePool,timeLeft,entryFee,category);

@override
String toString() {
  return 'Tournament(id: $id, title: $title, prizePool: $prizePool, timeLeft: $timeLeft, entryFee: $entryFee, category: $category)';
}


}

/// @nodoc
abstract mixin class $TournamentCopyWith<$Res>  {
  factory $TournamentCopyWith(Tournament value, $Res Function(Tournament) _then) = _$TournamentCopyWithImpl;
@useResult
$Res call({
 String id, String title, String prizePool, String timeLeft, String entryFee, String category
});




}
/// @nodoc
class _$TournamentCopyWithImpl<$Res>
    implements $TournamentCopyWith<$Res> {
  _$TournamentCopyWithImpl(this._self, this._then);

  final Tournament _self;
  final $Res Function(Tournament) _then;

/// Create a copy of Tournament
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? prizePool = null,Object? timeLeft = null,Object? entryFee = null,Object? category = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,prizePool: null == prizePool ? _self.prizePool : prizePool // ignore: cast_nullable_to_non_nullable
as String,timeLeft: null == timeLeft ? _self.timeLeft : timeLeft // ignore: cast_nullable_to_non_nullable
as String,entryFee: null == entryFee ? _self.entryFee : entryFee // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Tournament].
extension TournamentPatterns on Tournament {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tournament value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tournament() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tournament value)  $default,){
final _that = this;
switch (_that) {
case _Tournament():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tournament value)?  $default,){
final _that = this;
switch (_that) {
case _Tournament() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String prizePool,  String timeLeft,  String entryFee,  String category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tournament() when $default != null:
return $default(_that.id,_that.title,_that.prizePool,_that.timeLeft,_that.entryFee,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String prizePool,  String timeLeft,  String entryFee,  String category)  $default,) {final _that = this;
switch (_that) {
case _Tournament():
return $default(_that.id,_that.title,_that.prizePool,_that.timeLeft,_that.entryFee,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String prizePool,  String timeLeft,  String entryFee,  String category)?  $default,) {final _that = this;
switch (_that) {
case _Tournament() when $default != null:
return $default(_that.id,_that.title,_that.prizePool,_that.timeLeft,_that.entryFee,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tournament implements Tournament {
  const _Tournament({required this.id, required this.title, required this.prizePool, required this.timeLeft, required this.entryFee, required this.category});
  factory _Tournament.fromJson(Map<String, dynamic> json) => _$TournamentFromJson(json);

@override final  String id;
@override final  String title;
@override final  String prizePool;
@override final  String timeLeft;
@override final  String entryFee;
@override final  String category;

/// Create a copy of Tournament
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TournamentCopyWith<_Tournament> get copyWith => __$TournamentCopyWithImpl<_Tournament>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TournamentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tournament&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.prizePool, prizePool) || other.prizePool == prizePool)&&(identical(other.timeLeft, timeLeft) || other.timeLeft == timeLeft)&&(identical(other.entryFee, entryFee) || other.entryFee == entryFee)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,prizePool,timeLeft,entryFee,category);

@override
String toString() {
  return 'Tournament(id: $id, title: $title, prizePool: $prizePool, timeLeft: $timeLeft, entryFee: $entryFee, category: $category)';
}


}

/// @nodoc
abstract mixin class _$TournamentCopyWith<$Res> implements $TournamentCopyWith<$Res> {
  factory _$TournamentCopyWith(_Tournament value, $Res Function(_Tournament) _then) = __$TournamentCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String prizePool, String timeLeft, String entryFee, String category
});




}
/// @nodoc
class __$TournamentCopyWithImpl<$Res>
    implements _$TournamentCopyWith<$Res> {
  __$TournamentCopyWithImpl(this._self, this._then);

  final _Tournament _self;
  final $Res Function(_Tournament) _then;

/// Create a copy of Tournament
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? prizePool = null,Object? timeLeft = null,Object? entryFee = null,Object? category = null,}) {
  return _then(_Tournament(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,prizePool: null == prizePool ? _self.prizePool : prizePool // ignore: cast_nullable_to_non_nullable
as String,timeLeft: null == timeLeft ? _self.timeLeft : timeLeft // ignore: cast_nullable_to_non_nullable
as String,entryFee: null == entryFee ? _self.entryFee : entryFee // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
