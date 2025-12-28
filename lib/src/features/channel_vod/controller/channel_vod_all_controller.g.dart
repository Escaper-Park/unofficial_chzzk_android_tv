// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_vod_all_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelVodAllControllerHash() =>
    r'42f38f0bae77696f376896b7bb2ec44b6cf7adaa';

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

abstract class _$ChannelVodAllController
    extends BuildlessAutoDisposeAsyncNotifier<List<Vod>?> {
  late final String channelId;
  late final VideoSortType sortType;

  FutureOr<List<Vod>?> build({
    required String channelId,
    required VideoSortType sortType,
  });
}

/// See also [ChannelVodAllController].
@ProviderFor(ChannelVodAllController)
const channelVodAllControllerProvider = ChannelVodAllControllerFamily();

/// See also [ChannelVodAllController].
class ChannelVodAllControllerFamily extends Family<AsyncValue<List<Vod>?>> {
  /// See also [ChannelVodAllController].
  const ChannelVodAllControllerFamily();

  /// See also [ChannelVodAllController].
  ChannelVodAllControllerProvider call({
    required String channelId,
    required VideoSortType sortType,
  }) {
    return ChannelVodAllControllerProvider(
      channelId: channelId,
      sortType: sortType,
    );
  }

  @override
  ChannelVodAllControllerProvider getProviderOverride(
    covariant ChannelVodAllControllerProvider provider,
  ) {
    return call(
      channelId: provider.channelId,
      sortType: provider.sortType,
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
  String? get name => r'channelVodAllControllerProvider';
}

/// See also [ChannelVodAllController].
class ChannelVodAllControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChannelVodAllController,
        List<Vod>?> {
  /// See also [ChannelVodAllController].
  ChannelVodAllControllerProvider({
    required String channelId,
    required VideoSortType sortType,
  }) : this._internal(
          () => ChannelVodAllController()
            ..channelId = channelId
            ..sortType = sortType,
          from: channelVodAllControllerProvider,
          name: r'channelVodAllControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$channelVodAllControllerHash,
          dependencies: ChannelVodAllControllerFamily._dependencies,
          allTransitiveDependencies:
              ChannelVodAllControllerFamily._allTransitiveDependencies,
          channelId: channelId,
          sortType: sortType,
        );

  ChannelVodAllControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.channelId,
    required this.sortType,
  }) : super.internal();

  final String channelId;
  final VideoSortType sortType;

  @override
  FutureOr<List<Vod>?> runNotifierBuild(
    covariant ChannelVodAllController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
      sortType: sortType,
    );
  }

  @override
  Override overrideWith(ChannelVodAllController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChannelVodAllControllerProvider._internal(
        () => create()
          ..channelId = channelId
          ..sortType = sortType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        channelId: channelId,
        sortType: sortType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChannelVodAllController, List<Vod>?>
      createElement() {
    return _ChannelVodAllControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelVodAllControllerProvider &&
        other.channelId == channelId &&
        other.sortType == sortType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);
    hash = _SystemHash.combine(hash, sortType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChannelVodAllControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Vod>?> {
  /// The parameter `channelId` of this provider.
  String get channelId;

  /// The parameter `sortType` of this provider.
  VideoSortType get sortType;
}

class _ChannelVodAllControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChannelVodAllController,
        List<Vod>?> with ChannelVodAllControllerRef {
  _ChannelVodAllControllerProviderElement(super.provider);

  @override
  String get channelId => (origin as ChannelVodAllControllerProvider).channelId;
  @override
  VideoSortType get sortType =>
      (origin as ChannelVodAllControllerProvider).sortType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
