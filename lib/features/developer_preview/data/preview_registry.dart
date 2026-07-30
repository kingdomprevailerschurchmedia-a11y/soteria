import 'package:flutter/material.dart';
import '../../../core/design_system/design_system.dart';
import '../../../core/design_system/previews/design_system_previews.dart';
import '../../../core/design_system/previews/preview_showcases.dart';
import '../../../core/navigation/navigation_destination.dart';
import '../../../core/navigation/bottom_navigation.dart';
import '../../../core/navigation/navigation_rail.dart';
import '../../../core/widgets/splash_screen.dart';
import '../../../core/widgets/buttons/soteria_button.dart';
import '../../../core/widgets/cards/soteria_stat_card.dart';
import '../../../core/widgets/cards/soteria_reward_card.dart';
import '../../../core/widgets/inputs/soteria_text_field.dart';
import '../../../core/widgets/inputs/soteria_otp_field.dart';
import '../../../core/widgets/inputs/soteria_search_field.dart';
import '../../../core/widgets/avatars/soteria_avatar.dart';
import '../../../core/widgets/dialogs/soteria_dialogs.dart';
import '../../../core/widgets/loading/soteria_loading.dart';
import '../../../core/widgets/empty/soteria_empty_state.dart';
import '../../../core/widgets/error/soteria_error_view.dart';
import '../../../core/widgets/indicators/gamification_widgets.dart';
import '../../auth/presentation/widgets/session/expired_session_dialog.dart';
import '../../onboarding/presentation/screens/onboarding_screen.dart';
import '../../onboarding/presentation/widgets/onboarding_illustration.dart';
import '../../auth/presentation/widgets/guest/guest_banner.dart';
import '../../auth/presentation/widgets/guest/upgrade_dialog.dart';
import '../../auth/presentation/widgets/guest/restricted_feature_card.dart';
import '../../auth/presentation/widgets/guest/guest_badge.dart';
import '../../personalization/presentation/screens/personalization_screen.dart';
import '../../auth/domain/entities/auth_user.dart';
import '../../auth/domain/entities/auth_token.dart';
import '../../auth/domain/entities/session.dart';
import '../../auth/domain/entities/session_status.dart';
import '../../auth/domain/entities/auth_provider_type.dart';
import '../../auth/presentation/screens/login_screen.dart';
import '../../auth/presentation/screens/register_screen.dart';
import '../../auth/presentation/screens/forgot_password_screen.dart';
import '../../auth/presentation/screens/verify_code_screen.dart';
import '../../auth/presentation/screens/reset_password_screen.dart';
import '../../auth/presentation/screens/recovery_success_screen.dart';
import '../../auth/presentation/screens/social_login_screen.dart';
import '../../auth/presentation/widgets/session/session_status_card.dart';
import '../../auth/presentation/widgets/social_auth_buttons.dart';
import '../../developer_dashboard/presentation/screens/developer_dashboard_screen.dart';
import '../../developer_dashboard/presentation/screens/log_viewer_screen.dart';
import '../../developer_dashboard/presentation/screens/feature_flags_screen.dart';
import '../../developer_dashboard/presentation/screens/analytics_screen.dart';
import '../../developer_dashboard/presentation/screens/performance_screen.dart';
import '../../developer_dashboard/presentation/screens/accessibility_screen.dart';
import '../../developer_dashboard/presentation/screens/validation_screen.dart';
import '../../gameplay/presentation/screens/question_engine_screen.dart';
import '../../gameplay/presentation/screens/match_flow_screen.dart';
import '../../gameplay/presentation/widgets/assist_button.dart';
import '../../gameplay/presentation/widgets/assist_bar.dart';
import '../../gameplay/presentation/widgets/countdown_overlay.dart';
import '../../gameplay/presentation/widgets/soteria_timer.dart';
import '../../gameplay/presentation/widgets/difficulty_badge.dart';
import '../../gameplay/presentation/widgets/category_indicator.dart';
import '../../gameplay/presentation/widgets/feedback_overlay.dart';
import '../../gameplay/presentation/widgets/reward_feedback.dart';
import '../../gameplay/presentation/widgets/option_tile.dart';
import '../../gameplay/domain/entities/question_option.dart';
import '../../gameplay/domain/entities/question_difficulty.dart';
import '../../gameplay/domain/entities/assist_usage.dart';
import '../../gameplay/domain/entities/assist_type.dart';
import '../../gameplay/domain/entities/assist_status.dart';
import '../../gameplay/domain/entities/timer_state.dart';
import '../../gameplay/domain/entities/timer_status.dart';
import '../../gameplay/domain/entities/timer_profile.dart';
import '../../progression/presentation/widgets/level_badge.dart';
import '../../progression/presentation/widgets/xp_progress_bar.dart';
import '../../progression/presentation/widgets/score_card.dart';
import '../../gameplay/presentation/widgets/fair_play_indicator.dart';
import '../domain/entities/preview_item.dart';

/// Centralized registry for all Developer Preview items.
class PreviewRegistry {
  /// Internal store for dynamically registered items.
  static final List<PreviewItem> _dynamicItems = [];

  /// Helper to register a component preview from anywhere in the app (Debug only).
  static void register(PreviewItem item) => _dynamicItems.add(item);

  /// Returns the complete list of preview categories and their items.
  static List<PreviewCategory> get categories => [
        _designSystemCategory,
        _gameplayCategory,
        _progressionCategory,
        _visualShowcaseCategory,
        _componentStatesCategory,
        if (_dynamicItems.isNotEmpty)
          PreviewCategory(
            id: 'dynamic',
            name: 'Recently Registered',
            icon: Icons.add_circle_outline,
            items: _dynamicItems,
          ),
        _actionCategory,
        _cardCategory,
        _inputCategory,
        _displayCategory,
        _feedbackCategory,
        _stateCategory,
        _onboardingCategory,
        _personalizationCategory,
        _authRegistrationCategory,
        _guestModeCategory,
        _sessionManagementCategory,
        _navigationCategory,
        _infrastructureCategory,
        _goldenTestCategory,
      ];

  static final _goldenTestCategory = PreviewCategory(
    id: 'golden_tests',
    name: 'Golden Test Viewer',
    icon: Icons.image_search_rounded,
    items: [
      PreviewItem(
        id: 'golden_home',
        name: 'Home Screen (Golden)',
        builder: (_) => const Center(child: Icon(Icons.image, size: 100, color: Colors.grey)),
        description: 'Mock of a generated golden test image',
      ),
    ],
  );

  static final _designSystemCategory = PreviewCategory(
    id: 'design_tokens',
    name: 'Design Tokens',
    icon: Icons.token_outlined,
    items: [
      PreviewItem(id: 'colors', name: 'Color Palette', builder: (_) => const ColorPreview()),
      PreviewItem(id: 'typography', name: 'Typography', builder: (_) => const TypographyPreview()),
      PreviewItem(id: 'spacing', name: 'Spacing System', builder: (_) => const SpacingPreview()),
      PreviewItem(id: 'elevation', name: 'Elevation & Shadows', builder: (_) => const ElevationPreview()),
      PreviewItem(id: 'durations', name: 'Animation Durations', builder: (_) => const DurationPreview()),
      PreviewItem(id: 'icons', name: 'Icon Library', builder: (_) => const IconPreview()),
    ],
  );

  static final _gameplayCategory = PreviewCategory(
    id: 'gameplay_engine',
    name: 'Gameplay Engine',
    icon: Icons.sports_esports_outlined,
    items: [
      PreviewItem(
        id: 'match_flow',
        name: 'Match Flow Engine',
        builder: (_) => const MatchFlowScreen(mode: 'practice'),
        description: 'Orchestrates the entire match lifecycle.',
      ),
      PreviewItem(
        id: 'question_engine',
        name: 'Question Engine (Architecture)',
        builder: (_) => const QuestionEngineScreen(),
        description: 'The core reusable engine for all gameplay modes.',
      ),
      PreviewItem(
        id: 'countdown_overlay',
        name: 'Countdown Overlay',
        builder: (_) => const CountdownOverlay(count: 3),
      ),
      PreviewItem(
        id: 'timer_widgets',
        name: 'Timer Visualizations',
        builder: (_) {
          const profile = TimerProfile(id: 'test', name: 'Test', maxDurationSeconds: 30);
          final running = TimerState(sessionId: '1', profile: profile, status: TimerStatus.running, remainingSeconds: 20);
          final critical = TimerState(sessionId: '1', profile: profile, status: TimerStatus.critical, remainingSeconds: 3);
          final frozen = TimerState(sessionId: '1', profile: profile, status: TimerStatus.frozen, remainingSeconds: 15, isFrozen: true);
          
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Circular Timer (Running)'),
                const SizedBox(height: 16),
                CircularTimer(timerState: running),
                const SizedBox(height: 32),
                const Text('Circular Timer (Critical + Pulse)'),
                const SizedBox(height: 16),
                CircularTimer(timerState: critical),
                const SizedBox(height: 32),
                const Text('Linear Timer (Frozen)'),
                const SizedBox(height: 16),
                LinearTimer(timerState: frozen),
              ],
            ),
          );
        },
      ),
      PreviewItem(
        id: 'assist_buttons',
        name: 'Knowledge Assist Buttons',
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Available State'),
              const SizedBox(height: 8),
              AssistButton(
                usage: const AssistUsage(id: '1', type: AssistType.eliminateTwo),
                onTap: () {},
              ),
              const SizedBox(height: 16),
              const Text('Used State'),
              const SizedBox(height: 8),
              AssistButton(
                usage: const AssistUsage(
                  id: '2', 
                  type: AssistType.timeFreeze, 
                  status: AssistStatus.used
                ),
                onTap: () {},
              ),
              const SizedBox(height: 16),
              const Text('Loading State'),
              const SizedBox(height: 8),
              AssistButton(
                usage: const AssistUsage(id: '3', type: AssistType.communityInsight),
                onTap: () {},
                isLoading: true,
              ),
            ],
          ),
        ),
      ),
      PreviewItem(
        id: 'assist_bar',
        name: 'Knowledge Assist Bar',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(16.0),
          child: AssistBar(),
        ),
      ),
      PreviewItem(
        id: 'difficulty_badges',
        name: 'Difficulty Badges',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              DifficultyBadge(difficulty: QuestionDifficulty.beginner),
              SizedBox(height: 8),
              DifficultyBadge(difficulty: QuestionDifficulty.intermediate),
              SizedBox(height: 8),
              DifficultyBadge(difficulty: QuestionDifficulty.advanced),
              SizedBox(height: 8),
              DifficultyBadge(difficulty: QuestionDifficulty.elite),
            ],
          ),
        ),
      ),
      PreviewItem(
        id: 'category_indicator',
        name: 'Category Indicator',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(16.0),
          child: CategoryIndicator(categories: ['Blockchain', 'Security', 'Web3']),
        ),
      ),
      PreviewItem(
        id: 'gameplay_status_matrix',
        name: 'Gameplay System Status',
        builder: (_) => ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Text('Validated Systems:'),
            Divider(),
            ListTile(title: Text('Question Engine'), trailing: Icon(Icons.check_circle, color: Colors.green)),
            ListTile(title: Text('Session Manager'), trailing: Icon(Icons.check_circle, color: Colors.green)),
            ListTile(title: Text('Advanced Timer'), trailing: Icon(Icons.check_circle, color: Colors.green)),
            ListTile(title: Text('Adaptive Logic'), trailing: Icon(Icons.check_circle, color: Colors.green)),
            ListTile(title: Text('Fair Play Engine'), trailing: Icon(Icons.check_circle, color: Colors.green)),
            ListTile(title: Text('Recovery System'), trailing: Icon(Icons.check_circle, color: Colors.green)),
          ],
        ),
      ),
      PreviewItem(
        id: 'fair_play_indicators',
        name: 'Fair Play Indicators',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              FairPlayIndicator(integrityScore: 1.0),
              SizedBox(height: 8),
              FairPlayIndicator(integrityScore: 0.7),
              SizedBox(height: 8),
              FairPlayIndicator(integrityScore: 0.3),
              SizedBox(height: 8),
              FairPlayIndicator(integrityScore: 1.0, isVetting: true),
            ],
          ),
        ),
      ),
      PreviewItem(
        id: 'feedback_overlays',
        name: 'Feedback Overlays',
        builder: (_) => Stack(
          children: [
            const QuestionEngineScreen(),
            FeedbackOverlay(type: FeedbackType.correct, onFinished: () {}),
          ],
        ),
      ),
      PreviewItem(
        id: 'option_states',
        name: 'Option Tile States',
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              OptionTile(
                option: const QuestionOption(id: '1', text: 'Idle Option'),
                state: OptionState.idle,
                onTap: () {},
              ),
              OptionTile(
                option: const QuestionOption(id: '2', text: 'Selected Option'),
                state: OptionState.selected,
                onTap: () {},
              ),
              OptionTile(
                option: const QuestionOption(id: '3', text: 'Correct Option'),
                state: OptionState.correct,
                onTap: () {},
              ),
              OptionTile(
                option: const QuestionOption(id: '4', text: 'Incorrect Option'),
                state: OptionState.incorrect,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      PreviewItem(
        id: 'reward_feedback',
        name: 'Reward Feedback',
        builder: (_) => const Center(
          child: RewardFeedback(amount: 100, label: 'XP'),
        ),
      ),
    ],
  );

  static final _progressionCategory = PreviewCategory(
    id: 'progression',
    name: 'Progression & Rewards',
    icon: Icons.trending_up_rounded,
    items: [
      PreviewItem(
        id: 'xp_bar',
        name: 'XP Progress Bar',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(24.0),
          child: XPProgressBar(currentXP: 750, nextLevelXP: 1000),
        ),
      ),
      PreviewItem(
        id: 'level_badges',
        name: 'Level Badges',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LevelBadge(level: 1),
              LevelBadge(level: 12),
              LevelBadge(level: 99),
            ],
          ),
        ),
      ),
      PreviewItem(
        id: 'score_card',
        name: 'Score Card',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(24.0),
          child: ScoreCard(
            label: 'Match Score',
            value: 1250,
            icon: Icons.emoji_events_rounded,
          ),
        ),
      ),
    ],
  );

  static final _visualShowcaseCategory = PreviewCategory(
    id: 'visual_showcase',
    name: 'Visual Showcase',
    icon: Icons.vignette_outlined,
    items: [
      PreviewItem(
        id: 'backgrounds',
        name: 'Background Presets',
        builder: (_) => const BackgroundShowcase(),
      ),
      PreviewItem(
        id: 'ambient_lighting',
        name: 'Ambient Glow Studio',
        builder: (_) => const AmbientLightingShowcase(),
      ),
    ],
  );

  static final _componentStatesCategory = PreviewCategory(
    id: 'component_states',
    name: 'Component States',
    icon: Icons.dynamic_feed_outlined,
    items: [
      PreviewItem(
        id: 'button_states',
        name: 'Button States Matrix',
        builder: (_) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildStateRow('Default', SoteriaButton(label: 'PRIMARY', onPressed: () {})),
            _buildStateRow('Disabled', const SoteriaButton(label: 'DISABLED', onPressed: null)),
            _buildStateRow('Loading', SoteriaButton(label: 'LOADING', isLoading: true, onPressed: () {})),
            _buildStateRow('Outline', SoteriaButton(label: 'OUTLINED', type: SoteriaButtonType.outlined, onPressed: () {})),
            _buildStateRow('Success', SoteriaButton(label: 'SUCCESS', type: SoteriaButtonType.success, onPressed: () {})),
          ],
        ),
      ),
    ],
  );

  static Widget _buildStateRow(String label, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  static final _actionCategory = PreviewCategory(
    id: 'actions',
    name: 'Buttons & Actions',
    icon: Icons.touch_app_outlined,
    items: [
      PreviewItem(
        id: 'primary_button',
        name: 'Primary Button',
        builder: (_) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SoteriaButton(label: 'PRIMARY ACTION', onPressed: () {}),
          ),
        ),
      ),
      PreviewItem(
        id: 'secondary_button',
        name: 'Secondary Button',
        builder: (_) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SoteriaButton(
              label: 'SECONDARY ACTION',
              type: SoteriaButtonType.secondary,
              onPressed: () {},
            ),
          ),
        ),
      ),
      PreviewItem(
        id: 'outlined_button',
        name: 'Outlined Button',
        builder: (_) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SoteriaButton(
              label: 'OUTLINED ACTION',
              type: SoteriaButtonType.outlined,
              onPressed: () {},
            ),
          ),
        ),
      ),
      PreviewItem(
        id: 'reward_button',
        name: 'Reward Button (Gold)',
        builder: (_) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SoteriaButton(
              label: 'COLLECT REWARD',
              type: SoteriaButtonType.reward,
              icon: SoteriaIcons.reward,
              onPressed: () {},
            ),
          ),
        ),
      ),
    ],
  );

  static final _cardCategory = PreviewCategory(
    id: 'cards',
    name: 'Cards & Containers',
    icon: Icons.layers_outlined,
    items: [
      PreviewItem(
        id: 'stat_card',
        name: 'Stat Card',
        builder: (_) => const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SoteriaStatCard(
              label: 'Current XP',
              value: '12,450',
              icon: SoteriaIcons.streak,
              trend: '+15%',
            ),
          ),
        ),
      ),
      PreviewItem(
        id: 'reward_card',
        name: 'Reward Card',
        builder: (_) => const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SoteriaRewardCard(
              title: 'Elite Scholar',
              reward: '500 COINS',
              icon: SoteriaIcons.badge,
            ),
          ),
        ),
      ),
    ],
  );

  static final _inputCategory = PreviewCategory(
    id: 'inputs',
    name: 'Inputs & Forms',
    icon: Icons.edit_note_outlined,
    items: [
      PreviewItem(
        id: 'text_field',
        name: 'Standard Text Field',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(16.0),
          child: SoteriaTextField(
            label: 'Username',
            hintText: 'Enter your scholar name',
            prefixIcon: Icon(Icons.person_outline),
          ),
        ),
      ),
      PreviewItem(
        id: 'otp_field',
        name: 'OTP Input Field',
        builder: (_) => const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SoteriaOtpField(length: 6),
          ),
        ),
      ),
      PreviewItem(
        id: 'search_field',
        name: 'Search Field',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(16.0),
          child: SoteriaSearchField(hintText: 'Search subjects...'),
        ),
      ),
    ],
  );

  static final _displayCategory = PreviewCategory(
    id: 'display',
    name: 'Data Display',
    icon: Icons.visibility_outlined,
    items: [
      PreviewItem(
        id: 'avatar',
        name: 'Soteria Avatar',
        builder: (_) => const Center(
          child: SoteriaAvatar(
            size: 80,
            isOnline: true,
          ),
        ),
      ),
      PreviewItem(
        id: 'xp_progress',
        name: 'XP Progress Bar',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(16.0),
          child: SoteriaXPProgressBar(progress: 0.65, level: 12),
        ),
      ),
    ],
  );

  static final _feedbackCategory = PreviewCategory(
    id: 'feedback',
    name: 'Feedback & Overlays',
    icon: Icons.feedback_outlined,
    items: [
      PreviewItem(
        id: 'success_dialog',
        name: 'Success Dialog',
        builder: (context) => Center(
          child: SoteriaButton(
            label: 'SHOW SUCCESS',
            type: SoteriaButtonType.success,
            onPressed: () => showDialog<void>(
              context: context,
              builder: (_) => const SoteriaDialog(
                title: 'Achievement Unlocked!',
                message: 'You have completed the first module.',
                icon: Icons.verified_rounded,
                iconColor: SoteriaColors.success,
              ),
            ),
          ),
        ),
      ),
    ],
  );

  static final _stateCategory = PreviewCategory(
    id: 'states',
    name: 'App States',
    icon: Icons.cloud_off_outlined,
    items: [
      PreviewItem(
        id: 'loading',
        name: 'Loading State',
        builder: (_) => const Center(child: SoteriaCircularLoader()),
      ),
      PreviewItem(
        id: 'empty',
        name: 'Empty State',
        builder: (_) => const SoteriaEmptyState(
          title: 'No Tournaments Yet',
          message: 'Check back later for new events.',
          icon: SoteriaIcons.trophy,
        ),
      ),
      PreviewItem(
        id: 'error',
        name: 'Error View',
        builder: (_) => const SoteriaErrorView(
          message: 'Could not connect to the Arena.',
        ),
      ),
    ],
  );

  static final _onboardingCategory = PreviewCategory(
    id: 'onboarding',
    name: 'Onboarding',
    icon: Icons.explore_outlined,
    items: [
      PreviewItem(
        id: 'splash',
        name: 'Splash Screen',
        builder: (_) => const SplashScreen(),
      ),
      PreviewItem(
        id: 'onboarding_flow',
        name: 'Onboarding Screen',
        builder: (_) => const OnboardingScreen(),
      ),
      PreviewItem(
        id: 'illustration',
        name: 'Illustration Component',
        builder: (_) => const Center(
          child: OnboardingIllustration(
            type: OnboardingIllustrationType.hero,
          ),
        ),
      ),
    ],
  );

  static final _personalizationCategory = PreviewCategory(
    id: 'personalization',
    name: 'Personalization',
    icon: Icons.psychology_outlined,
    items: [
      PreviewItem(
        id: 'personalization_flow',
        name: 'Personalization Screen',
        builder: (_) => const PersonalizationScreen(),
      ),
    ],
  );

  static final _authRegistrationCategory = PreviewCategory(
    id: 'auth_registration',
    name: 'Authentication',
    icon: Icons.lock_outline_rounded,
    items: [
      PreviewItem(
        id: 'social_login',
        name: 'Social Login Screen',
        builder: (_) => const SocialLoginScreen(),
      ),
      PreviewItem(
        id: 'login',
        name: 'Email Login Screen',
        builder: (_) => const LoginScreen(),
      ),
      PreviewItem(
        id: 'register',
        name: 'Registration Flow',
        builder: (_) => const RegisterScreen(),
      ),
      PreviewItem(
        id: 'forgot_password',
        name: 'Forgot Password (Email)',
        builder: (_) => const ForgotPasswordScreen(),
        tags: const ['auth', 'recovery'],
      ),
      PreviewItem(
        id: 'verify_recovery',
        name: 'Verification Code (OTP)',
        builder: (_) => const VerifyCodeScreen(),
        tags: const ['auth', 'otp'],
      ),
      PreviewItem(
        id: 'reset_password',
        name: 'Create New Password',
        builder: (_) => const ResetPasswordScreen(),
        tags: const ['auth', 'reset'],
      ),
      PreviewItem(
        id: 'recovery_success',
        name: 'Recovery Success',
        builder: (_) => const RecoverySuccessScreen(),
        tags: const ['auth', 'success'],
      ),
      PreviewItem(
        id: 'social_buttons',
        name: 'Social Buttons',
        builder: (_) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SoteriaSocialButton(provider: AuthProviderType.google, onPressed: () {}),
                const SizedBox(height: 16),
                SoteriaSocialButton(provider: AuthProviderType.apple, onPressed: () {}),
                const SizedBox(height: 16),
                SoteriaSocialButton(provider: AuthProviderType.phone, onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    ],
  );

  static final _guestModeCategory = PreviewCategory(
    id: 'guest_mode',
    name: 'Guest Mode',
    icon: Icons.person_outline_rounded,
    items: [
      PreviewItem(
        id: 'guest_banner',
        name: 'Guest Reminder Banner',
        builder: (_) => GuestBanner(onUpgrade: () {}),
      ),
      PreviewItem(
        id: 'upgrade_dialog',
        name: 'Upgrade Dialog',
        builder: (context) => Center(
          child: SoteriaButton(
            label: 'SHOW UPGRADE DIALOG',
            onPressed: () => showUpgradeDialog(context, 'Tournament Arena'),
          ),
        ),
      ),
      PreviewItem(
        id: 'restricted_card',
        name: 'Restricted Feature Card',
        builder: (_) => const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: RestrictedFeatureCard(
              title: 'Pro Mode',
              description: 'Professional exams are for registered scholars.',
              icon: Icons.star_rounded,
            ),
          ),
        ),
      ),
      PreviewItem(
        id: 'guest_badge',
        name: 'Guest Badge',
        builder: (_) => const Center(child: GuestBadge()),
      ),
    ],
  );

  static final _sessionManagementCategory = PreviewCategory(
    id: 'session_management',
    name: 'Session Management',
    icon: Icons.timer_outlined,
    items: [
      PreviewItem(
        id: 'session_card_auth',
        name: 'Session Card: Authenticated',
        builder: (_) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SessionStatusCard(
              session: Session(
                status: SessionStatus.authenticated,
                user: const AuthUser(id: '1', email: 'user@soteria.app', username: 'ScholarOne'),
                token: AuthToken(accessToken: 'abc', expiresAt: DateTime.now().add(const Duration(hours: 1))),
                lastActivityAt: DateTime.now(),
              ),
            ),
          ),
        ),
      ),
      PreviewItem(
        id: 'session_card_expired',
        name: 'Session Card: Expired',
        builder: (_) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SessionStatusCard(
              session: Session(
                status: SessionStatus.expired,
                user: const AuthUser(id: '1', email: 'user@soteria.app', username: 'ScholarOne'),
                token: AuthToken(accessToken: 'abc', expiresAt: DateTime.now().subtract(const Duration(hours: 1))),
                lastActivityAt: DateTime.now().subtract(const Duration(minutes: 45)),
              ),
            ),
          ),
        ),
      ),
      PreviewItem(
        id: 'expired_dialog',
        name: 'Expired Session Dialog',
        builder: (context) => Center(
          child: SoteriaButton(
            label: 'SHOW EXPIRED DIALOG',
            onPressed: () => showExpiredSessionDialog(context),
          ),
        ),
      ),
    ],
  );

  static final _navigationCategory = PreviewCategory(
    id: 'navigation',
    name: 'Navigation System',
    icon: Icons.navigation_rounded,
    items: [
      PreviewItem(
        id: 'bottom_nav',
        name: 'Premium Bottom Navigation',
        builder: (_) => Scaffold(
          bottomNavigationBar: SoteriaBottomNavigation(
            currentIndex: 0,
            onDestinationSelected: (_) {},
            destinations: appDestinations,
          ),
          body: const Center(child: Text('Navigation Preview')),
        ),
      ),
      PreviewItem(
        id: 'nav_rail',
        name: 'Navigation Rail (Tablet)',
        builder: (_) => Scaffold(
          body: Row(
            children: [
              SoteriaNavigationRail(
                currentIndex: 0,
                onDestinationSelected: (_) {},
                destinations: appDestinations,
              ),
              const VerticalDivider(width: 1),
              const Expanded(child: Center(child: Text('Content Area'))),
            ],
          ),
        ),
      ),
      PreviewItem(
        id: 'nav_rail_extended',
        name: 'Navigation Rail (Desktop)',
        builder: (_) => Scaffold(
          body: Row(
            children: [
              SoteriaNavigationRail(
                currentIndex: 0,
                onDestinationSelected: (_) {},
                destinations: appDestinations,
              ),
              const VerticalDivider(width: 1),
              const Expanded(child: Center(child: Text('Content Area'))),
            ],
          ),
        ),
      ),
    ],
  );

  static final _infrastructureCategory = PreviewCategory(
    id: 'infrastructure',
    name: 'Infrastructure & Tools',
    icon: Icons.settings_input_component_outlined,
    items: [
      PreviewItem(
        id: 'developer_dashboard',
        name: 'Developer Dashboard',
        builder: (_) => const DeveloperDashboardScreen(),
      ),
      PreviewItem(
        id: 'log_viewer',
        name: 'Log Viewer',
        builder: (_) => const LogViewerScreen(),
      ),
      PreviewItem(
        id: 'feature_flags',
        name: 'Feature Flags',
        builder: (_) => const FeatureFlagSettingsScreen(),
      ),
      PreviewItem(
        id: 'analytics',
        name: 'Analytics Dashboard',
        builder: (_) => const AnalyticsDashboardScreen(),
      ),
      PreviewItem(
        id: 'performance',
        name: 'Performance Monitor',
        builder: (_) => const PerformanceDashboardScreen(),
      ),
      PreviewItem(
        id: 'accessibility',
        name: 'Accessibility Tools',
        builder: (_) => const AccessibilityDashboardScreen(),
      ),
      PreviewItem(
        id: 'validation',
        name: 'Data Validation',
        builder: (_) => const ValidationDashboardScreen(),
      ),
    ],
  );
}
