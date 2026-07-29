import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.freezed.dart';
part 'notification_state.g.dart';

enum NotificationCategory { system, tournament, practice, competition, friend, achievement, wallet }
enum NotificationPriority { critical, high, normal, low }

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String title,
    required String subtitle,
    required NotificationCategory category,
    required NotificationPriority priority,
    required DateTime timestamp,
    @Default(false) bool isRead,
    @Default(false) bool isPinned,
  }) = _NotificationModel;
  
  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default([]) List<NotificationModel> notifications,
    @Default(null) NotificationCategory? filterCategory,
    @Default(false) bool isLoading,
  }) = _NotificationState;
  
  factory NotificationState.fromJson(Map<String, dynamic> json) => _$NotificationStateFromJson(json);
}
