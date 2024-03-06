// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchControllerHash() => r'5e83bda7d11f68577c3e6cfb2368b6abfbe7dd62';

/// See also [SearchController].
@ProviderFor(SearchController)
final searchControllerProvider =
    AutoDisposeNotifierProvider<SearchController, Channel?>.internal(
  SearchController.new,
  name: r'searchControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchController = AutoDisposeNotifier<Channel?>;
String _$searchResultsControllerHash() =>
    r'd44e18a4647b1494d2803f526763183e9a2d70b5';

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

abstract class _$SearchResultsController
    extends BuildlessAutoDisposeAsyncNotifier<List<Channel>?> {
  late final String keyword;

  FutureOr<List<Channel>?> build({
    required String keyword,
  });
}

/// See also [SearchResultsController].
@ProviderFor(SearchResultsController)
const searchResultsControllerProvider = SearchResultsControllerFamily();

/// See also [SearchResultsController].
class SearchResultsControllerFamily extends Family<AsyncValue<List<Channel>?>> {
  /// See also [SearchResultsController].
  const SearchResultsControllerFamily();

  /// See also [SearchResultsController].
  SearchResultsControllerProvider call({
    required String keyword,
  }) {
    return SearchResultsControllerProvider(
      keyword: keyword,
    );
  }

  @override
  SearchResultsControllerProvider getProviderOverride(
    covariant SearchResultsControllerProvider provider,
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
  String? get name => r'searchResultsControllerProvider';
}

/// See also [SearchResultsController].
class SearchResultsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SearchResultsController,
        List<Channel>?> {
  /// See also [SearchResultsController].
  SearchResultsControllerProvider({
    required String keyword,
  }) : this._internal(
          () => SearchResultsController()..keyword = keyword,
          from: searchResultsControllerProvider,
          name: r'searchResultsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchResultsControllerHash,
          dependencies: SearchResultsControllerFamily._dependencies,
          allTransitiveDependencies:
              SearchResultsControllerFamily._allTransitiveDependencies,
          keyword: keyword,
        );

  SearchResultsControllerProvider._internal(
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
    covariant SearchResultsController notifier,
  ) {
    return notifier.build(
      keyword: keyword,
    );
  }

  @override
  Override overrideWith(SearchResultsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchResultsControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SearchResultsController,
      List<Channel>?> createElement() {
    return _SearchResultsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchResultsControllerProvider && other.keyword == keyword;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, keyword.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchResultsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Channel>?> {
  /// The parameter `keyword` of this provider.
  String get keyword;
}

class _SearchResultsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchResultsController,
        List<Channel>?> with SearchResultsControllerRef {
  _SearchResultsControllerProviderElement(super.provider);

  @override
  String get keyword => (origin as SearchResultsControllerProvider).keyword;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
