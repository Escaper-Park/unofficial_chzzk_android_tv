// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$liveControllerHash() => r'80e2008e9969b83f8589922954615ef9fe02cf48';

/// See also [LiveController].
@ProviderFor(LiveController)
final liveControllerProvider =
    AutoDisposeNotifierProvider<LiveController, void>.internal(
  LiveController.new,
  name: r'liveControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LiveController = AutoDisposeNotifier<void>;
String _$allLivesControllerHash() =>
    r'aea3b1533125ef05cb3dd17981261e4f11f11db7';

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

abstract class _$AllLivesController
    extends BuildlessAutoDisposeAsyncNotifier<List<LiveInfo>?> {
  late final LiveSortType sortType;

  FutureOr<List<LiveInfo>?> build({
    required LiveSortType sortType,
  });
}

/// See also [AllLivesController].
@ProviderFor(AllLivesController)
const allLivesControllerProvider = AllLivesControllerFamily();

/// See also [AllLivesController].
class AllLivesControllerFamily extends Family<AsyncValue<List<LiveInfo>?>> {
  /// See also [AllLivesController].
  const AllLivesControllerFamily();

  /// See also [AllLivesController].
  AllLivesControllerProvider call({
    required LiveSortType sortType,
  }) {
    return AllLivesControllerProvider(
      sortType: sortType,
    );
  }

  @override
  AllLivesControllerProvider getProviderOverride(
    covariant AllLivesControllerProvider provider,
  ) {
    return call(
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
  String? get name => r'allLivesControllerProvider';
}

/// See also [AllLivesController].
class AllLivesControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AllLivesController, List<LiveInfo>?> {
  /// See also [AllLivesController].
  AllLivesControllerProvider({
    required LiveSortType sortType,
  }) : this._internal(
          () => AllLivesController()..sortType = sortType,
          from: allLivesControllerProvider,
          name: r'allLivesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allLivesControllerHash,
          dependencies: AllLivesControllerFamily._dependencies,
          allTransitiveDependencies:
              AllLivesControllerFamily._allTransitiveDependencies,
          sortType: sortType,
        );

  AllLivesControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sortType,
  }) : super.internal();

  final LiveSortType sortType;

  @override
  FutureOr<List<LiveInfo>?> runNotifierBuild(
    covariant AllLivesController notifier,
  ) {
    return notifier.build(
      sortType: sortType,
    );
  }

  @override
  Override overrideWith(AllLivesController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AllLivesControllerProvider._internal(
        () => create()..sortType = sortType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sortType: sortType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AllLivesController, List<LiveInfo>?>
      createElement() {
    return _AllLivesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllLivesControllerProvider && other.sortType == sortType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sortType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AllLivesControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<LiveInfo>?> {
  /// The parameter `sortType` of this provider.
  LiveSortType get sortType;
}

class _AllLivesControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AllLivesController,
        List<LiveInfo>?> with AllLivesControllerRef {
  _AllLivesControllerProviderElement(super.provider);

  @override
  LiveSortType get sortType => (origin as AllLivesControllerProvider).sortType;
}

String _$homePopularLivesControllerHash() =>
    r'f0971cf37b34855ae73b512c986b1a8694e03296';

/// See also [HomePopularLivesController].
@ProviderFor(HomePopularLivesController)
final homePopularLivesControllerProvider = AutoDisposeAsyncNotifierProvider<
    HomePopularLivesController, List<LiveInfo>?>.internal(
  HomePopularLivesController.new,
  name: r'homePopularLivesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homePopularLivesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomePopularLivesController
    = AutoDisposeAsyncNotifier<List<LiveInfo>?>;
String _$liveFetchMoreLoadingStateHash() =>
    r'5f8d91629ac56c5e81ed996414d831fe22bef7ed';

/// See also [LiveFetchMoreLoadingState].
@ProviderFor(LiveFetchMoreLoadingState)
final liveFetchMoreLoadingStateProvider =
    AutoDisposeNotifierProvider<LiveFetchMoreLoadingState, bool>.internal(
  LiveFetchMoreLoadingState.new,
  name: r'liveFetchMoreLoadingStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveFetchMoreLoadingStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LiveFetchMoreLoadingState = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
