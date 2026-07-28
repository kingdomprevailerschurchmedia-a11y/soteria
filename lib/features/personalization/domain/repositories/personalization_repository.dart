import '../../../../core/models/result.dart';
import '../entities/learning_profile.dart';

abstract class PersonalizationRepository {
  Future<Result<LearningProfile>> getProfile();
  Future<Result<void>> saveProfile(LearningProfile profile);
}
