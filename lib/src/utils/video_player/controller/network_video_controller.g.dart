// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_video_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$overlayControllerHash() => r'94476b2a0994fd91b2f20cac6767b0c594314b7b';

/// See also [OverlayController].
@ProviderFor(OverlayController)
final overlayControllerProvider =
    AutoDisposeNotifierProvider<OverlayController, OverlayType>.internal(
  OverlayController.new,
  name: r'overlayControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$overlayControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OverlayController = AutoDisposeNotifier<OverlayType>;
String _$controlOverlayTimerHash() =>
    r'79b65fb50962dad52aa8ea22a913e505a774ee9b';

/// See also [ControlOverlayTimer].
@ProviderFor(ControlOverlayTimer)
final controlOverlayTimerProvider =
    NotifierProvider<ControlOverlayTimer, Timer?>.internal(
  ControlOverlayTimer.new,
  name: r'controlOverlayTimerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$controlOverlayTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ControlOverlayTimer = Notifier<Timer?>;
String _$pauseTimerHash() => r'543bb937b691a6b63eaf056edf74eab9def4e484';

/// See also [PauseTimer].
@ProviderFor(PauseTimer)
final pauseTimerProvider = NotifierProvider<PauseTimer, Timer?>.internal(
  PauseTimer.new,
  name: r'pauseTimerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pauseTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PauseTimer = Notifier<Timer?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
