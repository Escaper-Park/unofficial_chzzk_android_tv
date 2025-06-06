// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_stream_navigator_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$liveStreamFollowingLivesControllerHash() =>
    r'ee431bc65269635b651cdc5527579440dae7a3fe';

/// See also [LiveStreamFollowingLivesController].
@ProviderFor(LiveStreamFollowingLivesController)
final liveStreamFollowingLivesControllerProvider =
    AutoDisposeAsyncNotifierProvider<LiveStreamFollowingLivesController,
        List<Following>?>.internal(
  LiveStreamFollowingLivesController.new,
  name: r'liveStreamFollowingLivesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveStreamFollowingLivesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LiveStreamFollowingLivesController
    = AutoDisposeAsyncNotifier<List<Following>?>;
String _$liveStreamCategoryLivesControllerHash() =>
    r'c0ed5c376c9fa58b081a12466f0f323c5de50d22';

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

abstract class _$LiveStreamCategoryLivesController
    extends BuildlessAutoDisposeAsyncNotifier<List<LiveInfo>?> {
  late final String channelId;

  FutureOr<List<LiveInfo>?> build({
    required String channelId,
  });
}

/// See also [LiveStreamCategoryLivesController].
@ProviderFor(LiveStreamCategoryLivesController)
const liveStreamCategoryLivesControllerProvider =
    LiveStreamCategoryLivesControllerFamily();

/// See also [LiveStreamCategoryLivesController].
class LiveStreamCategoryLivesControllerFamily
    extends Family<AsyncValue<List<LiveInfo>?>> {
  /// See also [LiveStreamCategoryLivesController].
  const LiveStreamCategoryLivesControllerFamily();

  /// See also [LiveStreamCategoryLivesController].
  LiveStreamCategoryLivesControllerProvider call({
    required String channelId,
  }) {
    return LiveStreamCategoryLivesControllerProvider(
      channelId: channelId,
    );
  }

  @override
  LiveStreamCategoryLivesControllerProvider getProviderOverride(
    covariant LiveStreamCategoryLivesControllerProvider provider,
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
  String? get name => r'liveStreamCategoryLivesControllerProvider';
}

/// See also [LiveStreamCategoryLivesController].
class LiveStreamCategoryLivesControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        LiveStreamCategoryLivesController, List<LiveInfo>?> {
  /// See also [LiveStreamCategoryLivesController].
  LiveStreamCategoryLivesControllerProvider({
    required String channelId,
  }) : this._internal(
          () => LiveStreamCategoryLivesController()..channelId = channelId,
          from: liveStreamCategoryLivesControllerProvider,
          name: r'liveStreamCategoryLivesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$liveStreamCategoryLivesControllerHash,
          dependencies: LiveStreamCategoryLivesControllerFamily._dependencies,
          allTransitiveDependencies: LiveStreamCategoryLivesControllerFamily
              ._allTransitiveDependencies,
          channelId: channelId,
        );

  LiveStreamCategoryLivesControllerProvider._internal(
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
  FutureOr<List<LiveInfo>?> runNotifierBuild(
    covariant LiveStreamCategoryLivesController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
    );
  }

  @override
  Override overrideWith(LiveStreamCategoryLivesController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LiveStreamCategoryLivesControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LiveStreamCategoryLivesController,
      List<LiveInfo>?> createElement() {
    return _LiveStreamCategoryLivesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LiveStreamCategoryLivesControllerProvider &&
        other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LiveStreamCategoryLivesControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<LiveInfo>?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _LiveStreamCategoryLivesControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        LiveStreamCategoryLivesController,
        List<LiveInfo>?> with LiveStreamCategoryLivesControllerRef {
  _LiveStreamCategoryLivesControllerProviderElement(super.provider);

  @override
  String get channelId =>
      (origin as LiveStreamCategoryLivesControllerProvider).channelId;
}

String _$liveStreamPopularLivesControllerHash() =>
    r'59460d1d9b92fcaca883fc57cb8ddadd687ea00b';

/// See also [LiveStreamPopularLivesController].
@ProviderFor(LiveStreamPopularLivesController)
final liveStreamPopularLivesControllerProvider =
    AutoDisposeAsyncNotifierProvider<LiveStreamPopularLivesController,
        List<LiveInfo>?>.internal(
  LiveStreamPopularLivesController.new,
  name: r'liveStreamPopularLivesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveStreamPopularLivesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LiveStreamPopularLivesController
    = AutoDisposeAsyncNotifier<List<LiveInfo>?>;
String _$liveStreamGroupLivesControllerHash() =>
    r'3ed05c0c2f07c39ed67d9b63379e661b56d617df';

/// See also [LiveStreamGroupLivesController].
@ProviderFor(LiveStreamGroupLivesController)
final liveStreamGroupLivesControllerProvider = AutoDisposeAsyncNotifierProvider<
    LiveStreamGroupLivesController, List<LiveDetail>?>.internal(
  LiveStreamGroupLivesController.new,
  name: r'liveStreamGroupLivesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveStreamGroupLivesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LiveStreamGroupLivesController
    = AutoDisposeAsyncNotifier<List<LiveDetail>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
