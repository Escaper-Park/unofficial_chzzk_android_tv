// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_all_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$liveAllControllerHash() => r'b36a2a2cbd031228e7bf503d3b653abc0b40953d';

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

abstract class _$LiveAllController
    extends BuildlessAutoDisposeAsyncNotifier<List<LiveInfo>?> {
  late final VideoSortType sortType;

  FutureOr<List<LiveInfo>?> build({
    required VideoSortType sortType,
  });
}

/// See also [LiveAllController].
@ProviderFor(LiveAllController)
const liveAllControllerProvider = LiveAllControllerFamily();

/// See also [LiveAllController].
class LiveAllControllerFamily extends Family<AsyncValue<List<LiveInfo>?>> {
  /// See also [LiveAllController].
  const LiveAllControllerFamily();

  /// See also [LiveAllController].
  LiveAllControllerProvider call({
    required VideoSortType sortType,
  }) {
    return LiveAllControllerProvider(
      sortType: sortType,
    );
  }

  @override
  LiveAllControllerProvider getProviderOverride(
    covariant LiveAllControllerProvider provider,
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
  String? get name => r'liveAllControllerProvider';
}

/// See also [LiveAllController].
class LiveAllControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LiveAllController, List<LiveInfo>?> {
  /// See also [LiveAllController].
  LiveAllControllerProvider({
    required VideoSortType sortType,
  }) : this._internal(
          () => LiveAllController()..sortType = sortType,
          from: liveAllControllerProvider,
          name: r'liveAllControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$liveAllControllerHash,
          dependencies: LiveAllControllerFamily._dependencies,
          allTransitiveDependencies:
              LiveAllControllerFamily._allTransitiveDependencies,
          sortType: sortType,
        );

  LiveAllControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sortType,
  }) : super.internal();

  final VideoSortType sortType;

  @override
  FutureOr<List<LiveInfo>?> runNotifierBuild(
    covariant LiveAllController notifier,
  ) {
    return notifier.build(
      sortType: sortType,
    );
  }

  @override
  Override overrideWith(LiveAllController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LiveAllControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LiveAllController, List<LiveInfo>?>
      createElement() {
    return _LiveAllControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LiveAllControllerProvider && other.sortType == sortType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sortType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LiveAllControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<LiveInfo>?> {
  /// The parameter `sortType` of this provider.
  VideoSortType get sortType;
}

class _LiveAllControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LiveAllController,
        List<LiveInfo>?> with LiveAllControllerRef {
  _LiveAllControllerProviderElement(super.provider);

  @override
  VideoSortType get sortType => (origin as LiveAllControllerProvider).sortType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
