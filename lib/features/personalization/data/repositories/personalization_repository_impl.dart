import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/models/result.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/learning_profile.dart';
import '../../domain/repositories/personalization_repository.dart';

class PersonalizationRepositoryImpl implements PersonalizationRepository {
  PersonalizationRepositoryImpl(this._prefs);
  final SharedPreferences _prefs;

  static const _key = 'soteria_learning_profile';

  @override
  Future<Result<LearningProfile>> getProfile() async {
    try {
      final data = _prefs.getString(_key);
      if (data == null) {
        return const Success(LearningProfile());
      }
      return Success(LearningProfile.fromJson(jsonDecode(data) as Map<String, dynamic>));
    } catch (e) {
      return Error(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> saveProfile(LearningProfile profile) async {
    try {
      await _prefs.setString(_key, jsonEncode(profile.toJson()));
      return const Success(null);
    } catch (e) {
      return Error(UnknownFailure(e.toString()));
    }
  }
}
