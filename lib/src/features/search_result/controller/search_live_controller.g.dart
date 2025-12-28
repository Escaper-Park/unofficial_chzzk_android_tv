// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_live_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchLiveControllerHash() =>
    r'b2201e0c57e6366cbcaf266c2073a13c26b22523';

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

abstract class _$SearchLiveController
    extends BuildlessAutoDisposeAsyncNotifier<List<LiveInfo>?> {
  late final String keyword;

  FutureOr<List<LiveInfo>?> build({
    required String keyword,
  });
}

/// See also [SearchLiveController].
@ProviderFor(SearchLiveController)
const searchLiveControllerProvider = SearchLiveControllerFamily();

/// See also [SearchLiveController].
class SearchLiveControllerFamily extends Family<AsyncValue<List<LiveInfo>?>> {
  /// See also [SearchLiveController].
  const SearchLiveControllerFamily();

  /// See also [SearchLiveController].
  SearchLiveControllerProvider call({
    required String keyword,
  }) {
    return SearchLiveControllerProvider(
      keyword: keyword,
    );
  }

  @override
  SearchLiveControllerProvider getProviderOverride(
    covariant SearchLiveControllerProvider provider,
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
  String? get name => r'searchLiveControllerProvider';
}

/// See also [SearchLiveController].
class SearchLiveControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SearchLiveController, List<LiveInfo>?> {
  /// See also [SearchLiveController].
  SearchLiveControllerProvider({
    required String keyword,
  }) : this._internal(
          () => SearchLiveController()..keyword = keyword,
          from: searchLiveControllerProvider,
          name: r'searchLiveControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchLiveControllerHash,
          dependencies: SearchLiveControllerFamily._dependencies,
          allTransitiveDependencies:
              SearchLiveControllerFamily._allTransitiveDependencies,
          keyword: keyword,
        );

  SearchLiveControllerProvider._internal(
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
  FutureOr<List<LiveInfo>?> runNotifierBuild(
    covariant SearchLiveController notifier,
  ) {
    return notifier.build(
      keyword: keyword,
    );
  }

  @override
  Override overrideWith(SearchLiveController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchLiveControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SearchLiveController, List<LiveInfo>?>
      createElement() {
    return _SearchLiveControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchLiveControllerProvider && other.keyword == keyword;
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
mixin SearchLiveControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<LiveInfo>?> {
  /// The parameter `keyword` of this provider.
  String get keyword;
}

class _SearchLiveControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchLiveController,
        List<LiveInfo>?> with SearchLiveControllerRef {
  _SearchLiveControllerProviderElement(super.provider);

  @override
  String get keyword => (origin as SearchLiveControllerProvider).keyword;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
