import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/learning_profile.dart';
import '../../domain/repositories/personalization_repository.dart';
import '../../data/repositories/personalization_repository_impl.dart';

part 'personalization_provider.g.dart';

@Riverpod(keepAlive: true)
PersonalizationRepository personalizationRepository(Ref ref) {
  throw UnimplementedError('Override this in ProviderScope');
}

@Riverpod(keepAlive: true)
class PersonalizationNotifier extends _$PersonalizationNotifier {
  PersonalizationRepository? _repository;
  bool _isInitialized = false;

  @override
  PersonalizationState build() {
    return const PersonalizationState(
      profile: LearningProfile(),
      currentStep: 0,
      totalSteps: 10,
      isCompleted: false,
    );
  }

  Future<void> initialize(SharedPreferences prefs) async {
    if (_isInitialized) return;

    final repo = PersonalizationRepositoryImpl(prefs);
    _repository = repo;
    
    final result = await repo.getProfile();
    final isCompleted = prefs.getBool('personalization_completed') ?? false;
    
    state = state.copyWith(
      profile: result.dataOrNull ?? const LearningProfile(),
      isCompleted: isCompleted,
    );
    _isInitialized = true;
  }

  void updateProfile(LearningProfile Function(LearningProfile) update) {
    state = state.copyWith(profile: update(state.profile));
  }

  void nextStep() {
    if (state.currentStep < state.totalSteps - 1) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void setStep(int step) {
    if (step >= 0 && step < state.totalSteps) {
      state = state.copyWith(currentStep: step);
    }
  }

  Future<void> save() async {
    if (_repository == null) return;
    await _repository!.saveProfile(state.profile);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('personalization_completed', true);
    state = state.copyWith(isCompleted: true);
  }

  Future<void> resetAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('soteria_learning_profile');
    await prefs.remove('personalization_completed');
    state = const PersonalizationState(
      profile: LearningProfile(),
      currentStep: 0,
      totalSteps: 10,
      isCompleted: false,
    );
  }
}

class PersonalizationState {
  const PersonalizationState({
    required this.profile,
    required this.currentStep,
    required this.totalSteps,
    required this.isCompleted,
  });

  final LearningProfile profile;
  final int currentStep;
  final int totalSteps;
  final bool isCompleted;

  PersonalizationState copyWith({
    LearningProfile? profile,
    int? currentStep,
    int? totalSteps,
    bool? isCompleted,
  }) {
    return PersonalizationState(
      profile: profile ?? this.profile,
      currentStep: currentStep ?? this.currentStep,
      totalSteps: totalSteps ?? this.totalSteps,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
