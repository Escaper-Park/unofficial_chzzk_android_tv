// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_player_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$livePlayerControllerHash() =>
    r'2ed941d6c22197577bbbe0f6ae9c0d30c1ca90ba';

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

abstract class _$LivePlayerController
    extends BuildlessAutoDisposeAsyncNotifier<Raw<VideoPlayerController?>> {
  late final int index;

  FutureOr<Raw<VideoPlayerController?>> build({
    required int index,
  });
}

/// See also [LivePlayerController].
@ProviderFor(LivePlayerController)
const livePlayerControllerProvider = LivePlayerControllerFamily();

/// See also [LivePlayerController].
class LivePlayerControllerFamily
    extends Family<AsyncValue<Raw<VideoPlayerController?>>> {
  /// See also [LivePlayerController].
  const LivePlayerControllerFamily();

  /// See also [LivePlayerController].
  LivePlayerControllerProvider call({
    required int index,
  }) {
    return LivePlayerControllerProvider(
      index: index,
    );
  }

  @override
  LivePlayerControllerProvider getProviderOverride(
    covariant LivePlayerControllerProvider provider,
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
  String? get name => r'livePlayerControllerProvider';
}

/// See also [LivePlayerController].
class LivePlayerControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LivePlayerController, Raw<VideoPlayerController?>> {
  /// See also [LivePlayerController].
  LivePlayerControllerProvider({
    required int index,
  }) : this._internal(
          () => LivePlayerController()..index = index,
          from: livePlayerControllerProvider,
          name: r'livePlayerControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$livePlayerControllerHash,
          dependencies: LivePlayerControllerFamily._dependencies,
          allTransitiveDependencies:
              LivePlayerControllerFamily._allTransitiveDependencies,
          index: index,
        );

  LivePlayerControllerProvider._internal(
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
  FutureOr<Raw<VideoPlayerController?>> runNotifierBuild(
    covariant LivePlayerController notifier,
  ) {
    return notifier.build(
      index: index,
    );
  }

  @override
  Override overrideWith(LivePlayerController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LivePlayerControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LivePlayerController,
      Raw<VideoPlayerController?>> createElement() {
    return _LivePlayerControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LivePlayerControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LivePlayerControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Raw<VideoPlayerController?>> {
  /// The parameter `index` of this provider.
  int get index;
}

class _LivePlayerControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LivePlayerController,
        Raw<VideoPlayerController?>> with LivePlayerControllerRef {
  _LivePlayerControllerProviderElement(super.provider);

  @override
  int get index => (origin as LivePlayerControllerProvider).index;
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
