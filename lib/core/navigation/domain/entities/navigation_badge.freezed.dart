// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_badge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NavigationBadge {

 int get count; bool get showDot; bool get visible;
/// Create a copy of NavigationBadge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationBadgeCopyWith<NavigationBadge> get copyWith => _$NavigationBadgeCopyWithImpl<NavigationBadge>(this as NavigationBadge, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationBadge&&(identical(other.count, count) || other.count == count)&&(identical(other.showDot, showDot) || other.showDot == showDot)&&(identical(other.visible, visible) || other.visible == visible));
}


@override
int get hashCode => Object.hash(runtimeType,count,showDot,visible);

@override
String toString() {
  return 'NavigationBadge(count: $count, showDot: $showDot, visible: $visible)';
}


}

/// @nodoc
abstract mixin class $NavigationBadgeCopyWith<$Res>  {
  factory $NavigationBadgeCopyWith(NavigationBadge value, $Res Function(NavigationBadge) _then) = _$NavigationBadgeCopyWithImpl;
@useResult
$Res call({
 int count, bool showDot, bool visible
});




}
/// @nodoc
class _$NavigationBadgeCopyWithImpl<$Res>
    implements $NavigationBadgeCopyWith<$Res> {
  _$NavigationBadgeCopyWithImpl(this._self, this._then);

  final NavigationBadge _self;
  final $Res Function(NavigationBadge) _then;

/// Create a copy of NavigationBadge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? showDot = null,Object? visible = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,showDot: null == showDot ? _self.showDot : showDot // ignore: cast_nullable_to_non_nullable
as bool,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NavigationBadge].
extension NavigationBadgePatterns on NavigationBadge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationBadge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationBadge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationBadge value)  $default,){
final _that = this;
switch (_that) {
case _NavigationBadge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationBadge value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationBadge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  bool showDot,  bool visible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationBadge() when $default != null:
return $default(_that.count,_that.showDot,_that.visible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  bool showDot,  bool visible)  $default,) {final _that = this;
switch (_that) {
case _NavigationBadge():
return $default(_that.count,_that.showDot,_that.visible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  bool showDot,  bool visible)?  $default,) {final _that = this;
switch (_that) {
case _NavigationBadge() when $default != null:
return $default(_that.count,_that.showDot,_that.visible);case _:
  return null;

}
}

}

/// @nodoc


class _NavigationBadge extends NavigationBadge {
  const _NavigationBadge({this.count = 0, this.showDot = false, this.visible = true}): super._();
  

@override@JsonKey() final  int count;
@override@JsonKey() final  bool showDot;
@override@JsonKey() final  bool visible;

/// Create a copy of NavigationBadge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationBadgeCopyWith<_NavigationBadge> get copyWith => __$NavigationBadgeCopyWithImpl<_NavigationBadge>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationBadge&&(identical(other.count, count) || other.count == count)&&(identical(other.showDot, showDot) || other.showDot == showDot)&&(identical(other.visible, visible) || other.visible == visible));
}


@override
int get hashCode => Object.hash(runtimeType,count,showDot,visible);

@override
String toString() {
  return 'NavigationBadge(count: $count, showDot: $showDot, visible: $visible)';
}


}

/// @nodoc
abstract mixin class _$NavigationBadgeCopyWith<$Res> implements $NavigationBadgeCopyWith<$Res> {
  factory _$NavigationBadgeCopyWith(_NavigationBadge value, $Res Function(_NavigationBadge) _then) = __$NavigationBadgeCopyWithImpl;
@override @useResult
$Res call({
 int count, bool showDot, bool visible
});




}
/// @nodoc
class __$NavigationBadgeCopyWithImpl<$Res>
    implements _$NavigationBadgeCopyWith<$Res> {
  __$NavigationBadgeCopyWithImpl(this._self, this._then);

  final _NavigationBadge _self;
  final $Res Function(_NavigationBadge) _then;

/// Create a copy of NavigationBadge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? showDot = null,Object? visible = null,}) {
  return _then(_NavigationBadge(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,showDot: null == showDot ? _self.showDot : showDot // ignore: cast_nullable_to_non_nullable
as bool,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
