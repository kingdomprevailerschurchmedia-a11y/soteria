import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bar_state.freezed.dart';

@freezed
abstract class AppBarState with _$AppBarState {
  const factory AppBarState({
    @Default('') String title,
    @Default('') String subtitle,
    @Default(false) bool isSearchExpanded,
    @Default(false) bool isLoading,
    @Default(0) int notificationCount,
    @Default(0) int coinCount,
    @Default(0) int xpCount,
    @Default(1) int level,
  }) = _AppBarState;
}
