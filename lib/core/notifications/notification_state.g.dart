// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      category: $enumDecode(_$NotificationCategoryEnumMap, json['category']),
      priority: $enumDecode(_$NotificationPriorityEnumMap, json['priority']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
      isPinned: json['isPinned'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'category': _$NotificationCategoryEnumMap[instance.category]!,
      'priority': _$NotificationPriorityEnumMap[instance.priority]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'isRead': instance.isRead,
      'isPinned': instance.isPinned,
    };

const _$NotificationCategoryEnumMap = {
  NotificationCategory.system: 'system',
  NotificationCategory.tournament: 'tournament',
  NotificationCategory.practice: 'practice',
  NotificationCategory.competition: 'competition',
  NotificationCategory.friend: 'friend',
  NotificationCategory.achievement: 'achievement',
  NotificationCategory.wallet: 'wallet',
};

const _$NotificationPriorityEnumMap = {
  NotificationPriority.critical: 'critical',
  NotificationPriority.high: 'high',
  NotificationPriority.normal: 'normal',
  NotificationPriority.low: 'low',
};

_NotificationState _$NotificationStateFromJson(Map<String, dynamic> json) =>
    _NotificationState(
      notifications:
          (json['notifications'] as List<dynamic>?)
              ?.map(
                (e) => NotificationModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      filterCategory:
          $enumDecodeNullable(
            _$NotificationCategoryEnumMap,
            json['filterCategory'],
          ) ??
          null,
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationStateToJson(_NotificationState instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
      'filterCategory': _$NotificationCategoryEnumMap[instance.filterCategory],
      'isLoading': instance.isLoading,
    };
