// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoControllerHash() => r'890f1f140e2d0f2bc1abdcef70a73b6d6044f09c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$VideoController
    extends BuildlessAutoDisposeAsyncNotifier<List<Video>?> {
  late final String channelId;

  FutureOr<List<Video>?> build({
    required String channelId,
  });
}

/// See also [VideoController].
@ProviderFor(VideoController)
const videoControllerProvider = VideoControllerFamily();

/// See also [VideoController].
class VideoControllerFamily extends Family<AsyncValue<List<Video>?>> {
  /// See also [VideoController].
  const VideoControllerFamily();

  /// See also [VideoController].
  VideoControllerProvider call({
    required String channelId,
  }) {
    return VideoControllerProvider(
      channelId: channelId,
    );
  }

  @override
  VideoControllerProvider getProviderOverride(
    covariant VideoControllerProvider provider,
  ) {
    return call(
      channelId: provider.channelId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'videoControllerProvider';
}

/// See also [VideoController].
class VideoControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    VideoController, List<Video>?> {
  /// See also [VideoController].
  VideoControllerProvider({
    required String channelId,
  }) : this._internal(
          () => VideoController()..channelId = channelId,
          from: videoControllerProvider,
          name: r'videoControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$videoControllerHash,
          dependencies: VideoControllerFamily._dependencies,
          allTransitiveDependencies:
              VideoControllerFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  VideoControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.channelId,
  }) : super.internal();

  final String channelId;

  @override
  FutureOr<List<Video>?> runNotifierBuild(
    covariant VideoController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
    );
  }

  @override
  Override overrideWith(VideoController Function() create) {
    return ProviderOverride(
      origin: this,
      override: VideoControllerProvider._internal(
        () => create()..channelId = channelId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        channelId: channelId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<VideoController, List<Video>?>
      createElement() {
    return _VideoControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoControllerProvider && other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VideoControllerRef on AutoDisposeAsyncNotifierProviderRef<List<Video>?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _VideoControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<VideoController,
        List<Video>?> with VideoControllerRef {
  _VideoControllerProviderElement(super.provider);

  @override
  String get channelId => (origin as VideoControllerProvider).channelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
