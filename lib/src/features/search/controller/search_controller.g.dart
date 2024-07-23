// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchControllerHash() => r'ca2ccd61f467ad63a2788e110613bf9c7e4b996c';

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

abstract class _$SearchController
    extends BuildlessAutoDisposeAsyncNotifier<List<Channel>?> {
  late final String keyword;

  FutureOr<List<Channel>?> build({
    required String keyword,
  });
}

/// See also [SearchController].
@ProviderFor(SearchController)
const searchControllerProvider = SearchControllerFamily();

/// See also [SearchController].
class SearchControllerFamily extends Family<AsyncValue<List<Channel>?>> {
  /// See also [SearchController].
  const SearchControllerFamily();

  /// See also [SearchController].
  SearchControllerProvider call({
    required String keyword,
  }) {
    return SearchControllerProvider(
      keyword: keyword,
    );
  }

  @override
  SearchControllerProvider getProviderOverride(
    covariant SearchControllerProvider provider,
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
  String? get name => r'searchControllerProvider';
}

/// See also [SearchController].
class SearchControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SearchController, List<Channel>?> {
  /// See also [SearchController].
  SearchControllerProvider({
    required String keyword,
  }) : this._internal(
          () => SearchController()..keyword = keyword,
          from: searchControllerProvider,
          name: r'searchControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchControllerHash,
          dependencies: SearchControllerFamily._dependencies,
          allTransitiveDependencies:
              SearchControllerFamily._allTransitiveDependencies,
          keyword: keyword,
        );

  SearchControllerProvider._internal(
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
    covariant SearchController notifier,
  ) {
    return notifier.build(
      keyword: keyword,
    );
  }

  @override
  Override overrideWith(SearchController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SearchController, List<Channel>?>
      createElement() {
    return _SearchControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchControllerProvider && other.keyword == keyword;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, keyword.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Channel>?> {
  /// The parameter `keyword` of this provider.
  String get keyword;
}

class _SearchControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchController,
        List<Channel>?> with SearchControllerRef {
  _SearchControllerProviderElement(super.provider);

  @override
  String get keyword => (origin as SearchControllerProvider).keyword;
}

String _$searchChannelControllerHash() =>
    r'c583d201a04ba9cb2868bef078d83c9f6fc1a179';

/// See also [SearchChannelController].
@ProviderFor(SearchChannelController)
final searchChannelControllerProvider =
    AutoDisposeNotifierProvider<SearchChannelController, Channel?>.internal(
  SearchChannelController.new,
  name: r'searchChannelControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchChannelControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchChannelController = AutoDisposeNotifier<Channel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
