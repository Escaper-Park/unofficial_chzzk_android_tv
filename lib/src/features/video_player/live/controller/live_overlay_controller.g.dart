// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_overlay_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$liveOverlayControllerHash() =>
    r'eb9527c93acef7dd30b24d38120dafd594220939';

/// See also [LiveOverlayController].
@ProviderFor(LiveOverlayController)
final liveOverlayControllerProvider = AutoDisposeNotifierProvider<
    LiveOverlayController, LiveOverlayType>.internal(
  LiveOverlayController.new,
  name: r'liveOverlayControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveOverlayControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LiveOverlayController = AutoDisposeNotifier<LiveOverlayType>;
String _$livePlayerOverlayTimerHash() =>
    r'fc60fe28900692c223d9b13288a2e18ed6898ce2';

/// Set this true to ensure that the existing state is maintained wherever this timer is called.
///
/// Copied from [LivePlayerOverlayTimer].
@ProviderFor(LivePlayerOverlayTimer)
final livePlayerOverlayTimerProvider =
    NotifierProvider<LivePlayerOverlayTimer, Timer?>.internal(
  LivePlayerOverlayTimer.new,
  name: r'livePlayerOverlayTimerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$livePlayerOverlayTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LivePlayerOverlayTimer = Notifier<Timer?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
