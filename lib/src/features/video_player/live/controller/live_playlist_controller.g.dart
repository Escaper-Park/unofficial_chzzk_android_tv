// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_playlist_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$livePlaylistControllerHash() =>
    r'3b2d5c3b65989a66f9f0e74b64b87fcdd7e0f7a5';

/// See also [LivePlaylistController].
@ProviderFor(LivePlaylistController)
final livePlaylistControllerProvider =
    NotifierProvider<LivePlaylistController, List<LiveStream>>.internal(
  LivePlaylistController.new,
  name: r'livePlaylistControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$livePlaylistControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LivePlaylistController = Notifier<List<LiveStream>>;
String _$currentSelectedLiveStreamHash() =>
    r'1336c8b4d1e17ef3ec8d643beb4ca5e7f33bd35f';

/// To controll screen size
///
/// Copied from [CurrentSelectedLiveStream].
@ProviderFor(CurrentSelectedLiveStream)
final currentSelectedLiveStreamProvider =
    AutoDisposeNotifierProvider<CurrentSelectedLiveStream, int?>.internal(
  CurrentSelectedLiveStream.new,
  name: r'currentSelectedLiveStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSelectedLiveStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentSelectedLiveStream = AutoDisposeNotifier<int?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
