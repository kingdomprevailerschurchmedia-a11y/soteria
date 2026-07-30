import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../../../../core/widgets/loading/soteria_loading.dart';
import '../../application/game_session_controller.dart';
import '../../application/countdown_controller.dart';
import '../../domain/entities/game_session_status.dart';
import 'question_engine_screen.dart';
import '../widgets/countdown_overlay.dart';
import '../widgets/resume_prompt.dart';
import '../widgets/exit_confirmation_dialog.dart';

class MatchFlowScreen extends ConsumerStatefulWidget {
  const MatchFlowScreen({super.key, required this.mode});
  final String mode;

  @override
  ConsumerState<MatchFlowScreen> createState() => _MatchFlowScreenState();
}

class _MatchFlowScreenState extends ConsumerState<MatchFlowScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameSessionControllerProvider.notifier).recoverSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(gameSessionControllerProvider.select((s) => s?.status));
    final currentScore = ref.watch(gameSessionControllerProvider.select((s) => s?.currentScore));
    final countdown = ref.watch(countdownControllerProvider);
    final notifier = ref.read(gameSessionControllerProvider.notifier);

    if (status == null) {
      return Scaffold(
        body: Center(
          child: SoteriaButton(
            label: 'START ${widget.mode.toUpperCase()}',
            onPressed: () => notifier.startMatch(mode: widget.mode),
          ),
        ),
      );
    }

    return PopScope(
      canPop: status == GameSessionStatus.completed,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _showExitConfirmation(context, notifier);
      },
      child: Stack(
        children: [
          // Main Gameplay Layer
          const QuestionEngineScreen(),

          // Session Status Overlay
          if (status == GameSessionStatus.paused)
            _buildPausedOverlay(context, notifier),

          if (status == GameSessionStatus.interrupted)
            _buildRecoveryOverlay(context, notifier),

          if (status == GameSessionStatus.initializing || status == GameSessionStatus.loadingQuestions)
            const ColoredBox(
              color: Colors.black54,
              child: Center(child: SoteriaCircularLoader()),
            ),

          // Countdown Layer
          if (status == GameSessionStatus.countdown)
            CountdownOverlay(count: countdown),
            
          if (status == GameSessionStatus.completed)
            _buildCompletedOverlay(context, currentScore ?? 0, notifier),
        ],
      ),
    );
  }

  Widget _buildPausedOverlay(BuildContext context, GameSessionController notifier) {
    return Container(
      color: Colors.black87,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SESSION PAUSED',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: SoteriaColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: SoteriaSpacing.s32),
          SoteriaButton(
            label: 'RESUME',
            onPressed: notifier.resumeMatch,
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          SoteriaButton(
            label: 'ABANDON',
            type: SoteriaButtonType.outlined,
            onPressed: () => _showExitConfirmation(context, notifier),
          ),
        ],
      ),
    );
  }

  Widget _buildRecoveryOverlay(BuildContext context, GameSessionController notifier) {
    // Note: We need the full session for the ResumePrompt to know the mode
    final session = ref.read(gameSessionControllerProvider);
    if (session == null) return const SizedBox.shrink();

    return Container(
      color: Colors.black87,
      width: double.infinity,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(SoteriaSpacing.s32),
          child: ResumePrompt(
            session: session,
            onResume: notifier.resumeMatch,
            onDiscard: notifier.abandonMatch,
          ),
        ),
      ),
    );
  }

  Widget _buildCompletedOverlay(BuildContext context, int currentScore, GameSessionController notifier) {
    return Container(
      color: SoteriaColors.background,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.stars, size: 80, color: SoteriaColors.accentGold),
            const SizedBox(height: SoteriaSpacing.s24),
            Text(
              'MATCH COMPLETED',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: SoteriaSpacing.s16),
            Text('Final Score: $currentScore', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: SoteriaSpacing.s48),
            SoteriaButton(
              label: 'EXIT TO DASHBOARD',
              onPressed: () {
                notifier.reset();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showExitConfirmation(BuildContext context, GameSessionController notifier) {
    showDialog<void>(
      context: context,
      builder: (context) => ExitConfirmationDialog(
        onConfirm: () {
          notifier.abandonMatch();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
