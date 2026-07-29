// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppBarState {

 String get title; String get subtitle; bool get isSearchExpanded; bool get isLoading; int get notificationCount; int get coinCount; int get xpCount; int get level;
/// Create a copy of AppBarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppBarStateCopyWith<AppBarState> get copyWith => _$AppBarStateCopyWithImpl<AppBarState>(this as AppBarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppBarState&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.isSearchExpanded, isSearchExpanded) || other.isSearchExpanded == isSearchExpanded)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.notificationCount, notificationCount) || other.notificationCount == notificationCount)&&(identical(other.coinCount, coinCount) || other.coinCount == coinCount)&&(identical(other.xpCount, xpCount) || other.xpCount == xpCount)&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,isSearchExpanded,isLoading,notificationCount,coinCount,xpCount,level);

@override
String toString() {
  return 'AppBarState(title: $title, subtitle: $subtitle, isSearchExpanded: $isSearchExpanded, isLoading: $isLoading, notificationCount: $notificationCount, coinCount: $coinCount, xpCount: $xpCount, level: $level)';
}


}

/// @nodoc
abstract mixin class $AppBarStateCopyWith<$Res>  {
  factory $AppBarStateCopyWith(AppBarState value, $Res Function(AppBarState) _then) = _$AppBarStateCopyWithImpl;
@useResult
$Res call({
 String title, String subtitle, bool isSearchExpanded, bool isLoading, int notificationCount, int coinCount, int xpCount, int level
});




}
/// @nodoc
class _$AppBarStateCopyWithImpl<$Res>
    implements $AppBarStateCopyWith<$Res> {
  _$AppBarStateCopyWithImpl(this._self, this._then);

  final AppBarState _self;
  final $Res Function(AppBarState) _then;

/// Create a copy of AppBarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = null,Object? isSearchExpanded = null,Object? isLoading = null,Object? notificationCount = null,Object? coinCount = null,Object? xpCount = null,Object? level = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,isSearchExpanded: null == isSearchExpanded ? _self.isSearchExpanded : isSearchExpanded // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,notificationCount: null == notificationCount ? _self.notificationCount : notificationCount // ignore: cast_nullable_to_non_nullable
as int,coinCount: null == coinCount ? _self.coinCount : coinCount // ignore: cast_nullable_to_non_nullable
as int,xpCount: null == xpCount ? _self.xpCount : xpCount // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AppBarState].
extension AppBarStatePatterns on AppBarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppBarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppBarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppBarState value)  $default,){
final _that = this;
switch (_that) {
case _AppBarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppBarState value)?  $default,){
final _that = this;
switch (_that) {
case _AppBarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String subtitle,  bool isSearchExpanded,  bool isLoading,  int notificationCount,  int coinCount,  int xpCount,  int level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppBarState() when $default != null:
return $default(_that.title,_that.subtitle,_that.isSearchExpanded,_that.isLoading,_that.notificationCount,_that.coinCount,_that.xpCount,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String subtitle,  bool isSearchExpanded,  bool isLoading,  int notificationCount,  int coinCount,  int xpCount,  int level)  $default,) {final _that = this;
switch (_that) {
case _AppBarState():
return $default(_that.title,_that.subtitle,_that.isSearchExpanded,_that.isLoading,_that.notificationCount,_that.coinCount,_that.xpCount,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String subtitle,  bool isSearchExpanded,  bool isLoading,  int notificationCount,  int coinCount,  int xpCount,  int level)?  $default,) {final _that = this;
switch (_that) {
case _AppBarState() when $default != null:
return $default(_that.title,_that.subtitle,_that.isSearchExpanded,_that.isLoading,_that.notificationCount,_that.coinCount,_that.xpCount,_that.level);case _:
  return null;

}
}

}

/// @nodoc


class _AppBarState implements AppBarState {
  const _AppBarState({this.title = '', this.subtitle = '', this.isSearchExpanded = false, this.isLoading = false, this.notificationCount = 0, this.coinCount = 0, this.xpCount = 0, this.level = 1});
  

@override@JsonKey() final  String title;
@override@JsonKey() final  String subtitle;
@override@JsonKey() final  bool isSearchExpanded;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  int notificationCount;
@override@JsonKey() final  int coinCount;
@override@JsonKey() final  int xpCount;
@override@JsonKey() final  int level;

/// Create a copy of AppBarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppBarStateCopyWith<_AppBarState> get copyWith => __$AppBarStateCopyWithImpl<_AppBarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppBarState&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.isSearchExpanded, isSearchExpanded) || other.isSearchExpanded == isSearchExpanded)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.notificationCount, notificationCount) || other.notificationCount == notificationCount)&&(identical(other.coinCount, coinCount) || other.coinCount == coinCount)&&(identical(other.xpCount, xpCount) || other.xpCount == xpCount)&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,isSearchExpanded,isLoading,notificationCount,coinCount,xpCount,level);

@override
String toString() {
  return 'AppBarState(title: $title, subtitle: $subtitle, isSearchExpanded: $isSearchExpanded, isLoading: $isLoading, notificationCount: $notificationCount, coinCount: $coinCount, xpCount: $xpCount, level: $level)';
}


}

/// @nodoc
abstract mixin class _$AppBarStateCopyWith<$Res> implements $AppBarStateCopyWith<$Res> {
  factory _$AppBarStateCopyWith(_AppBarState value, $Res Function(_AppBarState) _then) = __$AppBarStateCopyWithImpl;
@override @useResult
$Res call({
 String title, String subtitle, bool isSearchExpanded, bool isLoading, int notificationCount, int coinCount, int xpCount, int level
});




}
/// @nodoc
class __$AppBarStateCopyWithImpl<$Res>
    implements _$AppBarStateCopyWith<$Res> {
  __$AppBarStateCopyWithImpl(this._self, this._then);

  final _AppBarState _self;
  final $Res Function(_AppBarState) _then;

/// Create a copy of AppBarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = null,Object? isSearchExpanded = null,Object? isLoading = null,Object? notificationCount = null,Object? coinCount = null,Object? xpCount = null,Object? level = null,}) {
  return _then(_AppBarState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,isSearchExpanded: null == isSearchExpanded ? _self.isSearchExpanded : isSearchExpanded // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,notificationCount: null == notificationCount ? _self.notificationCount : notificationCount // ignore: cast_nullable_to_non_nullable
as int,coinCount: null == coinCount ? _self.coinCount : coinCount // ignore: cast_nullable_to_non_nullable
as int,xpCount: null == xpCount ? _self.xpCount : xpCount // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
