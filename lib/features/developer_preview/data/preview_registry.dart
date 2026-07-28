import 'package:flutter/material.dart';
import '../../../core/design_system/design_system.dart';
import '../../../core/design_system/previews/design_system_previews.dart';
import '../../../core/navigation/navigation_destination.dart';
import '../../../core/navigation/bottom_navigation.dart';
import '../../../core/navigation/navigation_rail.dart';
import '../../../core/feature_flags/feature_flag.dart';
import '../../../core/feature_flags/feature_flag_group.dart';
import '../../../core/widgets/feature_flags/feature_flag_card.dart';
import '../../../core/widgets/splash_screen.dart';
import '../../../core/widgets/buttons/soteria_button.dart';
import '../../../core/widgets/buttons/soteria_icon_button.dart';
import '../../../core/widgets/cards/soteria_card.dart';
import '../../../core/widgets/cards/soteria_stat_card.dart';
import '../../../core/widgets/cards/soteria_reward_card.dart';
import '../../../core/widgets/inputs/soteria_text_field.dart';
import '../../../core/widgets/inputs/soteria_otp_field.dart';
import '../../../core/widgets/inputs/soteria_search_field.dart';
import '../../../core/widgets/inputs/soteria_inputs.dart';
import '../../../core/widgets/badges/soteria_badge.dart';
import '../../../core/widgets/avatars/soteria_avatar.dart';
import '../../../core/widgets/dialogs/soteria_dialogs.dart';
import '../../../core/widgets/bottom_sheets/soteria_bottom_sheets.dart';
import '../../../core/widgets/loading/soteria_loading.dart';
import '../../../core/widgets/empty/soteria_empty_state.dart';
import '../../../core/widgets/error/soteria_error_state.dart';
import '../../../core/widgets/error/soteria_error_view.dart';
import '../../../core/widgets/error/soteria_maintenance_view.dart';
import '../../../core/widgets/lists/soteria_list_tile.dart';
import '../../../core/widgets/indicators/soteria_progress.dart';
import '../../../core/widgets/indicators/gamification_widgets.dart';
import '../../../core/widgets/containers/soteria_placeholder_screen.dart';
import '../../onboarding/presentation/screens/onboarding_screen.dart';
import '../../onboarding/presentation/widgets/onboarding_illustration.dart';
import '../../onboarding/presentation/widgets/onboarding_page_widget.dart';
import '../../personalization/presentation/screens/personalization_screen.dart';
import '../../auth/presentation/screens/login_screen.dart';
import '../../auth/presentation/screens/register_screen.dart';
import '../../auth/presentation/screens/forgot_password_screen.dart';
import '../../auth/presentation/widgets/registration/password_strength_meter.dart';
import '../../auth/presentation/widgets/registration/requirement_checklist.dart';
import '../../auth/presentation/widgets/registration/username_availability_card.dart';
import '../../developer_dashboard/presentation/screens/developer_dashboard_screen.dart';
import '../../developer_dashboard/presentation/screens/log_viewer_screen.dart';
import '../../developer_dashboard/presentation/screens/feature_flags_screen.dart';
import '../../developer_dashboard/presentation/screens/analytics_screen.dart';
import '../../developer_dashboard/presentation/screens/performance_screen.dart';
import '../../developer_dashboard/presentation/screens/accessibility_screen.dart';
import '../../developer_dashboard/presentation/screens/validation_screen.dart';
import '../../home/presentation/screens/home_screen.dart';
import '../../practice/practice_screen.dart';
import '../../versus/versus_screen.dart';
import '../domain/entities/preview_item.dart';

/// Centralized registry for all Developer Preview items.
class PreviewRegistry {
  /// Returns the complete list of preview categories and their items.
  static List<PreviewCategory> get categories => [
        _designSystemCategory,
        _navigationCategory,
        _actionCategory,
        _cardCategory,
        _inputCategory,
        _displayCategory,
        _feedbackCategory,
        _stateCategory,
        _navigationCategory,
        _onboardingCategory,
        _personalizationCategory,
        _authRegistrationCategory,
        _infrastructureCategory,
        _featureScreensCategory,
        _developerToolsCategory,
      ];

  static final _onboardingCategory = PreviewCategory(
    id: 'onboarding',
    name: 'Onboarding Flow',
    icon: Icons.auto_awesome_outlined,
    items: [
      PreviewItem(
        id: 'onboarding_full',
        name: 'Full Walkthrough',
        builder: (_) => const OnboardingScreen(),
      ),
      PreviewItem(
        id: 'onboarding_page_1',
        name: 'Page 1: Welcome',
        builder: (_) => const OnboardingPageWidget(
          title: 'Learn. Compete. Become Legendary.',
          description: "Africa's competitive learning platform where knowledge becomes achievement.",
          illustrationType: OnboardingIllustrationType.hero,
        ),
      ),
      PreviewItem(
        id: 'onboarding_page_2',
        name: 'Page 2: Practice',
        builder: (_) => const OnboardingPageWidget(
          title: 'Practice Every Day',
          description: "Sharpen your skills with daily challenges, earn XP, Coins, and collect exclusive badges.",
          illustrationType: OnboardingIllustrationType.practice,
        ),
      ),
    ],
  );

  static final _personalizationCategory = PreviewCategory(
    id: 'personalization',
    name: 'User Personalization',
    icon: Icons.psychology_outlined,
    items: [
      PreviewItem(
        id: 'personalization_full',
        name: 'Full Flow',
        builder: (_) => const PersonalizationScreen(),
      ),
    ],
  );

  static final _authRegistrationCategory = PreviewCategory(
    id: 'auth_registration',
    name: 'Auth & Registration',
    icon: Icons.person_add_outlined,
    items: [
      PreviewItem(
        id: 'register_full',
        name: 'Full Registration Flow',
        builder: (_) => const RegisterScreen(),
      ),
      PreviewItem(
        id: 'password_strength',
        name: 'Password Strength Meter',
        builder: (_) => const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: PasswordStrengthMeter(password: 'Pass123!'),
          ),
        ),
      ),
      PreviewItem(
        id: 'req_checklist',
        name: 'Requirement Checklist',
        builder: (_) => const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: RequirementChecklist(password: 'pass'),
          ),
        ),
      ),
      PreviewItem(
        id: 'username_card',
        name: 'Username Availability',
        builder: (_) => const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: UsernameAvailabilityCard(username: 'scholar', isAvailable: true, isChecking: false),
          ),
        ),
      ),
    ],
  );

  static final _infrastructureCategory = PreviewCategory(
    id: 'infrastructure',
    name: 'Infrastructure Widgets',
    icon: Icons.settings_input_component_outlined,
    items: [
      PreviewItem(
        id: 'feature_flag_card',
        name: 'Feature Flag Card',
        builder: (_) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FeatureFlagCard(
              flag: const FeatureFlag(
                id: 'preview_flag',
                name: 'Sample Feature',
                description: 'This is a description of how the feature flag works in the system.',
                category: FeatureCategory.experimental,
                defaultValue: false,
              ),
              onToggle: () {},
              onReset: () {},
            ),
          ),
        ),
      ),
    ],
  );

  static final _designSystemCategory = PreviewCategory(
    id: 'design_system',
    name: 'Design System',
    icon: Icons.palette_outlined,
    items: [
      PreviewItem(
        id: 'colors',
        name: 'Colors',
        builder: (_) => const ColorPreview(),
        tags: const ['palette', 'theme', 'tokens'],
      ),
      PreviewItem(
        id: 'typography',
        name: 'Typography',
        builder: (_) => const TypographyPreview(),
        tags: const ['text', 'fonts', 'styles'],
      ),
      PreviewItem(
        id: 'spacing',
        name: 'Spacing',
        builder: (_) => const SpacingPreview(),
        tags: const ['padding', 'margins', 'layout'],
      ),
      PreviewItem(
        id: 'radius',
        name: 'Radius',
        builder: (_) => const RadiusPreview(),
        tags: const ['corners', 'shape'],
      ),
      PreviewItem(
        id: 'elevation_shadows',
        name: 'Elevation & Shadows',
        builder: (_) => const ElevationPreview(),
        tags: const ['depth', 'z-index'],
      ),
      PreviewItem(
        id: 'animations_ds',
        name: 'Animation Tokens',
        builder: (_) => const AnimationPreview(),
        tags: const ['motion', 'curves', 'transitions'],
      ),
      PreviewItem(
        id: 'icons',
        name: 'Icons',
        builder: (_) => const IconPreview(),
        tags: const ['assets', 'glyph'],
      ),
    ],
  );

  static final _navigationCategory = PreviewCategory(
    id: 'navigation',
    name: 'Navigation Shell',
    icon: Icons.navigation_outlined,
    items: [
      PreviewItem(
        id: 'bottom_nav',
        name: 'Bottom Navigation',
        builder: (_) => Scaffold(
          bottomNavigationBar: SoteriaBottomNavigation(
            currentIndex: 0,
            onDestinationSelected: (_) {},
            destinations: appDestinations.take(5).toList(),
          ),
        ),
      ),
      PreviewItem(
        id: 'nav_rail',
        name: 'Navigation Rail',
        builder: (_) => Scaffold(
          body: Row(
            children: [
              SoteriaNavigationRail(
                currentIndex: 0,
                onDestinationSelected: (_) {},
                destinations: appDestinations.take(5).toList(),
              ),
              const Expanded(child: Center(child: Text('Content Area'))),
            ],
          ),
        ),
      ),
      PreviewItem(
        id: 'placeholder_screen',
        name: 'Placeholder Screen',
        builder: (_) => const SoteriaPlaceholderScreen(
          title: 'Coming Soon',
          description: 'This feature is currently under active development.',
        ),
      ),
    ],
  );

  static final _actionCategory = PreviewCategory(
    id: 'actions',
    name: 'Buttons & Actions',
    icon: Icons.touch_app_outlined,
    items: [
      PreviewItem(
        id: 'buttons_primary',
        name: 'Primary Button',
        builder: (_) => Center(child: SoteriaButton(label: 'PRIMARY', onPressed: () {})),
      ),
      PreviewItem(
        id: 'buttons_reward',
        name: 'Reward Button',
        builder: (_) => Center(child: SoteriaButton(label: 'CLAIM REWARD', type: SoteriaButtonType.reward, icon: SoteriaIcons.reward, onPressed: () {})),
      ),
      PreviewItem(
        id: 'buttons_outlined',
        name: 'Outlined Button',
        builder: (_) => Center(child: SoteriaButton(label: 'OUTLINED', type: SoteriaButtonType.outlined, onPressed: () {})),
      ),
      PreviewItem(
        id: 'buttons_destructive',
        name: 'Destructive Button',
        builder: (_) => Center(child: SoteriaButton(label: 'DELETE', type: SoteriaButtonType.destructive, icon: SoteriaIcons.delete, onPressed: () {})),
      ),
      PreviewItem(
        id: 'icon_buttons',
        name: 'Icon Buttons',
        builder: (_) => const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SoteriaIconButton(icon: SoteriaIcons.refresh, onPressed: null),
              SoteriaIconButton(icon: SoteriaIcons.add, backgroundColor: SoteriaColors.primaryLight, color: Colors.white, onPressed: null),
            ],
          ),
        ),
      ),
    ],
  );

  static final _cardCategory = PreviewCategory(
    id: 'cards',
    name: 'Cards',
    icon: Icons.layers_outlined,
    items: [
      PreviewItem(
        id: 'card_standard',
        name: 'Standard Card',
        builder: (_) => const SoteriaCard(child: Text('Standard Card')),
      ),
      PreviewItem(
        id: 'card_glass',
        name: 'Glass Card',
        builder: (_) => Center(
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://picsum.photos/400/200'), fit: BoxFit.cover),
            ),
            child: const Center(
              child: SoteriaCard(isGlass: true, child: Text('Glass Card Over Image', style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
      PreviewItem(
        id: 'card_stat',
        name: 'Statistic Card',
        builder: (_) => const SoteriaStatCard(label: 'Win Rate', value: '84%', icon: Icons.trending_up, trend: '+2.4%'),
      ),
      PreviewItem(
        id: 'card_reward',
        name: 'Reward Card',
        builder: (_) => const SoteriaRewardCard(title: 'Mission Complete', reward: '500 COINS', icon: SoteriaIcons.reward),
      ),
    ],
  );

  static final _inputCategory = PreviewCategory(
    id: 'inputs',
    name: 'Forms & Inputs',
    icon: Icons.input_outlined,
    items: [
      PreviewItem(
        id: 'input_text',
        name: 'Text Fields',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SoteriaTextField(label: 'Username', hintText: 'Enter username'),
              SizedBox(height: 16),
              SoteriaTextField(label: 'Password', type: SoteriaTextFieldType.password, suffixIcon: Icon(SoteriaIcons.visibilityOff)),
            ],
          ),
        ),
      ),
      PreviewItem(
        id: 'input_otp',
        name: 'OTP Field',
        builder: (_) => const Padding(padding: EdgeInsets.all(16), child: SoteriaOtpField(length: 4)),
      ),
      PreviewItem(
        id: 'input_search',
        name: 'Search Field',
        builder: (_) => const Padding(padding: EdgeInsets.all(16), child: SoteriaSearchField()),
      ),
      PreviewItem(
        id: 'input_selection',
        name: 'Selection Controls',
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SoteriaSwitch(label: 'Dark Mode', value: true, onChanged: (_) {}),
              SoteriaCheckbox(label: 'Accept Terms', value: true, onChanged: (_) {}),
              SoteriaSlider(label: 'Volume', value: 50, onChanged: (_) {}),
            ],
          ),
        ),
      ),
    ],
  );

  static final _displayCategory = PreviewCategory(
    id: 'data_display',
    name: 'Data Display',
    icon: Icons.visibility_outlined,
    items: [
      PreviewItem(
        id: 'display_badges',
        name: 'Badges & Tags',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            children: [
              SoteriaBadge(label: 'LIVE', type: SoteriaBadgeType.error, icon: Icons.circle),
              SoteriaBadge(label: 'LEVEL 12', type: SoteriaBadgeType.level),
              SoteriaTag(label: 'HARD', color: Colors.red),
            ],
          ),
        ),
      ),
      PreviewItem(
        id: 'display_avatars',
        name: 'Avatars',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(16),
          child: Wrap(
            spacing: 16,
            children: [
              SoteriaAvatar(initials: 'JD', showStatus: true, isOnline: true),
              SoteriaAvatar(imageUrl: 'https://i.pravatar.cc/150?u=1', size: 64),
            ],
          ),
        ),
      ),
      PreviewItem(
        id: 'display_progress',
        name: 'Progress Indicators',
        builder: (_) => const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SoteriaLinearProgress(value: 0.7),
              SizedBox(height: 24),
              XPProgressBar(progress: 0.65, level: 12),
            ],
          ),
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
        id: 'feedback_dialogs',
        name: 'Dialogs',
        builder: (context) => Center(
          child: SoteriaButton(
            label: 'SHOW DIALOG',
            onPressed: () => showDialog<void>(
              context: context,
              builder: (_) => const SoteriaDialog(
                title: 'Confirm Action',
                message: 'Are you sure you want to proceed with this high-stakes duel?',
                cancelLabel: 'CANCEL',
                confirmLabel: 'LET\'S GO',
              ),
            ),
          ),
        ),
      ),
      PreviewItem(
        id: 'feedback_sheets',
        name: 'Bottom Sheets',
        builder: (context) => Center(
          child: SoteriaButton(
            label: 'SHOW SHEET',
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              builder: (_) => SoteriaBottomSheet(
                title: 'Select Item',
                child: Column(
                  children: [
                    SoteriaListTile(title: 'Option 1', onTap: () {}),
                    SoteriaListTile(title: 'Option 2', onTap: () {}),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );

  static final _stateCategory = PreviewCategory(
    id: 'states',
    name: 'States & Errors',
    icon: Icons.hourglass_empty_outlined,
    items: [
      PreviewItem(
        id: 'state_loading',
        name: 'Loading States',
        builder: (_) => const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SoteriaCircularLoader(),
            SizedBox(height: 24),
            SoteriaSkeleton(height: 20, width: 200),
            SizedBox(height: 16),
            SoteriaSkeleton(height: 100),
          ],
        ),
      ),
      PreviewItem(
        id: 'state_empty',
        name: 'Empty States',
        builder: (_) => SoteriaEmptyState.noInternet(),
      ),
      PreviewItem(
        id: 'state_error_standard',
        name: 'Error State (Standard)',
        builder: (_) => const SoteriaErrorState(message: 'A secure connection could not be established.'),
      ),
      PreviewItem(
        id: 'state_error_view',
        name: 'Error View (Full Screen)',
        builder: (_) => const SoteriaErrorView(
          message: 'The Arena is temporarily unavailable due to a critical surge in academic energy.',
          type: SoteriaErrorType.fatal,
          onActionPressed: null,
        ),
      ),
      PreviewItem(
        id: 'state_maintenance',
        name: 'Maintenance Mode',
        builder: (_) => const SoteriaMaintenanceView(estimatedTime: '2 Hours'),
      ),
    ],
  );

  static final _featureScreensCategory = PreviewCategory(
    id: 'feature_screens',
    name: 'Feature Screens',
    icon: Icons.screenshot_outlined,
    items: [
      PreviewItem(
        id: 'home',
        name: 'Home Dashboard',
        builder: (_) => const HomeScreen(),
      ),
      PreviewItem(
        id: 'practice',
        name: 'Practice Mode',
        builder: (_) => const PracticeScreen(),
      ),
      PreviewItem(
        id: 'versus',
        name: 'Versus Mode',
        builder: (_) => const VersusScreen(),
      ),
      PreviewItem(
        id: 'splash',
        name: 'Animated Splash Screen',
        builder: (_) => const SplashScreen(),
        tags: const ['welcome', 'animation', 'entry'],
      ),
      PreviewItem(
        id: 'onboarding',
        name: 'Onboarding Walkthrough',
        builder: (_) => const OnboardingScreen(),
        tags: const ['welcome', 'tutorial'],
      ),
      PreviewItem(
        id: 'login',
        name: 'Login Screen',
        builder: (_) => const LoginScreen(),
        tags: const ['auth', 'signin'],
      ),
      PreviewItem(
        id: 'forgot_password',
        name: 'Forgot Password',
        builder: (_) => const ForgotPasswordScreen(),
        tags: const ['auth', 'recovery'],
      ),
      PreviewItem(
        id: 'register',
        name: 'Register Screen',
        builder: (_) => const RegisterScreen(),
        tags: const ['auth', 'signup'],
      ),
    ],
  );

  static final _developerToolsCategory = PreviewCategory(
    id: 'developer_tools',
    name: 'Developer Tools',
    icon: Icons.bug_report_outlined,
    items: [
      PreviewItem(
        id: 'dashboard',
        name: 'Developer Dashboard',
        builder: (_) => const DeveloperDashboardScreen(),
        tags: const ['debug', 'admin', 'info'],
      ),
      PreviewItem(
        id: 'log_viewer',
        name: 'Log Viewer',
        builder: (_) => const LogViewerScreen(),
        tags: const ['logs', 'debug', 'history'],
      ),
      PreviewItem(
        id: 'feature_flags_dashboard',
        name: 'Feature Flags',
        builder: (_) => const FeatureFlagSettingsScreen(),
        tags: const ['flags', 'config'],
      ),
      PreviewItem(
        id: 'analytics_dashboard',
        name: 'Analytics Console',
        builder: (_) => const AnalyticsDashboardScreen(),
        tags: const ['events', 'tracking'],
      ),
      PreviewItem(
        id: 'performance_dashboard',
        name: 'Performance Monitor',
        builder: (_) => const PerformanceDashboardScreen(),
        tags: const ['jank', 'fps', 'memory'],
      ),
      PreviewItem(
        id: 'accessibility_dashboard',
        name: 'Accessibility Tools',
        builder: (_) => const AccessibilityDashboardScreen(),
        tags: const ['semantics', 'a11y'],
      ),
      PreviewItem(
        id: 'validation_dashboard',
        name: 'Quality Validation',
        builder: (_) => const ValidationDashboardScreen(),
        tags: const ['checks', 'tokens'],
      ),
    ],
  );
}
