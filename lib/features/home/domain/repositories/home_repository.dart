import '../../../../core/models/result.dart';
import '../entities/home_dashboard.dart';

/// Repository interface for the Home Dashboard feature.
abstract class HomeRepository {
  /// Fetches the initial dashboard data including stats and active tournaments.
  Future<Result<HomeDashboard>> getDashboardData();
  
  /// Refreshes the current dashboard data.
  Future<Result<HomeDashboard>> refreshDashboard();
}
