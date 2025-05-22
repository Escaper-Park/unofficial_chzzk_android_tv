// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_clip_all_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelClipAllControllerHash() =>
    r'6028d0537b469880f7f579dd80d8f2198fe01808';

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

abstract class _$ChannelClipAllController
    extends BuildlessAutoDisposeAsyncNotifier<List<NaverClip>?> {
  late final String channelId;
  late final FilterType filterType;
  late final ClipOrderType orderType;

  FutureOr<List<NaverClip>?> build({
    required String channelId,
    required FilterType filterType,
    required ClipOrderType orderType,
  });
}

/// See also [ChannelClipAllController].
@ProviderFor(ChannelClipAllController)
const channelClipAllControllerProvider = ChannelClipAllControllerFamily();

/// See also [ChannelClipAllController].
class ChannelClipAllControllerFamily
    extends Family<AsyncValue<List<NaverClip>?>> {
  /// See also [ChannelClipAllController].
  const ChannelClipAllControllerFamily();

  /// See also [ChannelClipAllController].
  ChannelClipAllControllerProvider call({
    required String channelId,
    required FilterType filterType,
    required ClipOrderType orderType,
  }) {
    return ChannelClipAllControllerProvider(
      channelId: channelId,
      filterType: filterType,
      orderType: orderType,
    );
  }

  @override
  ChannelClipAllControllerProvider getProviderOverride(
    covariant ChannelClipAllControllerProvider provider,
  ) {
    return call(
      channelId: provider.channelId,
      filterType: provider.filterType,
      orderType: provider.orderType,
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
  String? get name => r'channelClipAllControllerProvider';
}

/// See also [ChannelClipAllController].
class ChannelClipAllControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChannelClipAllController,
        List<NaverClip>?> {
  /// See also [ChannelClipAllController].
  ChannelClipAllControllerProvider({
    required String channelId,
    required FilterType filterType,
    required ClipOrderType orderType,
  }) : this._internal(
          () => ChannelClipAllController()
            ..channelId = channelId
            ..filterType = filterType
            ..orderType = orderType,
          from: channelClipAllControllerProvider,
          name: r'channelClipAllControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$channelClipAllControllerHash,
          dependencies: ChannelClipAllControllerFamily._dependencies,
          allTransitiveDependencies:
              ChannelClipAllControllerFamily._allTransitiveDependencies,
          channelId: channelId,
          filterType: filterType,
          orderType: orderType,
        );

  ChannelClipAllControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.channelId,
    required this.filterType,
    required this.orderType,
  }) : super.internal();

  final String channelId;
  final FilterType filterType;
  final ClipOrderType orderType;

  @override
  FutureOr<List<NaverClip>?> runNotifierBuild(
    covariant ChannelClipAllController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
      filterType: filterType,
      orderType: orderType,
    );
  }

  @override
  Override overrideWith(ChannelClipAllController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChannelClipAllControllerProvider._internal(
        () => create()
          ..channelId = channelId
          ..filterType = filterType
          ..orderType = orderType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        channelId: channelId,
        filterType: filterType,
        orderType: orderType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChannelClipAllController,
      List<NaverClip>?> createElement() {
    return _ChannelClipAllControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelClipAllControllerProvider &&
        other.channelId == channelId &&
        other.filterType == filterType &&
        other.orderType == orderType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);
    hash = _SystemHash.combine(hash, filterType.hashCode);
    hash = _SystemHash.combine(hash, orderType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChannelClipAllControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<NaverClip>?> {
  /// The parameter `channelId` of this provider.
  String get channelId;

  /// The parameter `filterType` of this provider.
  FilterType get filterType;

  /// The parameter `orderType` of this provider.
  ClipOrderType get orderType;
}

class _ChannelClipAllControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChannelClipAllController,
        List<NaverClip>?> with ChannelClipAllControllerRef {
  _ChannelClipAllControllerProviderElement(super.provider);

  @override
  String get channelId =>
      (origin as ChannelClipAllControllerProvider).channelId;
  @override
  FilterType get filterType =>
      (origin as ChannelClipAllControllerProvider).filterType;
  @override
  ClipOrderType get orderType =>
      (origin as ChannelClipAllControllerProvider).orderType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
