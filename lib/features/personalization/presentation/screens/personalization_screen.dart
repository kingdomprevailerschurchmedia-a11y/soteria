import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/navigation/soteria_scaffold.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../../../../core/widgets/inputs/soteria_text_field.dart';
import '../../../../core/widgets/chips/soteria_chips.dart';
import '../providers/personalization_provider.dart';
import '../widgets/personalization_widgets.dart';
import '../widgets/avatar_picker.dart';
import '../widgets/summary_widgets.dart';
import '../../domain/entities/learning_profile.dart';

class PersonalizationScreen extends ConsumerStatefulWidget {
  const PersonalizationScreen({super.key});

  @override
  ConsumerState<PersonalizationScreen> createState() => _PersonalizationScreenState();
}

class _PersonalizationScreenState extends ConsumerState<PersonalizationScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    final state = ref.read(personalizationProvider);
    if (state.currentStep < state.totalSteps - 1) {
      _pageController.nextPage(
        duration: SoteriaAnimations.medium,
        curve: SoteriaAnimations.standard,
      );
    } else {
      _complete();
    }
  }

  void _onBack() {
    _pageController.previousPage(
      duration: SoteriaAnimations.medium,
      curve: SoteriaAnimations.standard,
    );
  }

  void _complete() async {
    await ref.read(personalizationProvider.notifier).save();
    // Router will automatically redirect based on provider state
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(personalizationProvider);

    return SoteriaScaffold(
      body: Column(
        children: [
          const SizedBox(height: SoteriaSpacing.s16),
          ProgressHeader(
            currentStep: state.currentStep,
            totalSteps: state.totalSteps,
            onBack: state.currentStep > 0 ? _onBack : null,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (idx) => ref.read(personalizationProvider.notifier).setStep(idx),
              children: [
                _buildStep1Welcome(),
                _buildStep2EducationLevel(state.profile),
                _buildStep3Institution(state.profile),
                _buildStep4Categories(state.profile),
                _buildStep5Difficulty(state.profile),
                _buildStep6DailyGoal(state.profile),
                _buildStep7Competition(state.profile),
                _buildStep8Notifications(state.profile),
                _buildStep9Avatar(state.profile),
                _buildStep10Summary(state.profile),
              ],
            ),
          ),
          _buildFooter(state),
        ],
      ),
    );
  }

  Widget _buildFooter(PersonalizationState state) {
    final isLastStep = state.currentStep == state.totalSteps - 1;
    final isWelcomeStep = state.currentStep == 0;

    return Padding(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SoteriaButton(
            onPressed: _onNext,
            label: isLastStep ? 'FINALIZE PROFILE' : (isWelcomeStep ? 'START PERSONALIZATION' : 'CONTINUE'),
            type: isLastStep ? SoteriaButtonType.reward : SoteriaButtonType.primary,
          ),
          if (state.currentStep == 2)
            TextButton(
              onPressed: _onNext,
              child: const Text('SKIP FOR NOW'),
            ),
        ],
      ),
    );
  }

  Widget _buildStep1Welcome() {
    return _StepContent(
      title: "Let's Personalize Your Experience",
      description: "We'll tailor Soteria to your educational goals and interests to help you achieve mastery faster.",
      child: Container(
        padding: const EdgeInsets.all(SoteriaSpacing.s32),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.psychology_outlined, size: 100, color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget _buildStep2EducationLevel(LearningProfile profile) {
    return _StepContent(
      title: "What's your current education level?",
      description: "This helps us suggest the right content difficulty.",
      child: Column(
        children: [
          SelectionCard(
            title: 'Secondary School',
            value: EducationLevel.secondarySchool,
            selectedValue: profile.educationLevel,
            onSelected: (v) => ref.read(personalizationProvider.notifier).updateProfile((p) => p.copyWith(educationLevel: v)),
            icon: Icons.school_outlined,
          ),
          const SizedBox(height: SoteriaSpacing.s12),
          SelectionCard(
            title: 'University Student',
            value: EducationLevel.university,
            selectedValue: profile.educationLevel,
            onSelected: (v) => ref.read(personalizationProvider.notifier).updateProfile((p) => p.copyWith(educationLevel: v)),
            icon: Icons.account_balance_outlined,
          ),
          const SizedBox(height: SoteriaSpacing.s12),
          SelectionCard(
            title: 'Graduate',
            value: EducationLevel.graduate,
            selectedValue: profile.educationLevel,
            onSelected: (v) => ref.read(personalizationProvider.notifier).updateProfile((p) => p.copyWith(educationLevel: v)),
            icon: Icons.workspace_premium_outlined,
          ),
          const SizedBox(height: SoteriaSpacing.s12),
          SelectionCard(
            title: 'Professional',
            value: EducationLevel.professional,
            selectedValue: profile.educationLevel,
            onSelected: (v) => ref.read(personalizationProvider.notifier).updateProfile((p) => p.copyWith(educationLevel: v)),
            icon: Icons.business_center_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildStep3Institution(LearningProfile profile) {
    return _StepContent(
      title: "Where do you study?",
      description: "Join your school's leaderboard and compete with classmates.",
      child: _InstitutionField(
        initialValue: profile.institution,
        onChanged: (v) => ref.read(personalizationProvider.notifier).updateProfile((p) => p.copyWith(institution: v)),
      ),
    );
  }

  Widget _buildStep4Categories(LearningProfile profile) {
    final categories = ['General Knowledge', 'Science', 'Technology', 'Mathematics', 'History', 'Geography', 'Sports', 'Business', 'Politics', 'Current Affairs', 'Medicine', 'Engineering', 'Programming', 'Entertainment', 'Art', 'Literature', 'Religion', 'Languages'];
    
    return _StepContent(
      title: "Choose your interests",
      description: "Select the categories you'd like to master.",
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: categories.map((cat) {
          final isSelected = profile.preferredCategories.contains(cat);
          return SoteriaFilterChip(
            label: cat,
            selected: isSelected,
            onSelected: (v) {
              final newList = List<String>.from(profile.preferredCategories);
              if (v) {
                newList.add(cat);
              } else {
                newList.remove(cat);
              }
              ref.read(personalizationProvider.notifier).updateProfile((p) => p.copyWith(preferredCategories: newList));
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStep5Difficulty(LearningProfile profile) {
    return _StepContent(
      title: "Preferred Difficulty",
      description: "How challenging should the initial questions be?",
      child: Column(
        children: [
          SelectionCard(title: 'Beginner', subtitle: 'Start with the basics', value: DifficultyPreference.beginner, selectedValue: profile.difficultyPreference, onSelected: _updateDifficulty),
          const SizedBox(height: 12),
          SelectionCard(title: 'Intermediate', subtitle: 'Standard difficulty', value: DifficultyPreference.intermediate, selectedValue: profile.difficultyPreference, onSelected: _updateDifficulty),
          const SizedBox(height: 12),
          SelectionCard(title: 'Advanced', subtitle: 'For subject masters', value: DifficultyPreference.advanced, selectedValue: profile.difficultyPreference, onSelected: _updateDifficulty),
          const SizedBox(height: 12),
          SelectionCard(title: 'Adaptive', subtitle: 'Adjusts to your performance', value: DifficultyPreference.adaptive, selectedValue: profile.difficultyPreference, onSelected: _updateDifficulty),
        ],
      ),
    );
  }

  void _updateDifficulty(DifficultyPreference v) {
    ref.read(personalizationProvider.notifier).updateProfile((p) => p.copyWith(difficultyPreference: v));
  }

  Widget _buildStep6DailyGoal(LearningProfile profile) {
    return _StepContent(
      title: "Set a Daily Goal",
      description: "Consistent practice is the key to becoming legendary.",
      child: Column(
        children: [
          SelectionCard(title: '5 Questions', subtitle: 'Casual learning', value: DailyLearningGoal.five, selectedValue: profile.dailyGoal, onSelected: _updateGoal),
          const SizedBox(height: 12),
          SelectionCard(title: '10 Questions', subtitle: 'Steady progress', value: DailyLearningGoal.ten, selectedValue: profile.dailyGoal, onSelected: _updateGoal),
          const SizedBox(height: 12),
          SelectionCard(title: '20 Questions', subtitle: 'Serious commitment', value: DailyLearningGoal.twenty, selectedValue: profile.dailyGoal, onSelected: _updateGoal),
          const SizedBox(height: 12),
          SelectionCard(title: '50 Questions', subtitle: 'Hardcore scholar', value: DailyLearningGoal.fifty, selectedValue: profile.dailyGoal, onSelected: _updateGoal),
        ],
      ),
    );
  }

  void _updateGoal(DailyLearningGoal v) {
    ref.read(personalizationProvider.notifier).updateProfile((p) => p.copyWith(dailyGoal: v));
  }

  Widget _buildStep7Competition(LearningProfile profile) {
    return _StepContent(
      title: "Competition Style",
      description: "Are you here for fun or for the championship?",
      child: Column(
        children: [
          SelectionCard(title: 'Practice Only', subtitle: 'No pressure, just learning', value: CompetitionPreference.practiceOnly, selectedValue: profile.competitionPreference, onSelected: _updateComp),
          const SizedBox(height: 12),
          SelectionCard(title: 'Friendly Competition', subtitle: 'Duel with friends', value: CompetitionPreference.friendly, selectedValue: profile.competitionPreference, onSelected: _updateComp),
          const SizedBox(height: 12),
          SelectionCard(title: 'Competitive', subtitle: 'Climb the national ranks', value: CompetitionPreference.competitive, selectedValue: profile.competitionPreference, onSelected: _updateComp),
          const SizedBox(height: 12),
          SelectionCard(title: 'Professional', subtitle: 'Cash prizes and tournaments', value: CompetitionPreference.professional, selectedValue: profile.competitionPreference, onSelected: _updateComp),
        ],
      ),
    );
  }

  void _updateComp(CompetitionPreference v) {
    ref.read(personalizationProvider.notifier).updateProfile((p) => p.copyWith(competitionPreference: v));
  }

  Widget _buildStep8Notifications(LearningProfile profile) {
    return _StepContent(
      title: "Stay Updated",
      description: "Don't miss out on rewards and challenges.",
      child: Column(
        children: profile.notificationPreferences.entries.map((e) {
          return SwitchListTile.adaptive(
            title: Text(e.key.replaceAll(RegExp(r'(?=[A-Z])'), ' ').toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            value: e.value,
            onChanged: (v) {
              final newPrefs = Map<String, bool>.from(profile.notificationPreferences);
              newPrefs[e.key] = v;
              ref.read(personalizationProvider.notifier).updateProfile((p) => p.copyWith(notificationPreferences: newPrefs));
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStep9Avatar(LearningProfile profile) {
    return _StepContent(
      title: "Choose an Avatar",
      description: "Pick a visual identity for the Arena.",
      child: AvatarPicker(
        selectedId: profile.avatarId,
        onSelected: (id) => ref.read(personalizationProvider.notifier).updateProfile((p) => p.copyWith(avatarId: id)),
      ),
    );
  }

  Widget _buildStep10Summary(LearningProfile profile) {
    return _StepContent(
      title: "Everything Looks Good?",
      description: "Review your profile before we start.",
      child: Column(
        children: [
          SummaryItem(label: 'Education', value: profile.educationLevel.name.toUpperCase(), onEdit: () => _pageController.animateToPage(1, duration: SoteriaAnimations.slow, curve: Curves.easeInOut)),
          const SizedBox(height: 8),
          SummaryItem(label: 'Interests', value: '${profile.preferredCategories.length} Categories', onEdit: () => _pageController.animateToPage(3, duration: SoteriaAnimations.slow, curve: Curves.easeInOut)),
          const SizedBox(height: 8),
          SummaryItem(label: 'Daily Goal', value: profile.dailyGoal.name.toUpperCase(), onEdit: () => _pageController.animateToPage(5, duration: SoteriaAnimations.slow, curve: Curves.easeInOut)),
          const SizedBox(height: 8),
          SummaryItem(label: 'Comp Style', value: profile.competitionPreference.name.toUpperCase(), onEdit: () => _pageController.animateToPage(6, duration: SoteriaAnimations.slow, curve: Curves.easeInOut)),
        ],
      ),
    );
  }
}

class _StepContent extends StatelessWidget {
  const _StepContent({
    required this.title,
    required this.description,
    required this.child,
  });

  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s24),
      child: Column(
        children: [
          const SizedBox(height: SoteriaSpacing.s48),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: SoteriaSpacing.s12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: SoteriaSpacing.s48),
          child,
          const SizedBox(height: SoteriaSpacing.s48),
        ],
      ),
    );
  }
}

class _InstitutionField extends StatefulWidget {
  const _InstitutionField({this.initialValue, required this.onChanged});
  final String? initialValue;
  final ValueChanged<String> onChanged;

  @override
  State<_InstitutionField> createState() => _InstitutionFieldState();
}

class _InstitutionFieldState extends State<_InstitutionField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SoteriaTextField(
      label: 'Institution Name',
      hintText: 'e.g. University of Lagos',
      controller: _controller,
      onChanged: widget.onChanged,
      prefixIcon: const Icon(Icons.search),
    );
  }
}
