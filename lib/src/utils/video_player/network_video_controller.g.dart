// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_video_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoControlsTimerHash() =>
    r'74decd0b4f214a4eefa46fdcaab8bece0052b818';

/// See also [VideoControlsTimer].
@ProviderFor(VideoControlsTimer)
final videoControlsTimerProvider =
    AutoDisposeNotifierProvider<VideoControlsTimer, Timer?>.internal(
  VideoControlsTimer.new,
  name: r'videoControlsTimerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$videoControlsTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VideoControlsTimer = AutoDisposeNotifier<Timer?>;
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
String _$showChatHash() => r'adbb75ab67426eeb99866508a644b4227e6d2b29';

/// See also [ShowChat].
@ProviderFor(ShowChat)
final showChatProvider = AutoDisposeNotifierProvider<ShowChat, bool>.internal(
  ShowChat.new,
  name: r'showChatProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showChatHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowChat = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
