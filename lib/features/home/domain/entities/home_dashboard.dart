import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_stats.dart';
import 'tournament.dart';

part 'home_dashboard.freezed.dart';
part 'home_dashboard.g.dart';

@freezed
abstract class HomeDashboard with _$HomeDashboard {
  const factory HomeDashboard({
    required UserStats stats,
    required List<Tournament> activeTournaments,
    required String welcomeMessage,
  }) = _HomeDashboard;

  factory HomeDashboard.fromJson(Map<String, dynamic> json) =>
      _$HomeDashboardFromJson(json);
}
