// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LearningProfile {

 EducationLevel get educationLevel; String? get institution; List<String> get preferredCategories; DifficultyPreference get difficultyPreference; DailyLearningGoal get dailyGoal; CompetitionPreference get competitionPreference; Map<String, bool> get notificationPreferences; String? get avatarId;
/// Create a copy of LearningProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningProfileCopyWith<LearningProfile> get copyWith => _$LearningProfileCopyWithImpl<LearningProfile>(this as LearningProfile, _$identity);

  /// Serializes this LearningProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningProfile&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.institution, institution) || other.institution == institution)&&const DeepCollectionEquality().equals(other.preferredCategories, preferredCategories)&&(identical(other.difficultyPreference, difficultyPreference) || other.difficultyPreference == difficultyPreference)&&(identical(other.dailyGoal, dailyGoal) || other.dailyGoal == dailyGoal)&&(identical(other.competitionPreference, competitionPreference) || other.competitionPreference == competitionPreference)&&const DeepCollectionEquality().equals(other.notificationPreferences, notificationPreferences)&&(identical(other.avatarId, avatarId) || other.avatarId == avatarId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,educationLevel,institution,const DeepCollectionEquality().hash(preferredCategories),difficultyPreference,dailyGoal,competitionPreference,const DeepCollectionEquality().hash(notificationPreferences),avatarId);

@override
String toString() {
  return 'LearningProfile(educationLevel: $educationLevel, institution: $institution, preferredCategories: $preferredCategories, difficultyPreference: $difficultyPreference, dailyGoal: $dailyGoal, competitionPreference: $competitionPreference, notificationPreferences: $notificationPreferences, avatarId: $avatarId)';
}


}

/// @nodoc
abstract mixin class $LearningProfileCopyWith<$Res>  {
  factory $LearningProfileCopyWith(LearningProfile value, $Res Function(LearningProfile) _then) = _$LearningProfileCopyWithImpl;
@useResult
$Res call({
 EducationLevel educationLevel, String? institution, List<String> preferredCategories, DifficultyPreference difficultyPreference, DailyLearningGoal dailyGoal, CompetitionPreference competitionPreference, Map<String, bool> notificationPreferences, String? avatarId
});




}
/// @nodoc
class _$LearningProfileCopyWithImpl<$Res>
    implements $LearningProfileCopyWith<$Res> {
  _$LearningProfileCopyWithImpl(this._self, this._then);

  final LearningProfile _self;
  final $Res Function(LearningProfile) _then;

/// Create a copy of LearningProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? educationLevel = null,Object? institution = freezed,Object? preferredCategories = null,Object? difficultyPreference = null,Object? dailyGoal = null,Object? competitionPreference = null,Object? notificationPreferences = null,Object? avatarId = freezed,}) {
  return _then(_self.copyWith(
educationLevel: null == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as EducationLevel,institution: freezed == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String?,preferredCategories: null == preferredCategories ? _self.preferredCategories : preferredCategories // ignore: cast_nullable_to_non_nullable
as List<String>,difficultyPreference: null == difficultyPreference ? _self.difficultyPreference : difficultyPreference // ignore: cast_nullable_to_non_nullable
as DifficultyPreference,dailyGoal: null == dailyGoal ? _self.dailyGoal : dailyGoal // ignore: cast_nullable_to_non_nullable
as DailyLearningGoal,competitionPreference: null == competitionPreference ? _self.competitionPreference : competitionPreference // ignore: cast_nullable_to_non_nullable
as CompetitionPreference,notificationPreferences: null == notificationPreferences ? _self.notificationPreferences : notificationPreferences // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,avatarId: freezed == avatarId ? _self.avatarId : avatarId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LearningProfile].
extension LearningProfilePatterns on LearningProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearningProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearningProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearningProfile value)  $default,){
final _that = this;
switch (_that) {
case _LearningProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearningProfile value)?  $default,){
final _that = this;
switch (_that) {
case _LearningProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EducationLevel educationLevel,  String? institution,  List<String> preferredCategories,  DifficultyPreference difficultyPreference,  DailyLearningGoal dailyGoal,  CompetitionPreference competitionPreference,  Map<String, bool> notificationPreferences,  String? avatarId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearningProfile() when $default != null:
return $default(_that.educationLevel,_that.institution,_that.preferredCategories,_that.difficultyPreference,_that.dailyGoal,_that.competitionPreference,_that.notificationPreferences,_that.avatarId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EducationLevel educationLevel,  String? institution,  List<String> preferredCategories,  DifficultyPreference difficultyPreference,  DailyLearningGoal dailyGoal,  CompetitionPreference competitionPreference,  Map<String, bool> notificationPreferences,  String? avatarId)  $default,) {final _that = this;
switch (_that) {
case _LearningProfile():
return $default(_that.educationLevel,_that.institution,_that.preferredCategories,_that.difficultyPreference,_that.dailyGoal,_that.competitionPreference,_that.notificationPreferences,_that.avatarId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EducationLevel educationLevel,  String? institution,  List<String> preferredCategories,  DifficultyPreference difficultyPreference,  DailyLearningGoal dailyGoal,  CompetitionPreference competitionPreference,  Map<String, bool> notificationPreferences,  String? avatarId)?  $default,) {final _that = this;
switch (_that) {
case _LearningProfile() when $default != null:
return $default(_that.educationLevel,_that.institution,_that.preferredCategories,_that.difficultyPreference,_that.dailyGoal,_that.competitionPreference,_that.notificationPreferences,_that.avatarId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LearningProfile implements LearningProfile {
  const _LearningProfile({this.educationLevel = EducationLevel.other, this.institution, final  List<String> preferredCategories = const [], this.difficultyPreference = DifficultyPreference.adaptive, this.dailyGoal = DailyLearningGoal.ten, this.competitionPreference = CompetitionPreference.friendly, final  Map<String, bool> notificationPreferences = const {'dailyReminder' : true, 'tournamentAlerts' : true, 'friendChallenges' : true, 'leaderboardUpdates' : true, 'rewards' : true, 'achievements' : true}, this.avatarId}): _preferredCategories = preferredCategories,_notificationPreferences = notificationPreferences;
  factory _LearningProfile.fromJson(Map<String, dynamic> json) => _$LearningProfileFromJson(json);

@override@JsonKey() final  EducationLevel educationLevel;
@override final  String? institution;
 final  List<String> _preferredCategories;
@override@JsonKey() List<String> get preferredCategories {
  if (_preferredCategories is EqualUnmodifiableListView) return _preferredCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preferredCategories);
}

@override@JsonKey() final  DifficultyPreference difficultyPreference;
@override@JsonKey() final  DailyLearningGoal dailyGoal;
@override@JsonKey() final  CompetitionPreference competitionPreference;
 final  Map<String, bool> _notificationPreferences;
@override@JsonKey() Map<String, bool> get notificationPreferences {
  if (_notificationPreferences is EqualUnmodifiableMapView) return _notificationPreferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_notificationPreferences);
}

@override final  String? avatarId;

/// Create a copy of LearningProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningProfileCopyWith<_LearningProfile> get copyWith => __$LearningProfileCopyWithImpl<_LearningProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LearningProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningProfile&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.institution, institution) || other.institution == institution)&&const DeepCollectionEquality().equals(other._preferredCategories, _preferredCategories)&&(identical(other.difficultyPreference, difficultyPreference) || other.difficultyPreference == difficultyPreference)&&(identical(other.dailyGoal, dailyGoal) || other.dailyGoal == dailyGoal)&&(identical(other.competitionPreference, competitionPreference) || other.competitionPreference == competitionPreference)&&const DeepCollectionEquality().equals(other._notificationPreferences, _notificationPreferences)&&(identical(other.avatarId, avatarId) || other.avatarId == avatarId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,educationLevel,institution,const DeepCollectionEquality().hash(_preferredCategories),difficultyPreference,dailyGoal,competitionPreference,const DeepCollectionEquality().hash(_notificationPreferences),avatarId);

@override
String toString() {
  return 'LearningProfile(educationLevel: $educationLevel, institution: $institution, preferredCategories: $preferredCategories, difficultyPreference: $difficultyPreference, dailyGoal: $dailyGoal, competitionPreference: $competitionPreference, notificationPreferences: $notificationPreferences, avatarId: $avatarId)';
}


}

/// @nodoc
abstract mixin class _$LearningProfileCopyWith<$Res> implements $LearningProfileCopyWith<$Res> {
  factory _$LearningProfileCopyWith(_LearningProfile value, $Res Function(_LearningProfile) _then) = __$LearningProfileCopyWithImpl;
@override @useResult
$Res call({
 EducationLevel educationLevel, String? institution, List<String> preferredCategories, DifficultyPreference difficultyPreference, DailyLearningGoal dailyGoal, CompetitionPreference competitionPreference, Map<String, bool> notificationPreferences, String? avatarId
});




}
/// @nodoc
class __$LearningProfileCopyWithImpl<$Res>
    implements _$LearningProfileCopyWith<$Res> {
  __$LearningProfileCopyWithImpl(this._self, this._then);

  final _LearningProfile _self;
  final $Res Function(_LearningProfile) _then;

/// Create a copy of LearningProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? educationLevel = null,Object? institution = freezed,Object? preferredCategories = null,Object? difficultyPreference = null,Object? dailyGoal = null,Object? competitionPreference = null,Object? notificationPreferences = null,Object? avatarId = freezed,}) {
  return _then(_LearningProfile(
educationLevel: null == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as EducationLevel,institution: freezed == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String?,preferredCategories: null == preferredCategories ? _self._preferredCategories : preferredCategories // ignore: cast_nullable_to_non_nullable
as List<String>,difficultyPreference: null == difficultyPreference ? _self.difficultyPreference : difficultyPreference // ignore: cast_nullable_to_non_nullable
as DifficultyPreference,dailyGoal: null == dailyGoal ? _self.dailyGoal : dailyGoal // ignore: cast_nullable_to_non_nullable
as DailyLearningGoal,competitionPreference: null == competitionPreference ? _self.competitionPreference : competitionPreference // ignore: cast_nullable_to_non_nullable
as CompetitionPreference,notificationPreferences: null == notificationPreferences ? _self._notificationPreferences : notificationPreferences // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,avatarId: freezed == avatarId ? _self.avatarId : avatarId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
