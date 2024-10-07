// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_player_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vodPlayerControllerHash() =>
    r'2b0254f68f7b91fe6d513185b3a1d5cd3d592ed5';

/// See also [VodPlayerController].
@ProviderFor(VodPlayerController)
final vodPlayerControllerProvider = AutoDisposeAsyncNotifierProvider<
    VodPlayerController, Raw<VideoPlayerController?>>.internal(
  VodPlayerController.new,
  name: r'vodPlayerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vodPlayerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VodPlayerController
    = AutoDisposeAsyncNotifier<Raw<VideoPlayerController?>>;
String _$vodSeekIndicatorHash() => r'38fe1341c3221ee69737b22bbb48e95157c7070e';

/// See also [VodSeekIndicator].
@ProviderFor(VodSeekIndicator)
final vodSeekIndicatorProvider =
    AutoDisposeNotifierProvider<VodSeekIndicator, bool>.internal(
  VodSeekIndicator.new,
  name: r'vodSeekIndicatorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vodSeekIndicatorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VodSeekIndicator = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
