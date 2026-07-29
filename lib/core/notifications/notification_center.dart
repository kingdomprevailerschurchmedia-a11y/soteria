import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soteria/core/design_system/design_system.dart';
import 'notification_controller.dart';
import 'notification_card.dart';

/// Notification Center UI.
class NotificationCenter extends ConsumerWidget {
  const NotificationCenter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView.builder(
        itemCount: state.notifications.length,
        itemBuilder: (context, index) {
          final n = state.notifications[index];
          return NotificationCard(
            notification: n,
            onTap: () => ref.read(notificationControllerProvider.notifier).markAsRead(n.id),
          );
        },
      ),
    );
  }
}
