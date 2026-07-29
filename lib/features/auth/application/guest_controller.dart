import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/guest_progress.dart';
import '../domain/repositories/guest_repository.dart';

part 'guest_controller.g.dart';

/// Notifier that manages local progress for guest users.
@Riverpod(keepAlive: true)
class GuestController extends _$GuestController {
  GuestRepository? _repository;
  bool _isInitialized = false;

  @override
  GuestProgress build() {
    return const GuestProgress();
  }

  /// Initializes the controller from local storage.
  Future<void> initialize(GuestRepository repository) async {
    if (_isInitialized) return;
    _repository = repository;
    
    final result = await repository.getProgress();
    if (!ref.mounted) return;

    if (result.isSuccess) {
      state = result.dataOrNull ?? const GuestProgress();
    }
    _isInitialized = true;
  }

  /// Increments user XP.
  Future<void> addXp(int amount) async {
    state = state.copyWith(xp: state.xp + amount);
    await _save();
  }

  /// Increments user coins.
  Future<void> addCoins(int amount) async {
    state = state.copyWith(coins: state.coins + amount);
    await _save();
  }

  /// Records a completed quiz.
  Future<void> completeQuiz(String quizId) async {
    if (state.completedQuizIds.contains(quizId)) return;
    state = state.copyWith(
      completedQuizIds: [...state.completedQuizIds, quizId],
    );
    await _save();
  }

  /// Resets all local progress.
  Future<void> resetProgress() async {
    if (_repository == null) return;
    await _repository!.resetProgress();
    state = const GuestProgress();
  }

  Future<void> _save() async {
    if (_repository == null) return;
    await _repository!.saveProgress(state);
  }
}
