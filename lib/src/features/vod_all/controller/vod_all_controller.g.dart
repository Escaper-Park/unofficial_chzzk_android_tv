// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_all_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vodAllControllerHash() => r'e3b8962baeff5c22285d760a0c3b63ea7ab56418';

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

abstract class _$VodAllController
    extends BuildlessAutoDisposeAsyncNotifier<List<Vod>?> {
  late final VideoSortType sortType;

  FutureOr<List<Vod>?> build({
    required VideoSortType sortType,
  });
}

/// See also [VodAllController].
@ProviderFor(VodAllController)
const vodAllControllerProvider = VodAllControllerFamily();

/// See also [VodAllController].
class VodAllControllerFamily extends Family<AsyncValue<List<Vod>?>> {
  /// See also [VodAllController].
  const VodAllControllerFamily();

  /// See also [VodAllController].
  VodAllControllerProvider call({
    required VideoSortType sortType,
  }) {
    return VodAllControllerProvider(
      sortType: sortType,
    );
  }

  @override
  VodAllControllerProvider getProviderOverride(
    covariant VodAllControllerProvider provider,
  ) {
    return call(
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
  String? get name => r'vodAllControllerProvider';
}

/// See also [VodAllController].
class VodAllControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<VodAllController, List<Vod>?> {
  /// See also [VodAllController].
  VodAllControllerProvider({
    required VideoSortType sortType,
  }) : this._internal(
          () => VodAllController()..sortType = sortType,
          from: vodAllControllerProvider,
          name: r'vodAllControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vodAllControllerHash,
          dependencies: VodAllControllerFamily._dependencies,
          allTransitiveDependencies:
              VodAllControllerFamily._allTransitiveDependencies,
          sortType: sortType,
        );

  VodAllControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sortType,
  }) : super.internal();

  final VideoSortType sortType;

  @override
  FutureOr<List<Vod>?> runNotifierBuild(
    covariant VodAllController notifier,
  ) {
    return notifier.build(
      sortType: sortType,
    );
  }

  @override
  Override overrideWith(VodAllController Function() create) {
    return ProviderOverride(
      origin: this,
      override: VodAllControllerProvider._internal(
        () => create()..sortType = sortType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sortType: sortType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<VodAllController, List<Vod>?>
      createElement() {
    return _VodAllControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VodAllControllerProvider && other.sortType == sortType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sortType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VodAllControllerRef on AutoDisposeAsyncNotifierProviderRef<List<Vod>?> {
  /// The parameter `sortType` of this provider.
  VideoSortType get sortType;
}

class _VodAllControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<VodAllController,
        List<Vod>?> with VodAllControllerRef {
  _VodAllControllerProviderElement(super.provider);

  @override
  VideoSortType get sortType => (origin as VodAllControllerProvider).sortType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
