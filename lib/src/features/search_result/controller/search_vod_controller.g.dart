// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_vod_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchVodControllerHash() =>
    r'247ae1bb7d3517536346226ff6a32b6ce98bbed6';

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

abstract class _$SearchVodController
    extends BuildlessAutoDisposeAsyncNotifier<List<Vod>?> {
  late final String keyword;

  FutureOr<List<Vod>?> build({
    required String keyword,
  });
}

/// See also [SearchVodController].
@ProviderFor(SearchVodController)
const searchVodControllerProvider = SearchVodControllerFamily();

/// See also [SearchVodController].
class SearchVodControllerFamily extends Family<AsyncValue<List<Vod>?>> {
  /// See also [SearchVodController].
  const SearchVodControllerFamily();

  /// See also [SearchVodController].
  SearchVodControllerProvider call({
    required String keyword,
  }) {
    return SearchVodControllerProvider(
      keyword: keyword,
    );
  }

  @override
  SearchVodControllerProvider getProviderOverride(
    covariant SearchVodControllerProvider provider,
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
  String? get name => r'searchVodControllerProvider';
}

/// See also [SearchVodController].
class SearchVodControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SearchVodController, List<Vod>?> {
  /// See also [SearchVodController].
  SearchVodControllerProvider({
    required String keyword,
  }) : this._internal(
          () => SearchVodController()..keyword = keyword,
          from: searchVodControllerProvider,
          name: r'searchVodControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchVodControllerHash,
          dependencies: SearchVodControllerFamily._dependencies,
          allTransitiveDependencies:
              SearchVodControllerFamily._allTransitiveDependencies,
          keyword: keyword,
        );

  SearchVodControllerProvider._internal(
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
  FutureOr<List<Vod>?> runNotifierBuild(
    covariant SearchVodController notifier,
  ) {
    return notifier.build(
      keyword: keyword,
    );
  }

  @override
  Override overrideWith(SearchVodController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchVodControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SearchVodController, List<Vod>?>
      createElement() {
    return _SearchVodControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchVodControllerProvider && other.keyword == keyword;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, keyword.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchVodControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Vod>?> {
  /// The parameter `keyword` of this provider.
  String get keyword;
}

class _SearchVodControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchVodController,
        List<Vod>?> with SearchVodControllerRef {
  _SearchVodControllerProviderElement(super.provider);

  @override
  String get keyword => (origin as SearchVodControllerProvider).keyword;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
