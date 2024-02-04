// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_video_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoControlsTimerHash() =>
    r'b7a23502eec484b4be6d72a48f3605e7071dd7c4';

/// See also [VideoControlsTimer].
@ProviderFor(VideoControlsTimer)
final videoControlsTimerProvider =
    NotifierProvider<VideoControlsTimer, Timer?>.internal(
  VideoControlsTimer.new,
  name: r'videoControlsTimerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$videoControlsTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VideoControlsTimer = Notifier<Timer?>;
String _$pauseTimerHash() => r'bf6c7b051796c00da131d103ea8d09a324cc1c35';

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
String _$showControlsHash() => r'989edf339c6ace4bfbfa9d0185148c1fb2328f33';

/// See also [ShowControls].
@ProviderFor(ShowControls)
final showControlsProvider =
    AutoDisposeNotifierProvider<ShowControls, bool>.internal(
  ShowControls.new,
  name: r'showControlsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showControlsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowControls = AutoDisposeNotifier<bool>;
String _$showChatControlsHash() => r'addbaa3cebf890044e638e1965f32c7f314f61a1';

/// See also [ShowChatControls].
@ProviderFor(ShowChatControls)
final showChatControlsProvider =
    AutoDisposeNotifierProvider<ShowChatControls, bool>.internal(
  ShowChatControls.new,
  name: r'showChatControlsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showChatControlsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowChatControls = AutoDisposeNotifier<bool>;
String _$singleViewScreenControllerHash() =>
    r'59d9a8498839304fd0aee1f12758a34c17afd151';

/// See also [SingleViewScreenController].
@ProviderFor(SingleViewScreenController)
final singleViewScreenControllerProvider = AutoDisposeNotifierProvider<
    SingleViewScreenController, SingleViewScreenMode>.internal(
  SingleViewScreenController.new,
  name: r'singleViewScreenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$singleViewScreenControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SingleViewScreenController
    = AutoDisposeNotifier<SingleViewScreenMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
