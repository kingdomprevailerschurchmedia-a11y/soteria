import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/design_system/design_system.dart';
import '../../domain/models/game_mode.dart';
import '../../domain/models/game_rules.dart';
import '../../application/rules_notifier.dart';

class RulesDashboardScreen extends ConsumerWidget {
  const RulesDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rulesAsync = ref.watch(gameRulesNotifierProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Rules Dashboard'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(gameRulesNotifierProvider.notifier).sync(),
          ),
        ],
      ),
      body: SoteriaBackground(
        type: SoteriaBackgroundType.standard,
        child: rulesAsync.when(
          data: (rulesMap) => _RulesDashboardContent(rulesMap: rulesMap),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
        ),
      ),
    );
  }
}

class _RulesDashboardContent extends StatefulWidget {
  final Map<GameMode, GameRules> rulesMap;

  const _RulesDashboardContent({required this.rulesMap});

  @override
  State<_RulesDashboardContent> createState() => _RulesDashboardContentState();
}

class _RulesDashboardContentState extends State<_RulesDashboardContent> {
  GameMode _selectedMode = GameMode.practice;

  @override
  Widget build(BuildContext context) {
    final currentRules = widget.rulesMap[_selectedMode]!;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 120, 16, 24),
      children: [
        _buildModeSelector(),
        const SizedBox(height: 24),
        _GlassCard(
          title: 'Version Information',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InfoRow(label: 'Version', value: currentRules.version),
              _InfoRow(label: 'Priority', value: currentRules.priority.toString()),
              _InfoRow(label: 'Rules ID', value: currentRules.id),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildTimerRules(currentRules),
        const SizedBox(height: 16),
        _buildRewardRules(currentRules),
        const SizedBox(height: 16),
        _buildDifficultyRules(currentRules),
        const SizedBox(height: 16),
        _buildAssistRules(currentRules),
        if (currentRules.tournament != null) ...[
          const SizedBox(height: 16),
          _buildTournamentRules(currentRules),
        ],
      ],
    );
  }

  Widget _buildModeSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: GameMode.values.map((mode) {
          final isSelected = _selectedMode == mode;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(mode.name.toUpperCase()),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) setState(() => _selectedMode = mode);
              },
              selectedColor: SoteriaColors.primary,
              backgroundColor: SoteriaColors.surfaceL2,
              labelStyle: TextStyle(
                color: isSelected ? SoteriaColors.textPrimary : SoteriaColors.textSecondary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTimerRules(GameRules rules) {
    final timer = rules.timer;
    return _GlassCard(
      title: 'Timer Configuration',
      icon: Icons.timer,
      child: Column(
        children: [
          _InfoRow(label: 'Question Timer', value: '${timer.questionTimerSeconds}s'),
          _InfoRow(label: 'Min/Max', value: '${timer.minTimerSeconds}s / ${timer.maxTimerSeconds}s'),
          _InfoRow(label: 'Reconnect Timeout', value: '${timer.reconnectTimeoutSeconds}s'),
          _InfoRow(label: 'Session Timeout', value: '${timer.sessionTimeoutSeconds}s'),
          _InfoRow(label: 'Status', value: timer.isTimerActive ? 'ACTIVE' : 'INACTIVE', valueColor: timer.isTimerActive ? SoteriaColors.success : SoteriaColors.error),
        ],
      ),
    );
  }

  Widget _buildRewardRules(GameRules rules) {
    final rewards = rules.rewards;
    return _GlassCard(
      title: 'Rewards & XP',
      icon: Icons.emoji_events,
      child: Column(
        children: [
          _InfoRow(label: 'Base XP', value: rewards.baseXP.toString()),
          _InfoRow(label: 'Base Coins', value: rewards.baseCoins.toString()),
          _InfoRow(label: 'Reputation', value: rewards.baseReputation.toString()),
          _InfoRow(label: 'Streak Multiplier', value: '${rewards.streakMultiplier}x'),
          _InfoRow(label: 'Seasonal Multiplier', value: '${rewards.seasonalMultiplier}x'),
          _InfoRow(label: 'Double XP', value: rewards.doubleXPActive ? 'YES' : 'NO', valueColor: rewards.doubleXPActive ? SoteriaColors.accentGold : SoteriaColors.textSecondary),
        ],
      ),
    );
  }

  Widget _buildDifficultyRules(GameRules rules) {
    final difficulty = rules.difficulty;
    return _GlassCard(
      title: 'Difficulty Progression',
      icon: Icons.trending_up,
      child: Column(
        children: [
          _InfoRow(label: 'Initial Difficulty', value: difficulty.initialDifficulty),
          _InfoRow(label: 'Adaptive Scaling', value: difficulty.adaptiveProgression ? 'ENABLED' : 'DISABLED'),
          _InfoRow(label: 'Scaling Factor', value: '${difficulty.scalingFactor}x'),
          _InfoRow(label: 'Max Level', value: difficulty.maxDifficultyLevel.toString()),
        ],
      ),
    );
  }

  Widget _buildAssistRules(GameRules rules) {
    final assists = rules.assists;
    return _GlassCard(
      title: 'Knowledge Assists',
      icon: Icons.help_outline,
      child: Column(
        children: [
          _InfoRow(label: 'Allowed', value: assists.allowKnowledgeAssist ? 'YES' : 'NO'),
          _InfoRow(label: 'Max per Session', value: assists.maxAssistsPerSession.toString()),
          _InfoRow(label: 'Cooldown', value: '${assists.cooldownSeconds}s'),
        ],
      ),
    );
  }

  Widget _buildTournamentRules(GameRules rules) {
    final t = rules.tournament!;
    return _GlassCard(
      title: 'Tournament Config',
      icon: Icons.gavel,
      child: Column(
        children: [
          _InfoRow(label: 'Entry Fee', value: '${t.entryFeeCoins} Coins'),
          _InfoRow(label: 'Min Rank', value: t.minRankRequired.toString()),
          _InfoRow(label: 'Leaderboard', value: t.leaderboardEligibility ? 'ELIGIBLE' : 'NOT ELIGIBLE'),
          _InfoRow(label: 'Max Participants', value: t.maxParticipants.toString()),
        ],
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  final String title;
  final Widget child;
  final IconData? icon;

  const _GlassCard({required this.title, required this.child, this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SoteriaRadius.surfaceLarge),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(SoteriaRadius.surfaceLarge),
            border: Border.all(color: SoteriaColors.premiumBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: SoteriaColors.primary, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    title,
                    style: SoteriaTypography.titleLarge.copyWith(color: SoteriaColors.textPrimary),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: SoteriaColors.divider, height: 1),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: SoteriaTypography.bodySmall.copyWith(color: SoteriaColors.textSecondary)),
          Text(
            value,
            style: SoteriaTypography.bodyMedium.copyWith(
              color: valueColor ?? SoteriaColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
