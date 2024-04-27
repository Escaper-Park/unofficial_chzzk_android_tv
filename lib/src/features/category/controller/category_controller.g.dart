// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryControllerHash() =>
    r'874e64f886cd4fa6c6643d6e202a56d8586c6c14';

/// See also [CategoryController].
@ProviderFor(CategoryController)
final categoryControllerProvider = AutoDisposeAsyncNotifierProvider<
    CategoryController, List<Category>?>.internal(
  CategoryController.new,
  name: r'categoryControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryController = AutoDisposeAsyncNotifier<List<Category>?>;
String _$favoriteCategoriesControllerHash() =>
    r'f4bbc6c4b43047e29ca1a3ed4ede1d898ccd8cc2';

/// See also [FavoriteCategoriesController].
@ProviderFor(FavoriteCategoriesController)
final favoriteCategoriesControllerProvider = AutoDisposeAsyncNotifierProvider<
    FavoriteCategoriesController, List<Category>>.internal(
  FavoriteCategoriesController.new,
  name: r'favoriteCategoriesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteCategoriesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoriteCategoriesController
    = AutoDisposeAsyncNotifier<List<Category>>;
String _$currentCategoryItemHash() =>
    r'3960b9b2b441c2761adb401184b5526751b62e5f';

/// See also [CurrentCategoryItem].
@ProviderFor(CurrentCategoryItem)
final currentCategoryItemProvider =
    AutoDisposeNotifierProvider<CurrentCategoryItem, CategoryItem>.internal(
  CurrentCategoryItem.new,
  name: r'currentCategoryItemProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentCategoryItemHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentCategoryItem = AutoDisposeNotifier<CategoryItem>;
String _$categoryLiveControllerHash() =>
    r'847a4f8b6a6d2c69cc8d7d9c724eeeac1c2d237c';

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

abstract class _$CategoryLiveController
    extends BuildlessAutoDisposeAsyncNotifier<List<LiveDetail>?> {
  late final Category category;

  FutureOr<List<LiveDetail>?> build({
    required Category category,
  });
}

/// See also [CategoryLiveController].
@ProviderFor(CategoryLiveController)
const categoryLiveControllerProvider = CategoryLiveControllerFamily();

/// See also [CategoryLiveController].
class CategoryLiveControllerFamily
    extends Family<AsyncValue<List<LiveDetail>?>> {
  /// See also [CategoryLiveController].
  const CategoryLiveControllerFamily();

  /// See also [CategoryLiveController].
  CategoryLiveControllerProvider call({
    required Category category,
  }) {
    return CategoryLiveControllerProvider(
      category: category,
    );
  }

  @override
  CategoryLiveControllerProvider getProviderOverride(
    covariant CategoryLiveControllerProvider provider,
  ) {
    return call(
      category: provider.category,
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
  String? get name => r'categoryLiveControllerProvider';
}

/// See also [CategoryLiveController].
class CategoryLiveControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CategoryLiveController,
        List<LiveDetail>?> {
  /// See also [CategoryLiveController].
  CategoryLiveControllerProvider({
    required Category category,
  }) : this._internal(
          () => CategoryLiveController()..category = category,
          from: categoryLiveControllerProvider,
          name: r'categoryLiveControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryLiveControllerHash,
          dependencies: CategoryLiveControllerFamily._dependencies,
          allTransitiveDependencies:
              CategoryLiveControllerFamily._allTransitiveDependencies,
          category: category,
        );

  CategoryLiveControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final Category category;

  @override
  FutureOr<List<LiveDetail>?> runNotifierBuild(
    covariant CategoryLiveController notifier,
  ) {
    return notifier.build(
      category: category,
    );
  }

  @override
  Override overrideWith(CategoryLiveController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryLiveControllerProvider._internal(
        () => create()..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CategoryLiveController,
      List<LiveDetail>?> createElement() {
    return _CategoryLiveControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryLiveControllerProvider &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryLiveControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<LiveDetail>?> {
  /// The parameter `category` of this provider.
  Category get category;
}

class _CategoryLiveControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CategoryLiveController,
        List<LiveDetail>?> with CategoryLiveControllerRef {
  _CategoryLiveControllerProviderElement(super.provider);

  @override
  Category get category => (origin as CategoryLiveControllerProvider).category;
}

String _$categoryVodControllerHash() =>
    r'4d38e6e646a86b31a28165e54c7bb363ce84d4ad';

abstract class _$CategoryVodController
    extends BuildlessAutoDisposeAsyncNotifier<List<Vod>?> {
  late final Category category;

  FutureOr<List<Vod>?> build({
    required Category category,
  });
}

/// See also [CategoryVodController].
@ProviderFor(CategoryVodController)
const categoryVodControllerProvider = CategoryVodControllerFamily();

/// See also [CategoryVodController].
class CategoryVodControllerFamily extends Family<AsyncValue<List<Vod>?>> {
  /// See also [CategoryVodController].
  const CategoryVodControllerFamily();

  /// See also [CategoryVodController].
  CategoryVodControllerProvider call({
    required Category category,
  }) {
    return CategoryVodControllerProvider(
      category: category,
    );
  }

  @override
  CategoryVodControllerProvider getProviderOverride(
    covariant CategoryVodControllerProvider provider,
  ) {
    return call(
      category: provider.category,
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
  String? get name => r'categoryVodControllerProvider';
}

/// See also [CategoryVodController].
class CategoryVodControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CategoryVodController,
        List<Vod>?> {
  /// See also [CategoryVodController].
  CategoryVodControllerProvider({
    required Category category,
  }) : this._internal(
          () => CategoryVodController()..category = category,
          from: categoryVodControllerProvider,
          name: r'categoryVodControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryVodControllerHash,
          dependencies: CategoryVodControllerFamily._dependencies,
          allTransitiveDependencies:
              CategoryVodControllerFamily._allTransitiveDependencies,
          category: category,
        );

  CategoryVodControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final Category category;

  @override
  FutureOr<List<Vod>?> runNotifierBuild(
    covariant CategoryVodController notifier,
  ) {
    return notifier.build(
      category: category,
    );
  }

  @override
  Override overrideWith(CategoryVodController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryVodControllerProvider._internal(
        () => create()..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CategoryVodController, List<Vod>?>
      createElement() {
    return _CategoryVodControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryVodControllerProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryVodControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Vod>?> {
  /// The parameter `category` of this provider.
  Category get category;
}

class _CategoryVodControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CategoryVodController,
        List<Vod>?> with CategoryVodControllerRef {
  _CategoryVodControllerProviderElement(super.provider);

  @override
  Category get category => (origin as CategoryVodControllerProvider).category;
}

String _$categoryLoadingStateHash() =>
    r'77ad2a88498e19a242c4c9672ea12f07e8b846f2';

/// See also [CategoryLoadingState].
@ProviderFor(CategoryLoadingState)
final categoryLoadingStateProvider =
    AutoDisposeNotifierProvider<CategoryLoadingState, bool>.internal(
  CategoryLoadingState.new,
  name: r'categoryLoadingStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryLoadingStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryLoadingState = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
