import '../../../../core/models/result.dart';
import '../../domain/entities/home_dashboard.dart';
import '../../domain/entities/user_stats.dart';
import '../../domain/entities/tournament.dart';
import '../../domain/repositories/home_repository.dart';

class MockHomeRepository implements HomeRepository {
  @override
  Future<Result<HomeDashboard>> getDashboardData() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    return const Success(HomeDashboard(
      welcomeMessage: 'Master the Arena, Scholar',
      stats: UserStats(
        level: 12,
        xpProgress: 0.65,
        coins: 1250,
        streakDays: 7,
        lives: 3,
        rank: 'Elite Knight',
      ),
      activeTournaments: [
        Tournament(
          id: '1',
          title: 'Summer Championship',
          prizePool: '₦100,000',
          timeLeft: '2D 14H',
          entryFee: '50 Coins',
          category: 'General Knowledge',
        ),
        Tournament(
          id: '2',
          title: 'Law Faculty Duel',
          prizePool: '₦25,000',
          timeLeft: '4H 30M',
          entryFee: '10 Coins',
          category: 'Legal Studies',
        ),
      ],
    ));
  }

  @override
  Future<Result<HomeDashboard>> refreshDashboard() => getDashboardData();
}
