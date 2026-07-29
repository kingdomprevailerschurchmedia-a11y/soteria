import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/navigation/soteria_scaffold.dart';
import '../../../../core/widgets/loading/soteria_loading.dart';
import '../../../../core/widgets/error/soteria_error_state.dart';
import '../../../../core/widgets/indicators/gamification_widgets.dart';
import '../providers/home_provider.dart';
import '../widgets/home_header.dart';
import '../widgets/active_tournaments.dart';
import '../widgets/quick_play_grid.dart';
import '../../domain/entities/user_stats.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../auth/presentation/widgets/guest/guest_badge.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeStateProvider);
    final auth = ref.watch(authStateProvider);

    return SoteriaScaffold(
      appBar: AppBar(
        title: const Text('Soteria'),
        centerTitle: false,
        actions: [
          if (auth.isGuest)
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Center(child: GuestBadge()),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(homeStateProvider.notifier).refresh(),
        child: homeState.when(
          data: (data) => ListView(
            padding: const EdgeInsets.symmetric(vertical: SoteriaSpacing.s24),
            children: [
              HomeHeader(
                welcomeMessage: data.welcomeMessage,
                stats: data.stats,
              ),
              const SizedBox(height: SoteriaSpacing.s32),
              _buildStatsRow(context, data.stats),
              const SizedBox(height: SoteriaSpacing.s40),
              ActiveTournaments(tournaments: data.activeTournaments),
              const SizedBox(height: SoteriaSpacing.s40),
              const QuickPlayGrid(),
              const SizedBox(height: SoteriaSpacing.s64),
            ],
          ),
          loading: () => const SoteriaCircularLoader(),
          error: (e, st) => SoteriaErrorState(
            message: e.toString(),
            onRetry: () => ref.read(homeStateProvider.notifier).refresh(),
          ),
        ),
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context, UserStats stats) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s16),
      child: Row(
        children: [
          Expanded(
            child: XPProgressBar(
              progress: stats.xpProgress,
              level: stats.level,
            ),
          ),
          const SizedBox(width: SoteriaSpacing.s16),
          _StatBadge(
            icon: SoteriaIcons.coin,
            value: stats.coins.toString(),
            color: SoteriaColors.coinGold,
          ),
          const SizedBox(width: SoteriaSpacing.s8),
          _StatBadge(
            icon: SoteriaIcons.streak,
            value: stats.streakDays.toString(),
            color: SoteriaColors.streakOrange,
          ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  const _StatBadge({
    required this.icon,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SoteriaSpacing.s8,
        vertical: SoteriaSpacing.s4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(SoteriaRadius.m),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          ),
        ],
      ),
    );
  }
}
