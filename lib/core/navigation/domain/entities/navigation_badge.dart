import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_badge.freezed.dart';

@freezed
abstract class NavigationBadge with _$NavigationBadge {
  const factory NavigationBadge({
    @Default(0) int count,
    @Default(false) bool showDot,
    @Default(true) bool visible,
  }) = _NavigationBadge;

  const NavigationBadge._();

  bool get hasContent => count > 0 || showDot;
}
