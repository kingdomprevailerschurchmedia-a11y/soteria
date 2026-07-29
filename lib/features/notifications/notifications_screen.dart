import 'package:flutter/material.dart';
import '../../core/widgets/containers/soteria_placeholder_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SoteriaPlaceholderScreen(
      title: 'Alerts & Activity',
      description: 'Stay updated with tournament starts and friend challenges.',
      icon: Icons.notifications_outlined,
    );
  }
}
