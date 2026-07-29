import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/navigation_badge.dart';

part 'navigation_controller.freezed.dart';
part 'navigation_controller.g.dart';

@freezed
abstract class NavigationState with _$NavigationState {
  const factory NavigationState({
    @Default(0) int currentIndex,
    @Default({}) Map<String, NavigationBadge> badges,
  }) = _NavigationState;
}

@Riverpod(keepAlive: true)
class NavigationController extends _$NavigationController {
  @override
  NavigationState build() {
    return const NavigationState(
      badges: {
        'compete': NavigationBadge(showDot: true),
        'profile': NavigationBadge(count: 3),
      },
    );
  }

  void setIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void updateBadge(String destinationId, NavigationBadge badge) {
    final newBadges = Map<String, NavigationBadge>.from(state.badges);
    newBadges[destinationId] = badge;
    state = state.copyWith(badges: newBadges);
  }

  void clearBadge(String destinationId) {
    final newBadges = Map<String, NavigationBadge>.from(state.badges);
    newBadges[destinationId] = const NavigationBadge(visible: false);
    state = state.copyWith(badges: newBadges);
  }
}
