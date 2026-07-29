import '../../../../core/models/result.dart';
import '../entities/guest_progress.dart';

/// GuestRepository defines the contract for managing guest user data locally.
abstract class GuestRepository {
  /// Fetches the current local guest progress.
  Future<Result<GuestProgress>> getProgress();

  /// Saves the current local guest progress.
  Future<Result<void>> saveProgress(GuestProgress progress);

  /// Resets all guest progress data.
  Future<Result<void>> resetProgress();
}
