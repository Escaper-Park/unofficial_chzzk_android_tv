// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_player_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vodPlayerControllerHash() =>
    r'843731cf5dbec648557961c63fcfab133f003301';

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
    r'263658ab535bf4c0cd3a9a253cff86e3107b859e';

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
