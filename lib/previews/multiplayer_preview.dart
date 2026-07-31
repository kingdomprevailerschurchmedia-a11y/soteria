import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/multiplayer/presentation/widgets/searching_for_opponent.dart';
import '../features/multiplayer/presentation/widgets/match_ready_dialog.dart';
import '../features/multiplayer/presentation/widgets/multiplayer_widgets.dart';
import '../features/multiplayer/presentation/widgets/ready_check_dialog.dart';
import '../features/multiplayer/presentation/widgets/match_countdown_overlay.dart';
import '../features/multiplayer/presentation/widgets/round_transition_view.dart';
import '../features/multiplayer/presentation/widgets/sync_widgets.dart';
import '../features/multiplayer/domain/models/player.dart';
import '../features/multiplayer/domain/models/session_models.dart';
import '../features/multiplayer/domain/models/connection_models.dart';
import '../features/multiplayer/domain/models/player_status.dart';
import '../features/multiplayer/domain/models/match_types.dart';
import '../features/multiplayer/domain/models/sync_models.dart';
import '../features/multiplayer/application/sync_providers.dart';
import '../core/widgets/buttons/soteria_button.dart';
import '../core/design_system/design_system.dart';

class MultiplayerPreviewGallery extends StatelessWidget {
  const MultiplayerPreviewGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SoteriaColors.background,
      appBar: AppBar(title: const Text('Multiplayer Components')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Connection Status', style: SoteriaTypography.titleMedium),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ConnectionStatusIndicator(state: ConnectionState.connected),
              ConnectionStatusIndicator(state: ConnectionState.connecting),
              ConnectionStatusIndicator(state: ConnectionState.failed),
            ],
          ),
          const SizedBox(height: 32),
          const Text('Opponent Card', style: SoteriaTypography.titleMedium),
          const SizedBox(height: 16),
          const OpponentCard(
            player: Player(
              id: '1',
              displayName: 'CyberKnight',
              rank: 42,
              skillRating: 2450,
              status: PlayerStatus.inMatch,
            ),
            latency: 45,
          ),
          const SizedBox(height: 16),
          const OpponentCard(
            player: Player(
              id: '2',
              displayName: 'NeonShadow',
              rank: 12,
              skillRating: 1100,
              status: PlayerStatus.online,
            ),
            latency: 180,
          ),
          const SizedBox(height: 32),
          SoteriaButton(
            label: 'PREVIEW MATCH READY',
            onPressed: () => _showMatchReady(context),
            type: SoteriaButtonType.primary,
          ),
          const SizedBox(height: 16),
          SoteriaButton(
            label: 'PREVIEW SEARCHING',
            onPressed: () => _showSearching(context),
            type: SoteriaButtonType.secondary,
          ),
          const SizedBox(height: 32),
          const Text('Session Lifecycle', style: SoteriaTypography.titleMedium),
          const SizedBox(height: 16),
          SoteriaButton(
            label: 'READY CHECK DIALOG',
            onPressed: () => _showReadyCheck(context),
          ),
          const SizedBox(height: 12),
          SoteriaButton(
            label: 'MATCH COUNTDOWN',
            onPressed: () => _showCountdown(context),
          ),
          const SizedBox(height: 12),
          SoteriaButton(
            label: 'ROUND TRANSITION',
            onPressed: () => _showRoundTransition(context),
          ),
          const SizedBox(height: 32),
          const Text('Synchronization & Latency', style: SoteriaTypography.titleMedium),
          const SizedBox(height: 16),
          const ProviderScope(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ConnectionQualityIndicator(),
                SyncStatusBanner(isRecovering: true, progress: 0.65),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const ProviderScope(
            child: LatencyDetailedOverlay(),
          ),
        ],
      ),
    );
  }

  void _showReadyCheck(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ReadyCheckDialog(
        session: GameSession(
          sessionId: '1',
          matchId: 'm1',
          type: MatchType.oneVsOne,
          status: SessionStatus.readyCheck,
          createdAt: DateTime.now(),
          players: const [
            PlayerState(playerId: '1', displayName: 'You', isReady: true),
            PlayerState(playerId: '2', displayName: 'CyberKnight', isReady: false),
          ],
        ),
      ),
    );
  }

  void _showCountdown(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => MatchCountdownOverlay(
        count: 3,
        onFinished: () => Navigator.pop(context),
      ),
    );
  }

  void _showRoundTransition(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RoundTransitionView(
          roundCompleted: 1,
          players: [
            PlayerState(playerId: '1', displayName: 'You', score: 850),
            PlayerState(playerId: '2', displayName: 'CyberKnight', score: 720),
          ],
        ),
      ),
    );
  }

  void _showMatchReady(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => MatchReadyDialog(
        players: const [
          MatchPlayer(
            player: Player(id: '1', displayName: 'You', rank: 25),
          ),
          MatchPlayer(
            player: Player(id: '2', displayName: 'Opponent', rank: 28),
          ),
        ],
        onAccept: () => Navigator.pop(context),
        onDecline: () => Navigator.pop(context),
      ),
    );
  }

  void _showSearching(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ProviderScope(
        // We would need to mock the QueueNotifier state here for a perfect preview
        child: SearchingForOpponent(),
      ),
    );
  }
}
