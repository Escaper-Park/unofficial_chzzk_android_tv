// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryControllerHash() =>
    r'5f3cf67e575398471d6a224fd218c9d8b454fa9e';

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
String _$categoryLivesControllerHash() =>
    r'f4e25494173b2d9f360dc8973208ad6c42198ad2';

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

abstract class _$CategoryLivesController
    extends BuildlessAutoDisposeAsyncNotifier<List<LiveInfo>?> {
  late final Category category;

  FutureOr<List<LiveInfo>?> build({
    required Category category,
  });
}

/// See also [CategoryLivesController].
@ProviderFor(CategoryLivesController)
const categoryLivesControllerProvider = CategoryLivesControllerFamily();

/// See also [CategoryLivesController].
class CategoryLivesControllerFamily
    extends Family<AsyncValue<List<LiveInfo>?>> {
  /// See also [CategoryLivesController].
  const CategoryLivesControllerFamily();

  /// See also [CategoryLivesController].
  CategoryLivesControllerProvider call({
    required Category category,
  }) {
    return CategoryLivesControllerProvider(
      category: category,
    );
  }

  @override
  CategoryLivesControllerProvider getProviderOverride(
    covariant CategoryLivesControllerProvider provider,
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
  String? get name => r'categoryLivesControllerProvider';
}

/// See also [CategoryLivesController].
class CategoryLivesControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CategoryLivesController,
        List<LiveInfo>?> {
  /// See also [CategoryLivesController].
  CategoryLivesControllerProvider({
    required Category category,
  }) : this._internal(
          () => CategoryLivesController()..category = category,
          from: categoryLivesControllerProvider,
          name: r'categoryLivesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryLivesControllerHash,
          dependencies: CategoryLivesControllerFamily._dependencies,
          allTransitiveDependencies:
              CategoryLivesControllerFamily._allTransitiveDependencies,
          category: category,
        );

  CategoryLivesControllerProvider._internal(
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
  FutureOr<List<LiveInfo>?> runNotifierBuild(
    covariant CategoryLivesController notifier,
  ) {
    return notifier.build(
      category: category,
    );
  }

  @override
  Override overrideWith(CategoryLivesController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryLivesControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CategoryLivesController,
      List<LiveInfo>?> createElement() {
    return _CategoryLivesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryLivesControllerProvider &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryLivesControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<LiveInfo>?> {
  /// The parameter `category` of this provider.
  Category get category;
}

class _CategoryLivesControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CategoryLivesController,
        List<LiveInfo>?> with CategoryLivesControllerRef {
  _CategoryLivesControllerProviderElement(super.provider);

  @override
  Category get category => (origin as CategoryLivesControllerProvider).category;
}

String _$categoryVodsControllerHash() =>
    r'44e36678b9655a00014eba7cec8674ca5aa4f96a';

abstract class _$CategoryVodsController
    extends BuildlessAutoDisposeAsyncNotifier<List<Vod>?> {
  late final Category category;

  FutureOr<List<Vod>?> build({
    required Category category,
  });
}

/// See also [CategoryVodsController].
@ProviderFor(CategoryVodsController)
const categoryVodsControllerProvider = CategoryVodsControllerFamily();

/// See also [CategoryVodsController].
class CategoryVodsControllerFamily extends Family<AsyncValue<List<Vod>?>> {
  /// See also [CategoryVodsController].
  const CategoryVodsControllerFamily();

  /// See also [CategoryVodsController].
  CategoryVodsControllerProvider call({
    required Category category,
  }) {
    return CategoryVodsControllerProvider(
      category: category,
    );
  }

  @override
  CategoryVodsControllerProvider getProviderOverride(
    covariant CategoryVodsControllerProvider provider,
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
  String? get name => r'categoryVodsControllerProvider';
}

/// See also [CategoryVodsController].
class CategoryVodsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CategoryVodsController,
        List<Vod>?> {
  /// See also [CategoryVodsController].
  CategoryVodsControllerProvider({
    required Category category,
  }) : this._internal(
          () => CategoryVodsController()..category = category,
          from: categoryVodsControllerProvider,
          name: r'categoryVodsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryVodsControllerHash,
          dependencies: CategoryVodsControllerFamily._dependencies,
          allTransitiveDependencies:
              CategoryVodsControllerFamily._allTransitiveDependencies,
          category: category,
        );

  CategoryVodsControllerProvider._internal(
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
    covariant CategoryVodsController notifier,
  ) {
    return notifier.build(
      category: category,
    );
  }

  @override
  Override overrideWith(CategoryVodsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryVodsControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CategoryVodsController, List<Vod>?>
      createElement() {
    return _CategoryVodsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryVodsControllerProvider &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryVodsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Vod>?> {
  /// The parameter `category` of this provider.
  Category get category;
}

class _CategoryVodsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CategoryVodsController,
        List<Vod>?> with CategoryVodsControllerRef {
  _CategoryVodsControllerProviderElement(super.provider);

  @override
  Category get category => (origin as CategoryVodsControllerProvider).category;
}

String _$followingCategoriesControllerHash() =>
    r'50dbfff4d7b1fdde7bccdb107c79093a7c3fb0c0';

/// See also [FollowingCategoriesController].
@ProviderFor(FollowingCategoriesController)
final followingCategoriesControllerProvider = AutoDisposeAsyncNotifierProvider<
    FollowingCategoriesController, List<Category>?>.internal(
  FollowingCategoriesController.new,
  name: r'followingCategoriesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$followingCategoriesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FollowingCategoriesController
    = AutoDisposeAsyncNotifier<List<Category>?>;
String _$categoryFetchMoreLoadingStateHash() =>
    r'e1151bb7126fb080838972c19d8ebf1aba685708';

/// See also [CategoryFetchMoreLoadingState].
@ProviderFor(CategoryFetchMoreLoadingState)
final categoryFetchMoreLoadingStateProvider =
    AutoDisposeNotifierProvider<CategoryFetchMoreLoadingState, bool>.internal(
  CategoryFetchMoreLoadingState.new,
  name: r'categoryFetchMoreLoadingStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryFetchMoreLoadingStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryFetchMoreLoadingState = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
