// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_vod_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryVodControllerHash() =>
    r'e05976664757a3ce8ba0932e32c6d833fadb7e1c';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
