import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'app_bar_state.dart';

part 'app_bar_controller.g.dart';

@Riverpod(keepAlive: true)
class AppBarController extends _$AppBarController {
  @override
  AppBarState build() {
    return const AppBarState();
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setSubtitle(String subtitle) {
    state = state.copyWith(subtitle: subtitle);
  }

  void toggleSearch() {
    state = state.copyWith(isSearchExpanded: !state.isSearchExpanded);
  }

  void setSearchExpanded(bool expanded) {
    state = state.copyWith(isSearchExpanded: expanded);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void updateStats({int? coins, int? xp, int? level}) {
    state = state.copyWith(
      coinCount: coins ?? state.coinCount,
      xpCount: xp ?? state.xpCount,
      level: level ?? state.level,
    );
  }

  void setNotificationCount(int count) {
    state = state.copyWith(notificationCount: count);
  }

  void reset() {
    state = const AppBarState();
  }
}
