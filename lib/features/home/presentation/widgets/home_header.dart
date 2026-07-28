import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/avatars/soteria_avatar.dart';
import '../../domain/entities/user_stats.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.welcomeMessage,
    required this.stats,
  });

  final String welcomeMessage;
  final UserStats stats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  welcomeMessage,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: SoteriaSpacing.s4),
                Text(
                  stats.rank,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ],
            ),
          ),
          SoteriaAvatar(
            initials: 'JD',
            size: 56,
            showStatus: true,
            isOnline: true,
          ),
        ],
      ),
    );
  }
}
