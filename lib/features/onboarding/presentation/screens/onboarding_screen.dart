import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/onboarding_page_widget.dart';
import '../widgets/onboarding_illustration.dart';
import '../widgets/onboarding_footer.dart';

/// The main onboarding entry point, managing the 6-page walkthrough.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<_OnboardingData> _pages = [
    const _OnboardingData(
      title: 'Learn. Compete.\nBecome Legendary.',
      description: "Africa's competitive learning platform where knowledge becomes achievement.",
      illustrationType: OnboardingIllustrationType.hero,
    ),
    const _OnboardingData(
      title: 'Practice Every Day',
      description: "Sharpen your skills with daily challenges, earn XP, Coins, and collect exclusive badges.",
      illustrationType: OnboardingIllustrationType.practice,
    ),
    const _OnboardingData(
      title: 'Challenge Friends',
      description: "Go head-to-head in Versus Mode, climb the ranks, and build your scholarly reputation.",
      illustrationType: OnboardingIllustrationType.versus,
    ),
    const _OnboardingData(
      title: 'Join Tournaments',
      description: "Participate in scheduled faculty and national events. Huge prize pools and glory await.",
      illustrationType: OnboardingIllustrationType.tournament,
    ),
    const _OnboardingData(
      title: 'Climb the Ranks',
      description: "See your standing in University and National leaderboards. Prove you are the best.",
      illustrationType: OnboardingIllustrationType.leaderboard,
    ),
    const _OnboardingData(
      title: 'Ready to Begin?',
      description: "Join thousands of scholars already competing in the Arena.",
      illustrationType: OnboardingIllustrationType.ready,
    ),
  ];

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: SoteriaAnimations.medium,
        curve: SoteriaAnimations.standard,
      );
    } else {
      _complete();
    }
  }

  void _onSkip() {
    _pageController.animateToPage(
      _pages.length - 1,
      duration: SoteriaAnimations.slow,
      curve: SoteriaAnimations.standard,
    );
  }

  void _complete() {
    ref.read(onboardingProvider.notifier).completeOnboarding();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentIndex == _pages.length - 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: _currentIndex > 0 
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => _pageController.previousPage(
                duration: SoteriaAnimations.medium, 
                curve: SoteriaAnimations.standard,
              ),
            )
          : null,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                final data = _pages[index];
                return OnboardingPageWidget(
                  title: data.title,
                  description: data.description,
                  illustrationType: data.illustrationType,
                );
              },
            ),
          ),
          
          if (!isLastPage)
            OnboardingFooter(
              itemCount: _pages.length,
              currentIndex: _currentIndex,
              onNext: _onNext,
              onSkip: _onSkip,
            )
          else
            _buildFinalFooter(),
        ],
      ),
    );
  }

  Widget _buildFinalFooter() {
    return Padding(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SoteriaButton(
            onPressed: _complete,
            label: 'GET STARTED',
            type: SoteriaButtonType.reward,
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          SoteriaButton(
            onPressed: _complete, // Future: login as guest
            label: 'CONTINUE AS GUEST',
            type: SoteriaButtonType.secondary,
          ),
          const SizedBox(height: SoteriaSpacing.s16),
        ],
      ),
    );
  }
}

class _OnboardingData {
  const _OnboardingData({
    required this.title,
    required this.description,
    required this.illustrationType,
  });

  final String title;
  final String description;
  final OnboardingIllustrationType illustrationType;
}
