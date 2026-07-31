import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/question_repository.dart';
import '../../domain/repositories/assist_repository.dart';
import '../../domain/repositories/game_session_repository.dart';
import '../../domain/repositories/selection_repository.dart';
import '../../domain/repositories/fair_play_repository.dart';
import '../../domain/use_cases/use_assist_use_case.dart';
import '../../data/repositories/mock_question_repository.dart';
import '../../data/repositories/mock_assist_repository.dart';
import '../../data/repositories/mock_game_session_repository.dart';
import '../../data/repositories/mock_selection_repository.dart';
import '../../data/repositories/mock_fair_play_repository.dart';
import '../../../../core/services/startup_service.dart';
import '../../../../core/logging/logger.dart';

part 'gameplay_providers.g.dart';

@riverpod
QuestionRepository questionRepository(QuestionRepositoryRef ref) {
  return MockQuestionRepository();
}

@riverpod
AssistRepository assistRepository(AssistRepositoryRef ref) {
  final questionRepo = ref.watch(questionRepositoryProvider);
  return MockAssistRepository(questionRepo);
}

@riverpod
GameSessionRepository gameSessionRepository(GameSessionRepositoryRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return MockGameSessionRepository(prefs, SoteriaLogger());
}

@riverpod
SelectionRepository selectionRepository(SelectionRepositoryRef ref) {
  final questionRepo = ref.watch(questionRepositoryProvider);
  return MockSelectionRepository(questionRepo);
}

@riverpod
FairPlayRepository fairPlayRepository(FairPlayRepositoryRef ref) {
  final questionRepo = ref.watch(questionRepositoryProvider);
  return MockFairPlayRepository(questionRepo);
}

@riverpod
UseAssistUseCase useAssistUseCase(UseAssistUseCaseRef ref) {
  final repository = ref.watch(assistRepositoryProvider);
  return UseAssistUseCase(repository);
}
