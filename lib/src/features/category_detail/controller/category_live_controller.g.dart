// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_live_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryLiveControllerHash() =>
    r'3f9d1ba897b2af0f238febedf3de90f406f89281';

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
    extends BuildlessAutoDisposeAsyncNotifier<List<LiveInfo>?> {
  late final Category category;

  FutureOr<List<LiveInfo>?> build({
    required Category category,
  });
}

/// See also [CategoryLiveController].
@ProviderFor(CategoryLiveController)
const categoryLiveControllerProvider = CategoryLiveControllerFamily();

/// See also [CategoryLiveController].
class CategoryLiveControllerFamily extends Family<AsyncValue<List<LiveInfo>?>> {
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
        List<LiveInfo>?> {
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
  FutureOr<List<LiveInfo>?> runNotifierBuild(
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
      List<LiveInfo>?> createElement() {
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CategoryLiveControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<LiveInfo>?> {
  /// The parameter `category` of this provider.
  Category get category;
}

class _CategoryLiveControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CategoryLiveController,
        List<LiveInfo>?> with CategoryLiveControllerRef {
  _CategoryLiveControllerProviderElement(super.provider);

  @override
  Category get category => (origin as CategoryLiveControllerProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
