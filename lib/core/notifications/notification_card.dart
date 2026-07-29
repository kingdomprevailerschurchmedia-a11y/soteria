import 'package:flutter/material.dart';
import 'package:soteria/core/design_system/design_system.dart';
import 'notification_state.dart';

/// Reusable card component for notifications.
class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notification, required this.onTap});
  final NotificationModel notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: notification.isRead ? SoteriaColors.surface : SoteriaColors.surfaceContainer,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: SoteriaSpacing.s4, horizontal: SoteriaSpacing.s16),
      child: ListTile(
        onTap: onTap,
        title: Text(notification.title, style: SoteriaTypography.bodyMedium),
        subtitle: Text(notification.subtitle, style: SoteriaTypography.bodySmall),
        trailing: notification.isRead ? null : const Icon(Icons.circle, size: 8, color: SoteriaColors.primary),
      ),
    );
  }
}
