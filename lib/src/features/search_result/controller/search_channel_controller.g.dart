// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_channel_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchChannelControllerHash() =>
    r'7b372860a0d939f00bcd0f998c39c7aba61551dc';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
