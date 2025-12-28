// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_tag_result_vod_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchTagResultVodControllerHash() =>
    r'fe457e8e97d9f0b092c48783635fddcc2a323526';

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

abstract class _$SearchTagResultVodController
    extends BuildlessAutoDisposeAsyncNotifier<List<Vod>?> {
  late final String tag;
  late final FilterType sortType;

  FutureOr<List<Vod>?> build({
    required String tag,
    required FilterType sortType,
  });
}

/// See also [SearchTagResultVodController].
@ProviderFor(SearchTagResultVodController)
const searchTagResultVodControllerProvider =
    SearchTagResultVodControllerFamily();

/// See also [SearchTagResultVodController].
class SearchTagResultVodControllerFamily
    extends Family<AsyncValue<List<Vod>?>> {
  /// See also [SearchTagResultVodController].
  const SearchTagResultVodControllerFamily();

  /// See also [SearchTagResultVodController].
  SearchTagResultVodControllerProvider call({
    required String tag,
    required FilterType sortType,
  }) {
    return SearchTagResultVodControllerProvider(
      tag: tag,
      sortType: sortType,
    );
  }

  @override
  SearchTagResultVodControllerProvider getProviderOverride(
    covariant SearchTagResultVodControllerProvider provider,
  ) {
    return call(
      tag: provider.tag,
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
  String? get name => r'searchTagResultVodControllerProvider';
}

/// See also [SearchTagResultVodController].
class SearchTagResultVodControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SearchTagResultVodController,
        List<Vod>?> {
  /// See also [SearchTagResultVodController].
  SearchTagResultVodControllerProvider({
    required String tag,
    required FilterType sortType,
  }) : this._internal(
          () => SearchTagResultVodController()
            ..tag = tag
            ..sortType = sortType,
          from: searchTagResultVodControllerProvider,
          name: r'searchTagResultVodControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchTagResultVodControllerHash,
          dependencies: SearchTagResultVodControllerFamily._dependencies,
          allTransitiveDependencies:
              SearchTagResultVodControllerFamily._allTransitiveDependencies,
          tag: tag,
          sortType: sortType,
        );

  SearchTagResultVodControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tag,
    required this.sortType,
  }) : super.internal();

  final String tag;
  final FilterType sortType;

  @override
  FutureOr<List<Vod>?> runNotifierBuild(
    covariant SearchTagResultVodController notifier,
  ) {
    return notifier.build(
      tag: tag,
      sortType: sortType,
    );
  }

  @override
  Override overrideWith(SearchTagResultVodController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchTagResultVodControllerProvider._internal(
        () => create()
          ..tag = tag
          ..sortType = sortType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tag: tag,
        sortType: sortType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SearchTagResultVodController,
      List<Vod>?> createElement() {
    return _SearchTagResultVodControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchTagResultVodControllerProvider &&
        other.tag == tag &&
        other.sortType == sortType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tag.hashCode);
    hash = _SystemHash.combine(hash, sortType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchTagResultVodControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Vod>?> {
  /// The parameter `tag` of this provider.
  String get tag;

  /// The parameter `sortType` of this provider.
  FilterType get sortType;
}

class _SearchTagResultVodControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        SearchTagResultVodController,
        List<Vod>?> with SearchTagResultVodControllerRef {
  _SearchTagResultVodControllerProviderElement(super.provider);

  @override
  String get tag => (origin as SearchTagResultVodControllerProvider).tag;
  @override
  FilterType get sortType =>
      (origin as SearchTagResultVodControllerProvider).sortType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
