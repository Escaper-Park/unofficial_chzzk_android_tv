// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clip_popular_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clipPopularControllerHash() =>
    r'213696e9d960c426b923ea60a478286d78379c35';

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

abstract class _$ClipPopularController
    extends BuildlessAutoDisposeAsyncNotifier<List<NaverClip>?> {
  late final FilterType filterType;
  late final ClipOrderType orderType;

  FutureOr<List<NaverClip>?> build({
    required FilterType filterType,
    required ClipOrderType orderType,
  });
}

/// See also [ClipPopularController].
@ProviderFor(ClipPopularController)
const clipPopularControllerProvider = ClipPopularControllerFamily();

/// See also [ClipPopularController].
class ClipPopularControllerFamily extends Family<AsyncValue<List<NaverClip>?>> {
  /// See also [ClipPopularController].
  const ClipPopularControllerFamily();

  /// See also [ClipPopularController].
  ClipPopularControllerProvider call({
    required FilterType filterType,
    required ClipOrderType orderType,
  }) {
    return ClipPopularControllerProvider(
      filterType: filterType,
      orderType: orderType,
    );
  }

  @override
  ClipPopularControllerProvider getProviderOverride(
    covariant ClipPopularControllerProvider provider,
  ) {
    return call(
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
  String? get name => r'clipPopularControllerProvider';
}

/// See also [ClipPopularController].
class ClipPopularControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ClipPopularController,
        List<NaverClip>?> {
  /// See also [ClipPopularController].
  ClipPopularControllerProvider({
    required FilterType filterType,
    required ClipOrderType orderType,
  }) : this._internal(
          () => ClipPopularController()
            ..filterType = filterType
            ..orderType = orderType,
          from: clipPopularControllerProvider,
          name: r'clipPopularControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clipPopularControllerHash,
          dependencies: ClipPopularControllerFamily._dependencies,
          allTransitiveDependencies:
              ClipPopularControllerFamily._allTransitiveDependencies,
          filterType: filterType,
          orderType: orderType,
        );

  ClipPopularControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filterType,
    required this.orderType,
  }) : super.internal();

  final FilterType filterType;
  final ClipOrderType orderType;

  @override
  FutureOr<List<NaverClip>?> runNotifierBuild(
    covariant ClipPopularController notifier,
  ) {
    return notifier.build(
      filterType: filterType,
      orderType: orderType,
    );
  }

  @override
  Override overrideWith(ClipPopularController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ClipPopularControllerProvider._internal(
        () => create()
          ..filterType = filterType
          ..orderType = orderType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filterType: filterType,
        orderType: orderType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ClipPopularController,
      List<NaverClip>?> createElement() {
    return _ClipPopularControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClipPopularControllerProvider &&
        other.filterType == filterType &&
        other.orderType == orderType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filterType.hashCode);
    hash = _SystemHash.combine(hash, orderType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ClipPopularControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<NaverClip>?> {
  /// The parameter `filterType` of this provider.
  FilterType get filterType;

  /// The parameter `orderType` of this provider.
  ClipOrderType get orderType;
}

class _ClipPopularControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ClipPopularController,
        List<NaverClip>?> with ClipPopularControllerRef {
  _ClipPopularControllerProviderElement(super.provider);

  @override
  FilterType get filterType =>
      (origin as ClipPopularControllerProvider).filterType;
  @override
  ClipOrderType get orderType =>
      (origin as ClipPopularControllerProvider).orderType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
