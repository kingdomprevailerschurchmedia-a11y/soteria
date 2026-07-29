import 'package:flutter/material.dart';
import '../../../core/design_system/design_system.dart';
import '../../../core/design_system/previews/design_system_previews.dart';
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
import '../domain/entities/preview_item.dart';

/// Centralized registry for all Developer Preview items.
class PreviewRegistry {
  /// Returns the complete list of preview categories and their items.
  static List<PreviewCategory> get categories => [
        _designSystemCategory,
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
      ];

  static final _designSystemCategory = PreviewCategory(
    id: 'design_system',
    name: 'Design System',
    icon: Icons.palette_outlined,
    items: [
      PreviewItem(
        id: 'colors',
        name: 'Color Palette',
        builder: (_) => const ColorPreview(),
      ),
      PreviewItem(
        id: 'typography',
        name: 'Typography',
        builder: (_) => const TypographyPreview(),
      ),
      PreviewItem(
        id: 'spacing',
        name: 'Spacing System',
        builder: (_) => const SpacingPreview(),
      ),
      PreviewItem(
        id: 'radius',
        name: 'Radius System',
        builder: (_) => const RadiusPreview(),
      ),
    ],
  );

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
          child: XPProgressBar(progress: 0.65, level: 12),
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
