// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_rail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NavigationRailController)
final navigationRailControllerProvider = NavigationRailControllerProvider._();

final class NavigationRailControllerProvider
    extends $NotifierProvider<NavigationRailController, RailState> {
  NavigationRailControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigationRailControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigationRailControllerHash();

  @$internal
  @override
  NavigationRailController create() => NavigationRailController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RailState>(value),
    );
  }
}

String _$navigationRailControllerHash() =>
    r'cc2421488d7869983634f72867f293b2d6d6dd79';

abstract class _$NavigationRailController extends $Notifier<RailState> {
  RailState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RailState, RailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RailState, RailState>,
              RailState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
