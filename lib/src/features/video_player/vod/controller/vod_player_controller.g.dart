// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_player_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vodPlayerControllerHash() =>
    r'8d127d31ed6ee83da290ec5030bf0597b0b263bf';

/// See also [VodPlayerController].
@ProviderFor(VodPlayerController)
final vodPlayerControllerProvider =
    AutoDisposeNotifierProvider<VodPlayerController, VodOverlayType>.internal(
  VodPlayerController.new,
  name: r'vodPlayerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vodPlayerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VodPlayerController = AutoDisposeNotifier<VodOverlayType>;
String _$vodPlayerOverlayTimerHash() =>
    r'55e7349d5384267a0da20b9cdf80caae36741df5';

/// Set this true to ensure that the existing state is maintained wherever this timer is called.
///
/// Copied from [VodPlayerOverlayTimer].
@ProviderFor(VodPlayerOverlayTimer)
final vodPlayerOverlayTimerProvider =
    NotifierProvider<VodPlayerOverlayTimer, Timer?>.internal(
  VodPlayerOverlayTimer.new,
  name: r'vodPlayerOverlayTimerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vodPlayerOverlayTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VodPlayerOverlayTimer = Notifier<Timer?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
