import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_rail_controller.g.dart';

enum RailState { collapsed, compact, extended }

@Riverpod(keepAlive: true)
class NavigationRailController extends _$NavigationRailController {
  @override
  RailState build() => RailState.compact;

  void setExpanded(bool expanded) {
    state = expanded ? RailState.extended : RailState.compact;
  }
}
