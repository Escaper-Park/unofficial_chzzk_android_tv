// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_playlist_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$livePlaylistControllerHash() =>
    r'9d9323ba456ba55781dbbdf3042d0a61421bb20e';

/// See also [LivePlaylistController].
@ProviderFor(LivePlaylistController)
final livePlaylistControllerProvider =
    NotifierProvider<LivePlaylistController, List<LiveDetail>>.internal(
  LivePlaylistController.new,
  name: r'livePlaylistControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$livePlaylistControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LivePlaylistController = Notifier<List<LiveDetail>>;
String _$currentActivatedLiveControllerHash() =>
    r'39673707f2e18f4f8bcf88fbc3a5788a87b9556e';

/// See also [CurrentActivatedLiveController].
@ProviderFor(CurrentActivatedLiveController)
final currentActivatedLiveControllerProvider =
    AutoDisposeNotifierProvider<CurrentActivatedLiveController, int?>.internal(
  CurrentActivatedLiveController.new,
  name: r'currentActivatedLiveControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentActivatedLiveControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentActivatedLiveController = AutoDisposeNotifier<int?>;
String _$currentActivatedAudioControllerHash() =>
    r'89e15a56535a05e11c3f49c6036c3fee7b724ac3';

/// See also [CurrentActivatedAudioController].
@ProviderFor(CurrentActivatedAudioController)
final currentActivatedAudioControllerProvider =
    AutoDisposeNotifierProvider<CurrentActivatedAudioController, int>.internal(
  CurrentActivatedAudioController.new,
  name: r'currentActivatedAudioControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentActivatedAudioControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentActivatedAudioController = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
