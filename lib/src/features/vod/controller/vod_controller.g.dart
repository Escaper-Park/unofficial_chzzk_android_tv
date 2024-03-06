// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelVodTotalPagesHash() =>
    r'b24d46c85b3c79b2232e7dc2945b51134097a326';

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

/// See also [channelVodTotalPages].
@ProviderFor(channelVodTotalPages)
const channelVodTotalPagesProvider = ChannelVodTotalPagesFamily();

/// See also [channelVodTotalPages].
class ChannelVodTotalPagesFamily extends Family<AsyncValue<int?>> {
  /// See also [channelVodTotalPages].
  const ChannelVodTotalPagesFamily();

  /// See also [channelVodTotalPages].
  ChannelVodTotalPagesProvider call({
    required String channelId,
  }) {
    return ChannelVodTotalPagesProvider(
      channelId: channelId,
    );
  }

  @override
  ChannelVodTotalPagesProvider getProviderOverride(
    covariant ChannelVodTotalPagesProvider provider,
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
  String? get name => r'channelVodTotalPagesProvider';
}

/// See also [channelVodTotalPages].
class ChannelVodTotalPagesProvider extends AutoDisposeFutureProvider<int?> {
  /// See also [channelVodTotalPages].
  ChannelVodTotalPagesProvider({
    required String channelId,
  }) : this._internal(
          (ref) => channelVodTotalPages(
            ref as ChannelVodTotalPagesRef,
            channelId: channelId,
          ),
          from: channelVodTotalPagesProvider,
          name: r'channelVodTotalPagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$channelVodTotalPagesHash,
          dependencies: ChannelVodTotalPagesFamily._dependencies,
          allTransitiveDependencies:
              ChannelVodTotalPagesFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  ChannelVodTotalPagesProvider._internal(
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
  Override overrideWith(
    FutureOr<int?> Function(ChannelVodTotalPagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChannelVodTotalPagesProvider._internal(
        (ref) => create(ref as ChannelVodTotalPagesRef),
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
  AutoDisposeFutureProviderElement<int?> createElement() {
    return _ChannelVodTotalPagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelVodTotalPagesProvider &&
        other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChannelVodTotalPagesRef on AutoDisposeFutureProviderRef<int?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _ChannelVodTotalPagesProviderElement
    extends AutoDisposeFutureProviderElement<int?>
    with ChannelVodTotalPagesRef {
  _ChannelVodTotalPagesProviderElement(super.provider);

  @override
  String get channelId => (origin as ChannelVodTotalPagesProvider).channelId;
}

String _$vodControllerHash() => r'0440e5fee6b66d3fb09059ae99c2383598c106ae';

abstract class _$VodController
    extends BuildlessAutoDisposeAsyncNotifier<List<Vod>?> {
  late final String channelId;

  FutureOr<List<Vod>?> build({
    required String channelId,
  });
}

/// See also [VodController].
@ProviderFor(VodController)
const vodControllerProvider = VodControllerFamily();

/// See also [VodController].
class VodControllerFamily extends Family<AsyncValue<List<Vod>?>> {
  /// See also [VodController].
  const VodControllerFamily();

  /// See also [VodController].
  VodControllerProvider call({
    required String channelId,
  }) {
    return VodControllerProvider(
      channelId: channelId,
    );
  }

  @override
  VodControllerProvider getProviderOverride(
    covariant VodControllerProvider provider,
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
  String? get name => r'vodControllerProvider';
}

/// See also [VodController].
class VodControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<VodController, List<Vod>?> {
  /// See also [VodController].
  VodControllerProvider({
    required String channelId,
  }) : this._internal(
          () => VodController()..channelId = channelId,
          from: vodControllerProvider,
          name: r'vodControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vodControllerHash,
          dependencies: VodControllerFamily._dependencies,
          allTransitiveDependencies:
              VodControllerFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  VodControllerProvider._internal(
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
  FutureOr<List<Vod>?> runNotifierBuild(
    covariant VodController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
    );
  }

  @override
  Override overrideWith(VodController Function() create) {
    return ProviderOverride(
      origin: this,
      override: VodControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<VodController, List<Vod>?>
      createElement() {
    return _VodControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VodControllerProvider && other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VodControllerRef on AutoDisposeAsyncNotifierProviderRef<List<Vod>?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _VodControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<VodController, List<Vod>?>
    with VodControllerRef {
  _VodControllerProviderElement(super.provider);

  @override
  String get channelId => (origin as VodControllerProvider).channelId;
}

String _$vodSortTypeControllerHash() =>
    r'82c2fc88a2817d45baeaeacd3d5b91761c48ba68';

/// See also [VodSortTypeController].
@ProviderFor(VodSortTypeController)
final vodSortTypeControllerProvider =
    AutoDisposeNotifierProvider<VodSortTypeController, VodSortType>.internal(
  VodSortTypeController.new,
  name: r'vodSortTypeControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vodSortTypeControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VodSortTypeController = AutoDisposeNotifier<VodSortType>;
String _$currentVodPageIndexHash() =>
    r'0cdf32b6aefab5c84c989f67602a57b9fe4c24e4';

/// See also [CurrentVodPageIndex].
@ProviderFor(CurrentVodPageIndex)
final currentVodPageIndexProvider =
    AutoDisposeNotifierProvider<CurrentVodPageIndex, int>.internal(
  CurrentVodPageIndex.new,
  name: r'currentVodPageIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentVodPageIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentVodPageIndex = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
