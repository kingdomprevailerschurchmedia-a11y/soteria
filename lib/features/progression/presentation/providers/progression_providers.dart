import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/progression_repository.dart';
import '../../data/repositories/mock_progression_repository.dart';
import '../../../../core/services/startup_service.dart';

part 'progression_providers.g.dart';

@riverpod
ProgressionRepository progressionRepository(ProgressionRepositoryRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return MockProgressionRepository(prefs);
}
