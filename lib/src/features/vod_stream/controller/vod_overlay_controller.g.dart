// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_overlay_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vodOverlayControllerHash() =>
    r'08ad7a5269f1532f0f7c5041ec27af3b964d9598';

/// See also [VodOverlayController].
@ProviderFor(VodOverlayController)
final vodOverlayControllerProvider = AutoDisposeNotifierProvider<
    VodOverlayController, VodStreamOverlayType>.internal(
  VodOverlayController.new,
  name: r'vodOverlayControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vodOverlayControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VodOverlayController = AutoDisposeNotifier<VodStreamOverlayType>;
String _$vodOverlayTimerHash() => r'277f84f665f0552a5d366ea981fcbe187afad8aa';

/// See also [VodOverlayTimer].
@ProviderFor(VodOverlayTimer)
final vodOverlayTimerProvider =
    NotifierProvider<VodOverlayTimer, Timer?>.internal(
  VodOverlayTimer.new,
  name: r'vodOverlayTimerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vodOverlayTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VodOverlayTimer = Notifier<Timer?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
