// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clip_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$popularClipControllerHash() =>
    r'c8f6767d4fbf415299135a733864fd5cce3ef5a4';

/// See also [PopularClipController].
@ProviderFor(PopularClipController)
final popularClipControllerProvider = AutoDisposeAsyncNotifierProvider<
    PopularClipController, List<NaverClip>?>.internal(
  PopularClipController.new,
  name: r'popularClipControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popularClipControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PopularClipController = AutoDisposeAsyncNotifier<List<NaverClip>?>;
String _$channelClipControllerHash() =>
    r'fd530d295a249d2759a953ab2d53c55774784393';

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

abstract class _$ChannelClipController
    extends BuildlessAutoDisposeAsyncNotifier<List<NaverClip>?> {
  late final String channelId;
  late final String sortType;

  FutureOr<List<NaverClip>?> build({
    required String channelId,
    String sortType = 'POPULAR',
  });
}

/// See also [ChannelClipController].
@ProviderFor(ChannelClipController)
const channelClipControllerProvider = ChannelClipControllerFamily();

/// See also [ChannelClipController].
class ChannelClipControllerFamily extends Family<AsyncValue<List<NaverClip>?>> {
  /// See also [ChannelClipController].
  const ChannelClipControllerFamily();

  /// See also [ChannelClipController].
  ChannelClipControllerProvider call({
    required String channelId,
    String sortType = 'POPULAR',
  }) {
    return ChannelClipControllerProvider(
      channelId: channelId,
      sortType: sortType,
    );
  }

  @override
  ChannelClipControllerProvider getProviderOverride(
    covariant ChannelClipControllerProvider provider,
  ) {
    return call(
      channelId: provider.channelId,
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
  String? get name => r'channelClipControllerProvider';
}

/// See also [ChannelClipController].
class ChannelClipControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChannelClipController,
        List<NaverClip>?> {
  /// See also [ChannelClipController].
  ChannelClipControllerProvider({
    required String channelId,
    String sortType = 'POPULAR',
  }) : this._internal(
          () => ChannelClipController()
            ..channelId = channelId
            ..sortType = sortType,
          from: channelClipControllerProvider,
          name: r'channelClipControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$channelClipControllerHash,
          dependencies: ChannelClipControllerFamily._dependencies,
          allTransitiveDependencies:
              ChannelClipControllerFamily._allTransitiveDependencies,
          channelId: channelId,
          sortType: sortType,
        );

  ChannelClipControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.channelId,
    required this.sortType,
  }) : super.internal();

  final String channelId;
  final String sortType;

  @override
  FutureOr<List<NaverClip>?> runNotifierBuild(
    covariant ChannelClipController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
      sortType: sortType,
    );
  }

  @override
  Override overrideWith(ChannelClipController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChannelClipControllerProvider._internal(
        () => create()
          ..channelId = channelId
          ..sortType = sortType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        channelId: channelId,
        sortType: sortType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChannelClipController,
      List<NaverClip>?> createElement() {
    return _ChannelClipControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelClipControllerProvider &&
        other.channelId == channelId &&
        other.sortType == sortType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);
    hash = _SystemHash.combine(hash, sortType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChannelClipControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<NaverClip>?> {
  /// The parameter `channelId` of this provider.
  String get channelId;

  /// The parameter `sortType` of this provider.
  String get sortType;
}

class _ChannelClipControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChannelClipController,
        List<NaverClip>?> with ChannelClipControllerRef {
  _ChannelClipControllerProviderElement(super.provider);

  @override
  String get channelId => (origin as ChannelClipControllerProvider).channelId;
  @override
  String get sortType => (origin as ChannelClipControllerProvider).sortType;
}

String _$categoryClipControllerHash() =>
    r'8af959fc5b585228d1ec10185ceac46a805d1e1c';

abstract class _$CategoryClipController
    extends BuildlessAutoDisposeAsyncNotifier<List<NaverClip>?> {
  late final Category category;
  late final String sortType;

  FutureOr<List<NaverClip>?> build({
    required Category category,
    String sortType = 'POPULAR',
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
    String sortType = 'POPULAR',
  }) {
    return CategoryClipControllerProvider(
      category: category,
      sortType: sortType,
    );
  }

  @override
  CategoryClipControllerProvider getProviderOverride(
    covariant CategoryClipControllerProvider provider,
  ) {
    return call(
      category: provider.category,
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
  String? get name => r'categoryClipControllerProvider';
}

/// See also [CategoryClipController].
class CategoryClipControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CategoryClipController,
        List<NaverClip>?> {
  /// See also [CategoryClipController].
  CategoryClipControllerProvider({
    required Category category,
    String sortType = 'POPULAR',
  }) : this._internal(
          () => CategoryClipController()
            ..category = category
            ..sortType = sortType,
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
          sortType: sortType,
        );

  CategoryClipControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
    required this.sortType,
  }) : super.internal();

  final Category category;
  final String sortType;

  @override
  FutureOr<List<NaverClip>?> runNotifierBuild(
    covariant CategoryClipController notifier,
  ) {
    return notifier.build(
      category: category,
      sortType: sortType,
    );
  }

  @override
  Override overrideWith(CategoryClipController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryClipControllerProvider._internal(
        () => create()
          ..category = category
          ..sortType = sortType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
        sortType: sortType,
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
        other.sortType == sortType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);
    hash = _SystemHash.combine(hash, sortType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryClipControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<NaverClip>?> {
  /// The parameter `category` of this provider.
  Category get category;

  /// The parameter `sortType` of this provider.
  String get sortType;
}

class _CategoryClipControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CategoryClipController,
        List<NaverClip>?> with CategoryClipControllerRef {
  _CategoryClipControllerProviderElement(super.provider);

  @override
  Category get category => (origin as CategoryClipControllerProvider).category;
  @override
  String get sortType => (origin as CategoryClipControllerProvider).sortType;
}

String _$currentSelectedClipHash() =>
    r'30304f0b4b7133eb3ed8c8ff8ed97405f0b698ad';

/// See also [CurrentSelectedClip].
@ProviderFor(CurrentSelectedClip)
final currentSelectedClipProvider =
    AutoDisposeNotifierProvider<CurrentSelectedClip, String?>.internal(
  CurrentSelectedClip.new,
  name: r'currentSelectedClipProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSelectedClipHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentSelectedClip = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
