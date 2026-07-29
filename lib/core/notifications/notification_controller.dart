import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'notification_state.dart';

part 'notification_controller.g.dart';

@Riverpod(keepAlive: true)
class NotificationController extends _$NotificationController {
  @override
  NotificationState build() => NotificationState(
    notifications: [
      NotificationModel(
        id: '1',
        title: 'Tournament Starting Soon',
        subtitle: 'The Grand Finals start in 30 minutes.',
        category: NotificationCategory.tournament,
        priority: NotificationPriority.high,
        timestamp: _pastDate(1),
      ),
      NotificationModel(
        id: '2',
        title: 'New Achievement Unlocked',
        subtitle: 'You earned the "Sharpshooter" badge.',
        category: NotificationCategory.achievement,
        priority: NotificationPriority.normal,
        timestamp: _pastDate(2),
      ),
    ],
  );

  static DateTime _pastDate(int hours) => DateTime.now().subtract(Duration(hours: hours));

  void markAsRead(String id) {
    state = state.copyWith(
      notifications: state.notifications.map((n) {
        return n.id == id ? n.copyWith(isRead: true) : n;
      }).toList(),
    );
  }
}
