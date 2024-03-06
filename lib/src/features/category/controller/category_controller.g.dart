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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
