// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_clip_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryClipControllerHash() =>
    r'7adbe70ff1ab4c61fa41c48695fef5d0c8bf2e19';

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

abstract class _$CategoryClipController
    extends BuildlessAutoDisposeAsyncNotifier<List<NaverClip>?> {
  late final Category category;
  late final FilterType filterType;
  late final ClipOrderType orderType;

  FutureOr<List<NaverClip>?> build({
    required Category category,
    required FilterType filterType,
    required ClipOrderType orderType,
  });
}

/// See also [CategoryClipController].
@ProviderFor(CategoryClipController)
const categoryClipControllerProvider = CategoryClipControllerFamily();

/// See also [CategoryClipController].
class CategoryClipControllerFamily
    extends Family<AsyncValue<List<NaverClip>?>> {
  /// See also [CategoryClipController].
  const CategoryClipControllerFamily();

  /// See also [CategoryClipController].
  CategoryClipControllerProvider call({
    required Category category,
    required FilterType filterType,
    required ClipOrderType orderType,
  }) {
    return CategoryClipControllerProvider(
      category: category,
      filterType: filterType,
      orderType: orderType,
    );
  }

  @override
  CategoryClipControllerProvider getProviderOverride(
    covariant CategoryClipControllerProvider provider,
  ) {
    return call(
      category: provider.category,
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
  String? get name => r'categoryClipControllerProvider';
}

/// See also [CategoryClipController].
class CategoryClipControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CategoryClipController,
        List<NaverClip>?> {
  /// See also [CategoryClipController].
  CategoryClipControllerProvider({
    required Category category,
    required FilterType filterType,
    required ClipOrderType orderType,
  }) : this._internal(
          () => CategoryClipController()
            ..category = category
            ..filterType = filterType
            ..orderType = orderType,
          from: categoryClipControllerProvider,
          name: r'categoryClipControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryClipControllerHash,
          dependencies: CategoryClipControllerFamily._dependencies,
          allTransitiveDependencies:
              CategoryClipControllerFamily._allTransitiveDependencies,
          category: category,
          filterType: filterType,
          orderType: orderType,
        );

  CategoryClipControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
    required this.filterType,
    required this.orderType,
  }) : super.internal();

  final Category category;
  final FilterType filterType;
  final ClipOrderType orderType;

  @override
  FutureOr<List<NaverClip>?> runNotifierBuild(
    covariant CategoryClipController notifier,
  ) {
    return notifier.build(
      category: category,
      filterType: filterType,
      orderType: orderType,
    );
  }

  @override
  Override overrideWith(CategoryClipController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryClipControllerProvider._internal(
        () => create()
          ..category = category
          ..filterType = filterType
          ..orderType = orderType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
        filterType: filterType,
        orderType: orderType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CategoryClipController,
      List<NaverClip>?> createElement() {
    return _CategoryClipControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryClipControllerProvider &&
        other.category == category &&
        other.filterType == filterType &&
        other.orderType == orderType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);
    hash = _SystemHash.combine(hash, filterType.hashCode);
    hash = _SystemHash.combine(hash, orderType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CategoryClipControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<NaverClip>?> {
  /// The parameter `category` of this provider.
  Category get category;

  /// The parameter `filterType` of this provider.
  FilterType get filterType;

  /// The parameter `orderType` of this provider.
  ClipOrderType get orderType;
}

class _CategoryClipControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CategoryClipController,
        List<NaverClip>?> with CategoryClipControllerRef {
  _CategoryClipControllerProviderElement(super.provider);

  @override
  Category get category => (origin as CategoryClipControllerProvider).category;
  @override
  FilterType get filterType =>
      (origin as CategoryClipControllerProvider).filterType;
  @override
  ClipOrderType get orderType =>
      (origin as CategoryClipControllerProvider).orderType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
