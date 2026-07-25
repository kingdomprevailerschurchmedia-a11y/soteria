import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widget_previews.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/utils/app_animations.dart';
import '../../../../core/widgets/shared/soteria_button.dart';
import '../../../../core/widgets/shared/soteria_card.dart';
import '../providers/onboarding_provider.dart';

/// OnboardingScreen provides a high-polish walkthrough of Soteria's value prop.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingPage> _pages = [
    const _OnboardingPage(
      title: 'Competitive Learning',
      description: 'Master your subjects while competing with students across Africa.',
      icon: SoteriaIcons.trophy,
      color: SoteriaColors.primaryLight,
    ),
    const _OnboardingPage(
      title: 'Real-Time Duels',
      description: 'Challenge your friends to 1v1 battles and climb the faculty leaderboard.',
      icon: Icons.bolt,
      color: SoteriaColors.streakOrange,
    ),
    const _OnboardingPage(
      title: 'Earn Rewards',
      description: 'Turn your knowledge into Coins and claim exclusive prizes and scholarships.',
      icon: SoteriaIcons.reward,
      color: SoteriaColors.coinGold,
    ),
  ];

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: SoteriaAnimations.medium,
        curve: SoteriaAnimations.standard,
      );
    } else {
      ref.read(onboardingProvider.notifier).completeOnboarding();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          AnimatedContainer(
            duration: SoteriaAnimations.slow,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _pages[_currentPage].color.withAlpha(20),
                  SoteriaColors.backgroundLight,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (idx) => setState(() => _currentPage = idx),
                    itemCount: _pages.length,
                    itemBuilder: (context, idx) {
                      return AppAnimations.slideIn(
                        child: _PageContent(page: _pages[idx]),
                      );
                    },
                  ),
                ),

                // Bottom Controls
                Padding(
                  padding: const EdgeInsets.all(SoteriaSpacing.s24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _pages.length,
                          (idx) => _Indicator(isActive: idx == _currentPage),
                        ),
                      ),
                      const SizedBox(height: SoteriaSpacing.s48),
                      SoteriaButton(
                        onPressed: _onNext,
                        label: _currentPage == _pages.length - 1 ? 'GET STARTED' : 'CONTINUE',
                        type: _currentPage == _pages.length - 1 
                            ? SoteriaButtonType.reward 
                            : SoteriaButtonType.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPage {
  const _OnboardingPage({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;
}

class _PageContent extends StatelessWidget {
  const _PageContent({required this.page});
  final _OnboardingPage page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SoteriaCard(
            isGlass: true,
            color: page.color,
            padding: const EdgeInsets.all(SoteriaSpacing.s48),
            child: Icon(page.icon, size: 80, color: page.color),
          ),
          const SizedBox(height: SoteriaSpacing.s48),
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: page.color,
                ),
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          Text(
            page.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey.shade700,
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: SoteriaAnimations.fast,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? SoteriaColors.primaryLight : Colors.grey.shade300,
        borderRadius: BorderRadius.all(Radius.circular(SoteriaRadius.xs)),
      ),
    );
  }
}

// --- Previews ---

@Preview(name: 'Onboarding - Walkthrough')
Widget onboardingPreview() {
  return const ProviderScope(
    child: MaterialApp(
      home: OnboardingScreen(),
    ),
  );
}
