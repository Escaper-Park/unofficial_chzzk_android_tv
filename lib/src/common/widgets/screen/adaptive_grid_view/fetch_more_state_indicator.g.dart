// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_more_state_indicator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchMoreStateIndicatorControllerHash() =>
    r'f48c88043c1f39ebfe0d4fad62199e8ec4ae58c7';

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

abstract class _$FetchMoreStateIndicatorController
    extends BuildlessAutoDisposeNotifier<bool> {
  late final String screenId;

  bool build({
    required String screenId,
  });
}

/// See also [FetchMoreStateIndicatorController].
@ProviderFor(FetchMoreStateIndicatorController)
const fetchMoreStateIndicatorControllerProvider =
    FetchMoreStateIndicatorControllerFamily();

/// See also [FetchMoreStateIndicatorController].
class FetchMoreStateIndicatorControllerFamily extends Family<bool> {
  /// See also [FetchMoreStateIndicatorController].
  const FetchMoreStateIndicatorControllerFamily();

  /// See also [FetchMoreStateIndicatorController].
  FetchMoreStateIndicatorControllerProvider call({
    required String screenId,
  }) {
    return FetchMoreStateIndicatorControllerProvider(
      screenId: screenId,
    );
  }

  @override
  FetchMoreStateIndicatorControllerProvider getProviderOverride(
    covariant FetchMoreStateIndicatorControllerProvider provider,
  ) {
    return call(
      screenId: provider.screenId,
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
  String? get name => r'fetchMoreStateIndicatorControllerProvider';
}

/// See also [FetchMoreStateIndicatorController].
class FetchMoreStateIndicatorControllerProvider
    extends AutoDisposeNotifierProviderImpl<FetchMoreStateIndicatorController,
        bool> {
  /// See also [FetchMoreStateIndicatorController].
  FetchMoreStateIndicatorControllerProvider({
    required String screenId,
  }) : this._internal(
          () => FetchMoreStateIndicatorController()..screenId = screenId,
          from: fetchMoreStateIndicatorControllerProvider,
          name: r'fetchMoreStateIndicatorControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMoreStateIndicatorControllerHash,
          dependencies: FetchMoreStateIndicatorControllerFamily._dependencies,
          allTransitiveDependencies: FetchMoreStateIndicatorControllerFamily
              ._allTransitiveDependencies,
          screenId: screenId,
        );

  FetchMoreStateIndicatorControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.screenId,
  }) : super.internal();

  final String screenId;

  @override
  bool runNotifierBuild(
    covariant FetchMoreStateIndicatorController notifier,
  ) {
    return notifier.build(
      screenId: screenId,
    );
  }

  @override
  Override overrideWith(FetchMoreStateIndicatorController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchMoreStateIndicatorControllerProvider._internal(
        () => create()..screenId = screenId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        screenId: screenId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FetchMoreStateIndicatorController, bool>
      createElement() {
    return _FetchMoreStateIndicatorControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchMoreStateIndicatorControllerProvider &&
        other.screenId == screenId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, screenId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchMoreStateIndicatorControllerRef
    on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `screenId` of this provider.
  String get screenId;
}

class _FetchMoreStateIndicatorControllerProviderElement
    extends AutoDisposeNotifierProviderElement<
        FetchMoreStateIndicatorController,
        bool> with FetchMoreStateIndicatorControllerRef {
  _FetchMoreStateIndicatorControllerProviderElement(super.provider);

  @override
  String get screenId =>
      (origin as FetchMoreStateIndicatorControllerProvider).screenId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
