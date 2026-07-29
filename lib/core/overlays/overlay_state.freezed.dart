// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overlay_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OverlayRequest {

 String get id; Widget get child; OverlayPriority get priority; bool get dismissible;
/// Create a copy of OverlayRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverlayRequestCopyWith<OverlayRequest> get copyWith => _$OverlayRequestCopyWithImpl<OverlayRequest>(this as OverlayRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.child, child) || other.child == child)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.dismissible, dismissible) || other.dismissible == dismissible));
}


@override
int get hashCode => Object.hash(runtimeType,id,child,priority,dismissible);

@override
String toString() {
  return 'OverlayRequest(id: $id, child: $child, priority: $priority, dismissible: $dismissible)';
}


}

/// @nodoc
abstract mixin class $OverlayRequestCopyWith<$Res>  {
  factory $OverlayRequestCopyWith(OverlayRequest value, $Res Function(OverlayRequest) _then) = _$OverlayRequestCopyWithImpl;
@useResult
$Res call({
 String id, Widget child, OverlayPriority priority, bool dismissible
});




}
/// @nodoc
class _$OverlayRequestCopyWithImpl<$Res>
    implements $OverlayRequestCopyWith<$Res> {
  _$OverlayRequestCopyWithImpl(this._self, this._then);

  final OverlayRequest _self;
  final $Res Function(OverlayRequest) _then;

/// Create a copy of OverlayRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? child = null,Object? priority = null,Object? dismissible = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,child: null == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as Widget,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as OverlayPriority,dismissible: null == dismissible ? _self.dismissible : dismissible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OverlayRequest].
extension OverlayRequestPatterns on OverlayRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OverlayRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OverlayRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OverlayRequest value)  $default,){
final _that = this;
switch (_that) {
case _OverlayRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OverlayRequest value)?  $default,){
final _that = this;
switch (_that) {
case _OverlayRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Widget child,  OverlayPriority priority,  bool dismissible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OverlayRequest() when $default != null:
return $default(_that.id,_that.child,_that.priority,_that.dismissible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Widget child,  OverlayPriority priority,  bool dismissible)  $default,) {final _that = this;
switch (_that) {
case _OverlayRequest():
return $default(_that.id,_that.child,_that.priority,_that.dismissible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Widget child,  OverlayPriority priority,  bool dismissible)?  $default,) {final _that = this;
switch (_that) {
case _OverlayRequest() when $default != null:
return $default(_that.id,_that.child,_that.priority,_that.dismissible);case _:
  return null;

}
}

}

/// @nodoc


class _OverlayRequest implements OverlayRequest {
  const _OverlayRequest({required this.id, required this.child, this.priority = OverlayPriority.normal, this.dismissible = true});
  

@override final  String id;
@override final  Widget child;
@override@JsonKey() final  OverlayPriority priority;
@override@JsonKey() final  bool dismissible;

/// Create a copy of OverlayRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverlayRequestCopyWith<_OverlayRequest> get copyWith => __$OverlayRequestCopyWithImpl<_OverlayRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverlayRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.child, child) || other.child == child)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.dismissible, dismissible) || other.dismissible == dismissible));
}


@override
int get hashCode => Object.hash(runtimeType,id,child,priority,dismissible);

@override
String toString() {
  return 'OverlayRequest(id: $id, child: $child, priority: $priority, dismissible: $dismissible)';
}


}

/// @nodoc
abstract mixin class _$OverlayRequestCopyWith<$Res> implements $OverlayRequestCopyWith<$Res> {
  factory _$OverlayRequestCopyWith(_OverlayRequest value, $Res Function(_OverlayRequest) _then) = __$OverlayRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, Widget child, OverlayPriority priority, bool dismissible
});




}
/// @nodoc
class __$OverlayRequestCopyWithImpl<$Res>
    implements _$OverlayRequestCopyWith<$Res> {
  __$OverlayRequestCopyWithImpl(this._self, this._then);

  final _OverlayRequest _self;
  final $Res Function(_OverlayRequest) _then;

/// Create a copy of OverlayRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? child = null,Object? priority = null,Object? dismissible = null,}) {
  return _then(_OverlayRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,child: null == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as Widget,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as OverlayPriority,dismissible: null == dismissible ? _self.dismissible : dismissible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$OverlayState {

 List<OverlayRequest> get queue; OverlayRequest? get activeOverlay;
/// Create a copy of OverlayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverlayStateCopyWith<OverlayState> get copyWith => _$OverlayStateCopyWithImpl<OverlayState>(this as OverlayState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayState&&const DeepCollectionEquality().equals(other.queue, queue)&&(identical(other.activeOverlay, activeOverlay) || other.activeOverlay == activeOverlay));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(queue),activeOverlay);

@override
String toString() {
  return 'OverlayState(queue: $queue, activeOverlay: $activeOverlay)';
}


}

/// @nodoc
abstract mixin class $OverlayStateCopyWith<$Res>  {
  factory $OverlayStateCopyWith(OverlayState value, $Res Function(OverlayState) _then) = _$OverlayStateCopyWithImpl;
@useResult
$Res call({
 List<OverlayRequest> queue, OverlayRequest? activeOverlay
});


$OverlayRequestCopyWith<$Res>? get activeOverlay;

}
/// @nodoc
class _$OverlayStateCopyWithImpl<$Res>
    implements $OverlayStateCopyWith<$Res> {
  _$OverlayStateCopyWithImpl(this._self, this._then);

  final OverlayState _self;
  final $Res Function(OverlayState) _then;

/// Create a copy of OverlayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? queue = null,Object? activeOverlay = freezed,}) {
  return _then(_self.copyWith(
queue: null == queue ? _self.queue : queue // ignore: cast_nullable_to_non_nullable
as List<OverlayRequest>,activeOverlay: freezed == activeOverlay ? _self.activeOverlay : activeOverlay // ignore: cast_nullable_to_non_nullable
as OverlayRequest?,
  ));
}
/// Create a copy of OverlayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OverlayRequestCopyWith<$Res>? get activeOverlay {
    if (_self.activeOverlay == null) {
    return null;
  }

  return $OverlayRequestCopyWith<$Res>(_self.activeOverlay!, (value) {
    return _then(_self.copyWith(activeOverlay: value));
  });
}
}


/// Adds pattern-matching-related methods to [OverlayState].
extension OverlayStatePatterns on OverlayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OverlayState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OverlayState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OverlayState value)  $default,){
final _that = this;
switch (_that) {
case _OverlayState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OverlayState value)?  $default,){
final _that = this;
switch (_that) {
case _OverlayState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OverlayRequest> queue,  OverlayRequest? activeOverlay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OverlayState() when $default != null:
return $default(_that.queue,_that.activeOverlay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OverlayRequest> queue,  OverlayRequest? activeOverlay)  $default,) {final _that = this;
switch (_that) {
case _OverlayState():
return $default(_that.queue,_that.activeOverlay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OverlayRequest> queue,  OverlayRequest? activeOverlay)?  $default,) {final _that = this;
switch (_that) {
case _OverlayState() when $default != null:
return $default(_that.queue,_that.activeOverlay);case _:
  return null;

}
}

}

/// @nodoc


class _OverlayState implements OverlayState {
  const _OverlayState({final  List<OverlayRequest> queue = const [], this.activeOverlay}): _queue = queue;
  

 final  List<OverlayRequest> _queue;
@override@JsonKey() List<OverlayRequest> get queue {
  if (_queue is EqualUnmodifiableListView) return _queue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queue);
}

@override final  OverlayRequest? activeOverlay;

/// Create a copy of OverlayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverlayStateCopyWith<_OverlayState> get copyWith => __$OverlayStateCopyWithImpl<_OverlayState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverlayState&&const DeepCollectionEquality().equals(other._queue, _queue)&&(identical(other.activeOverlay, activeOverlay) || other.activeOverlay == activeOverlay));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_queue),activeOverlay);

@override
String toString() {
  return 'OverlayState(queue: $queue, activeOverlay: $activeOverlay)';
}


}

/// @nodoc
abstract mixin class _$OverlayStateCopyWith<$Res> implements $OverlayStateCopyWith<$Res> {
  factory _$OverlayStateCopyWith(_OverlayState value, $Res Function(_OverlayState) _then) = __$OverlayStateCopyWithImpl;
@override @useResult
$Res call({
 List<OverlayRequest> queue, OverlayRequest? activeOverlay
});


@override $OverlayRequestCopyWith<$Res>? get activeOverlay;

}
/// @nodoc
class __$OverlayStateCopyWithImpl<$Res>
    implements _$OverlayStateCopyWith<$Res> {
  __$OverlayStateCopyWithImpl(this._self, this._then);

  final _OverlayState _self;
  final $Res Function(_OverlayState) _then;

/// Create a copy of OverlayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? queue = null,Object? activeOverlay = freezed,}) {
  return _then(_OverlayState(
queue: null == queue ? _self._queue : queue // ignore: cast_nullable_to_non_nullable
as List<OverlayRequest>,activeOverlay: freezed == activeOverlay ? _self.activeOverlay : activeOverlay // ignore: cast_nullable_to_non_nullable
as OverlayRequest?,
  ));
}

/// Create a copy of OverlayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OverlayRequestCopyWith<$Res>? get activeOverlay {
    if (_self.activeOverlay == null) {
    return null;
  }

  return $OverlayRequestCopyWith<$Res>(_self.activeOverlay!, (value) {
    return _then(_self.copyWith(activeOverlay: value));
  });
}
}

// dart format on
