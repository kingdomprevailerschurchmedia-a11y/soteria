import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/models/result.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/guest_progress.dart';
import '../../domain/repositories/guest_repository.dart';

class GuestRepositoryImpl implements GuestRepository {
  GuestRepositoryImpl(this._prefs);
  final SharedPreferences _prefs;

  static const String _key = 'soteria_guest_progress';

  @override
  Future<Result<GuestProgress>> getProgress() async {
    try {
      final jsonString = _prefs.getString(_key);
      if (jsonString == null) {
        return const Success(GuestProgress());
      }
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return Success(GuestProgress.fromJson(json));
    } catch (e) {
      return Error(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> saveProgress(GuestProgress progress) async {
    try {
      final jsonString = jsonEncode(progress.toJson());
      await _prefs.setString(_key, jsonString);
      return const Success(null);
    } catch (e) {
      return Error(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> resetProgress() async {
    try {
      await _prefs.remove(_key);
      return const Success(null);
    } catch (e) {
      return Error(UnknownFailure(e.toString()));
    }
  }
}
