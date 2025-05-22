// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_overlay_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$liveOverlayControllerHash() =>
    r'09bb8858f1f0c0a82a2e6da3c7c7a4f7c20c72b2';

/// See also [LiveOverlayController].
@ProviderFor(LiveOverlayController)
final liveOverlayControllerProvider = AutoDisposeNotifierProvider<
    LiveOverlayController, LiveStreamOverlayType>.internal(
  LiveOverlayController.new,
  name: r'liveOverlayControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveOverlayControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LiveOverlayController = AutoDisposeNotifier<LiveStreamOverlayType>;
String _$liveOverlayTimerHash() => r'df40cfabf03ea5ff95d3ca49d26b718f962b0353';

/// See also [LiveOverlayTimer].
@ProviderFor(LiveOverlayTimer)
final liveOverlayTimerProvider =
    NotifierProvider<LiveOverlayTimer, Timer?>.internal(
  LiveOverlayTimer.new,
  name: r'liveOverlayTimerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveOverlayTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LiveOverlayTimer = Notifier<Timer?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
