// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_player_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singleLivePlayerControllerHash() =>
    r'7b41c5d8d8531990d7e6e8331ad440ebd3ce8b75';

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

abstract class _$SingleLivePlayerController
    extends BuildlessAutoDisposeAsyncNotifier<Raw<VideoPlayerController>> {
  late final int index;

  FutureOr<Raw<VideoPlayerController>> build({
    required int index,
  });
}

/// See also [SingleLivePlayerController].
@ProviderFor(SingleLivePlayerController)
const singleLivePlayerControllerProvider = SingleLivePlayerControllerFamily();

/// See also [SingleLivePlayerController].
class SingleLivePlayerControllerFamily
    extends Family<AsyncValue<Raw<VideoPlayerController>>> {
  /// See also [SingleLivePlayerController].
  const SingleLivePlayerControllerFamily();

  /// See also [SingleLivePlayerController].
  SingleLivePlayerControllerProvider call({
    required int index,
  }) {
    return SingleLivePlayerControllerProvider(
      index: index,
    );
  }

  @override
  SingleLivePlayerControllerProvider getProviderOverride(
    covariant SingleLivePlayerControllerProvider provider,
  ) {
    return call(
      index: provider.index,
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
  String? get name => r'singleLivePlayerControllerProvider';
}

/// See also [SingleLivePlayerController].
class SingleLivePlayerControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SingleLivePlayerController,
        Raw<VideoPlayerController>> {
  /// See also [SingleLivePlayerController].
  SingleLivePlayerControllerProvider({
    required int index,
  }) : this._internal(
          () => SingleLivePlayerController()..index = index,
          from: singleLivePlayerControllerProvider,
          name: r'singleLivePlayerControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleLivePlayerControllerHash,
          dependencies: SingleLivePlayerControllerFamily._dependencies,
          allTransitiveDependencies:
              SingleLivePlayerControllerFamily._allTransitiveDependencies,
          index: index,
        );

  SingleLivePlayerControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  FutureOr<Raw<VideoPlayerController>> runNotifierBuild(
    covariant SingleLivePlayerController notifier,
  ) {
    return notifier.build(
      index: index,
    );
  }

  @override
  Override overrideWith(SingleLivePlayerController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SingleLivePlayerControllerProvider._internal(
        () => create()..index = index,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SingleLivePlayerController,
      Raw<VideoPlayerController>> createElement() {
    return _SingleLivePlayerControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleLivePlayerControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SingleLivePlayerControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Raw<VideoPlayerController>> {
  /// The parameter `index` of this provider.
  int get index;
}

class _SingleLivePlayerControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SingleLivePlayerController,
        Raw<VideoPlayerController>> with SingleLivePlayerControllerRef {
  _SingleLivePlayerControllerProviderElement(super.provider);

  @override
  int get index => (origin as SingleLivePlayerControllerProvider).index;
}

String _$pauseTimerHash() => r'92bb2db0a3c2bf94e401a078879835d21ccd5046';

/// See also [PauseTimer].
@ProviderFor(PauseTimer)
final pauseTimerProvider = NotifierProvider<PauseTimer, Timer?>.internal(
  PauseTimer.new,
  name: r'pauseTimerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pauseTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PauseTimer = Notifier<Timer?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
