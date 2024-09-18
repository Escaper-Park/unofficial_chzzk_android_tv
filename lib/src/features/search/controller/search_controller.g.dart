// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchChannelControllerHash() =>
    r'389a9faf4b13230ce479ca76e45b2aa760746363';

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

abstract class _$SearchChannelController
    extends BuildlessAutoDisposeAsyncNotifier<List<Channel>?> {
  late final String keyword;

  FutureOr<List<Channel>?> build({
    required String keyword,
  });
}

/// See also [SearchChannelController].
@ProviderFor(SearchChannelController)
const searchChannelControllerProvider = SearchChannelControllerFamily();

/// See also [SearchChannelController].
class SearchChannelControllerFamily extends Family<AsyncValue<List<Channel>?>> {
  /// See also [SearchChannelController].
  const SearchChannelControllerFamily();

  /// See also [SearchChannelController].
  SearchChannelControllerProvider call({
    required String keyword,
  }) {
    return SearchChannelControllerProvider(
      keyword: keyword,
    );
  }

  @override
  SearchChannelControllerProvider getProviderOverride(
    covariant SearchChannelControllerProvider provider,
  ) {
    return call(
      keyword: provider.keyword,
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
  String? get name => r'searchChannelControllerProvider';
}

/// See also [SearchChannelController].
class SearchChannelControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SearchChannelController,
        List<Channel>?> {
  /// See also [SearchChannelController].
  SearchChannelControllerProvider({
    required String keyword,
  }) : this._internal(
          () => SearchChannelController()..keyword = keyword,
          from: searchChannelControllerProvider,
          name: r'searchChannelControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchChannelControllerHash,
          dependencies: SearchChannelControllerFamily._dependencies,
          allTransitiveDependencies:
              SearchChannelControllerFamily._allTransitiveDependencies,
          keyword: keyword,
        );

  SearchChannelControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.keyword,
  }) : super.internal();

  final String keyword;

  @override
  FutureOr<List<Channel>?> runNotifierBuild(
    covariant SearchChannelController notifier,
  ) {
    return notifier.build(
      keyword: keyword,
    );
  }

  @override
  Override overrideWith(SearchChannelController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchChannelControllerProvider._internal(
        () => create()..keyword = keyword,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        keyword: keyword,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SearchChannelController,
      List<Channel>?> createElement() {
    return _SearchChannelControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchChannelControllerProvider && other.keyword == keyword;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, keyword.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchChannelControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Channel>?> {
  /// The parameter `keyword` of this provider.
  String get keyword;
}

class _SearchChannelControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchChannelController,
        List<Channel>?> with SearchChannelControllerRef {
  _SearchChannelControllerProviderElement(super.provider);

  @override
  String get keyword => (origin as SearchChannelControllerProvider).keyword;
}

String _$currentSearchChannelControllerHash() =>
    r'9b6889dc6a66769cb2aa2ecad1635c5b79dbd974';

/// See also [CurrentSearchChannelController].
@ProviderFor(CurrentSearchChannelController)
final currentSearchChannelControllerProvider = AutoDisposeNotifierProvider<
    CurrentSearchChannelController, Channel?>.internal(
  CurrentSearchChannelController.new,
  name: r'currentSearchChannelControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSearchChannelControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentSearchChannelController = AutoDisposeNotifier<Channel?>;
String _$searchTagControllerHash() =>
    r'3453aa437dd8d5d0b8e3135d5c2aa7c5ad42c406';

abstract class _$SearchTagController
    extends BuildlessAutoDisposeAsyncNotifier<List<LiveInfo>?> {
  late final String tag;
  late final LiveSortType sortType;

  FutureOr<List<LiveInfo>?> build({
    required String tag,
    required LiveSortType sortType,
  });
}

/// See also [SearchTagController].
@ProviderFor(SearchTagController)
const searchTagControllerProvider = SearchTagControllerFamily();

/// See also [SearchTagController].
class SearchTagControllerFamily extends Family<AsyncValue<List<LiveInfo>?>> {
  /// See also [SearchTagController].
  const SearchTagControllerFamily();

  /// See also [SearchTagController].
  SearchTagControllerProvider call({
    required String tag,
    required LiveSortType sortType,
  }) {
    return SearchTagControllerProvider(
      tag: tag,
      sortType: sortType,
    );
  }

  @override
  SearchTagControllerProvider getProviderOverride(
    covariant SearchTagControllerProvider provider,
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
  String? get name => r'searchTagControllerProvider';
}

/// See also [SearchTagController].
class SearchTagControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SearchTagController, List<LiveInfo>?> {
  /// See also [SearchTagController].
  SearchTagControllerProvider({
    required String tag,
    required LiveSortType sortType,
  }) : this._internal(
          () => SearchTagController()
            ..tag = tag
            ..sortType = sortType,
          from: searchTagControllerProvider,
          name: r'searchTagControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchTagControllerHash,
          dependencies: SearchTagControllerFamily._dependencies,
          allTransitiveDependencies:
              SearchTagControllerFamily._allTransitiveDependencies,
          tag: tag,
          sortType: sortType,
        );

  SearchTagControllerProvider._internal(
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
  final LiveSortType sortType;

  @override
  FutureOr<List<LiveInfo>?> runNotifierBuild(
    covariant SearchTagController notifier,
  ) {
    return notifier.build(
      tag: tag,
      sortType: sortType,
    );
  }

  @override
  Override overrideWith(SearchTagController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchTagControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SearchTagController, List<LiveInfo>?>
      createElement() {
    return _SearchTagControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchTagControllerProvider &&
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

mixin SearchTagControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<LiveInfo>?> {
  /// The parameter `tag` of this provider.
  String get tag;

  /// The parameter `sortType` of this provider.
  LiveSortType get sortType;
}

class _SearchTagControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchTagController,
        List<LiveInfo>?> with SearchTagControllerRef {
  _SearchTagControllerProviderElement(super.provider);

  @override
  String get tag => (origin as SearchTagControllerProvider).tag;
  @override
  LiveSortType get sortType => (origin as SearchTagControllerProvider).sortType;
}

String _$searchTagLiveFetchMoreLoadingStateHash() =>
    r'8bcf99d5914690172c27c33d0b809339616196d3';

/// See also [SearchTagLiveFetchMoreLoadingState].
@ProviderFor(SearchTagLiveFetchMoreLoadingState)
final searchTagLiveFetchMoreLoadingStateProvider = AutoDisposeNotifierProvider<
    SearchTagLiveFetchMoreLoadingState, bool>.internal(
  SearchTagLiveFetchMoreLoadingState.new,
  name: r'searchTagLiveFetchMoreLoadingStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchTagLiveFetchMoreLoadingStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchTagLiveFetchMoreLoadingState = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
