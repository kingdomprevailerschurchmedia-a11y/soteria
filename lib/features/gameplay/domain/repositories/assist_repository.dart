import '../entities/assist_type.dart';
import '../entities/assist_usage.dart';

abstract class AssistRepository {
  /// Validates if an assist can be used for the given question.
  Future<bool> validateAssist(String sessionId, String questionId, AssistType type);

  /// Consumes the assist and returns the result/metadata (e.g., removed options).
  Future<AssistUsage> useAssist(String sessionId, String questionId, AssistType type);

  /// Fetches community insight statistics for a question.
  Future<CommunityInsightResult> getCommunityInsight(String questionId);

  /// Resets assists for a new session.
  Future<List<AssistUsage>> resetAssists(String sessionId);
}
