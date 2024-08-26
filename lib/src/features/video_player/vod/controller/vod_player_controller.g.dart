// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_player_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vodOverlayControllerHash() =>
    r'1ef99c17df024c145705c5ed914c51722bff053b';

/// See also [VodOverlayController].
@ProviderFor(VodOverlayController)
final vodOverlayControllerProvider =
    AutoDisposeNotifierProvider<VodOverlayController, VodOverlayType>.internal(
  VodOverlayController.new,
  name: r'vodOverlayControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vodOverlayControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VodOverlayController = AutoDisposeNotifier<VodOverlayType>;
String _$vodPlayerControllerHash() =>
    r'bcd8601219eccd503e237080c6544335247317dc';

/// See also [VodPlayerController].
@ProviderFor(VodPlayerController)
final vodPlayerControllerProvider =
    AutoDisposeNotifierProvider<VodPlayerController, void>.internal(
  VodPlayerController.new,
  name: r'vodPlayerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vodPlayerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VodPlayerController = AutoDisposeNotifier<void>;
String _$vodPlayerOverlayTimerHash() =>
    r'9d35118a925b3d42aae30f5fd73a1d96d128bc44';

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
