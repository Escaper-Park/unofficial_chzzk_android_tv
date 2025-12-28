// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_tag_result_live_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchTagResultLiveControllerHash() =>
    r'e7083db8fdc3631eaafc54494a6acfbf36c667e1';

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

abstract class _$SearchTagResultLiveController
    extends BuildlessAutoDisposeAsyncNotifier<List<LiveInfo>?> {
  late final String tag;
  late final FilterType sortType;

  FutureOr<List<LiveInfo>?> build({
    required String tag,
    required FilterType sortType,
  });
}

/// See also [SearchTagResultLiveController].
@ProviderFor(SearchTagResultLiveController)
const searchTagResultLiveControllerProvider =
    SearchTagResultLiveControllerFamily();

/// See also [SearchTagResultLiveController].
class SearchTagResultLiveControllerFamily
    extends Family<AsyncValue<List<LiveInfo>?>> {
  /// See also [SearchTagResultLiveController].
  const SearchTagResultLiveControllerFamily();

  /// See also [SearchTagResultLiveController].
  SearchTagResultLiveControllerProvider call({
    required String tag,
    required FilterType sortType,
  }) {
    return SearchTagResultLiveControllerProvider(
      tag: tag,
      sortType: sortType,
    );
  }

  @override
  SearchTagResultLiveControllerProvider getProviderOverride(
    covariant SearchTagResultLiveControllerProvider provider,
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
  String? get name => r'searchTagResultLiveControllerProvider';
}

/// See also [SearchTagResultLiveController].
class SearchTagResultLiveControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SearchTagResultLiveController,
        List<LiveInfo>?> {
  /// See also [SearchTagResultLiveController].
  SearchTagResultLiveControllerProvider({
    required String tag,
    required FilterType sortType,
  }) : this._internal(
          () => SearchTagResultLiveController()
            ..tag = tag
            ..sortType = sortType,
          from: searchTagResultLiveControllerProvider,
          name: r'searchTagResultLiveControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchTagResultLiveControllerHash,
          dependencies: SearchTagResultLiveControllerFamily._dependencies,
          allTransitiveDependencies:
              SearchTagResultLiveControllerFamily._allTransitiveDependencies,
          tag: tag,
          sortType: sortType,
        );

  SearchTagResultLiveControllerProvider._internal(
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
  FutureOr<List<LiveInfo>?> runNotifierBuild(
    covariant SearchTagResultLiveController notifier,
  ) {
    return notifier.build(
      tag: tag,
      sortType: sortType,
    );
  }

  @override
  Override overrideWith(SearchTagResultLiveController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchTagResultLiveControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SearchTagResultLiveController,
      List<LiveInfo>?> createElement() {
    return _SearchTagResultLiveControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchTagResultLiveControllerProvider &&
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
mixin SearchTagResultLiveControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<LiveInfo>?> {
  /// The parameter `tag` of this provider.
  String get tag;

  /// The parameter `sortType` of this provider.
  FilterType get sortType;
}

class _SearchTagResultLiveControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        SearchTagResultLiveController,
        List<LiveInfo>?> with SearchTagResultLiveControllerRef {
  _SearchTagResultLiveControllerProviderElement(super.provider);

  @override
  String get tag => (origin as SearchTagResultLiveControllerProvider).tag;
  @override
  FilterType get sortType =>
      (origin as SearchTagResultLiveControllerProvider).sortType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
