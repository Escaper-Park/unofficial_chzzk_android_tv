// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_playlist_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$livePlaylistControllerHash() =>
    r'c5e7311b4914cc840237286e399518538bdca7c6';

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
String _$currentActivatedLiveIndexHash() =>
    r'ebeaa5afe7a94ac8d72ef6dd4a550c7b3bab8382';

/// See also [CurrentActivatedLiveIndex].
@ProviderFor(CurrentActivatedLiveIndex)
final currentActivatedLiveIndexProvider =
    AutoDisposeNotifierProvider<CurrentActivatedLiveIndex, int?>.internal(
  CurrentActivatedLiveIndex.new,
  name: r'currentActivatedLiveIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentActivatedLiveIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentActivatedLiveIndex = AutoDisposeNotifier<int?>;
String _$currentActivatedAudioSourceIndexHash() =>
    r'e2c9acc823d8c8a44a5bafc2a8126a795a0ff2d1';

/// See also [CurrentActivatedAudioSourceIndex].
@ProviderFor(CurrentActivatedAudioSourceIndex)
final currentActivatedAudioSourceIndexProvider =
    AutoDisposeNotifierProvider<CurrentActivatedAudioSourceIndex, int>.internal(
  CurrentActivatedAudioSourceIndex.new,
  name: r'currentActivatedAudioSourceIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentActivatedAudioSourceIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentActivatedAudioSourceIndex = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
