// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_player_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$liveOverlayControllerHash() =>
    r'eb9527c93acef7dd30b24d38120dafd594220939';

/// See also [LiveOverlayController].
@ProviderFor(LiveOverlayController)
final liveOverlayControllerProvider = AutoDisposeNotifierProvider<
    LiveOverlayController, LiveOverlayType>.internal(
  LiveOverlayController.new,
  name: r'liveOverlayControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveOverlayControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LiveOverlayController = AutoDisposeNotifier<LiveOverlayType>;
String _$livePlayerControllerHash() =>
    r'de4eb60d0efc6a7f64b082e3c74d8fd5ffe435fc';

/// See also [LivePlayerController].
@ProviderFor(LivePlayerController)
final livePlayerControllerProvider =
    AutoDisposeNotifierProvider<LivePlayerController, void>.internal(
  LivePlayerController.new,
  name: r'livePlayerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$livePlayerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LivePlayerController = AutoDisposeNotifier<void>;
String _$livePlayerOverlayTimerHash() =>
    r'fc60fe28900692c223d9b13288a2e18ed6898ce2';

/// Set this true to ensure that the existing state is maintained wherever this timer is called.
///
/// Copied from [LivePlayerOverlayTimer].
@ProviderFor(LivePlayerOverlayTimer)
final livePlayerOverlayTimerProvider =
    NotifierProvider<LivePlayerOverlayTimer, Timer?>.internal(
  LivePlayerOverlayTimer.new,
  name: r'livePlayerOverlayTimerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$livePlayerOverlayTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LivePlayerOverlayTimer = Notifier<Timer?>;
String _$livePlayerScreenModeControllerHash() =>
    r'f391ec1dfa593c9255a993fba1073815cb2c0d74';

/// See also [LivePlayerScreenModeController].
@ProviderFor(LivePlayerScreenModeController)
final livePlayerScreenModeControllerProvider = AutoDisposeNotifierProvider<
    LivePlayerScreenModeController, LivePlayerScreenMode>.internal(
  LivePlayerScreenModeController.new,
  name: r'livePlayerScreenModeControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$livePlayerScreenModeControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LivePlayerScreenModeController
    = AutoDisposeNotifier<LivePlayerScreenMode>;
String _$liveStatusControllerHash() =>
    r'948fdc156a39f1af64af01de6ca0a2a6b5fa0bda';

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

abstract class _$LiveStatusController
    extends BuildlessAutoDisposeAsyncNotifier<LiveStatus?> {
  late final String channelId;

  FutureOr<LiveStatus?> build({
    required String channelId,
  });
}

/// Show current live status with the main controls
///
/// Copied from [LiveStatusController].
@ProviderFor(LiveStatusController)
const liveStatusControllerProvider = LiveStatusControllerFamily();

/// Show current live status with the main controls
///
/// Copied from [LiveStatusController].
class LiveStatusControllerFamily extends Family<AsyncValue<LiveStatus?>> {
  /// Show current live status with the main controls
  ///
  /// Copied from [LiveStatusController].
  const LiveStatusControllerFamily();

  /// Show current live status with the main controls
  ///
  /// Copied from [LiveStatusController].
  LiveStatusControllerProvider call({
    required String channelId,
  }) {
    return LiveStatusControllerProvider(
      channelId: channelId,
    );
  }

  @override
  LiveStatusControllerProvider getProviderOverride(
    covariant LiveStatusControllerProvider provider,
  ) {
    return call(
      channelId: provider.channelId,
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
  String? get name => r'liveStatusControllerProvider';
}

/// Show current live status with the main controls
///
/// Copied from [LiveStatusController].
class LiveStatusControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LiveStatusController, LiveStatus?> {
  /// Show current live status with the main controls
  ///
  /// Copied from [LiveStatusController].
  LiveStatusControllerProvider({
    required String channelId,
  }) : this._internal(
          () => LiveStatusController()..channelId = channelId,
          from: liveStatusControllerProvider,
          name: r'liveStatusControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$liveStatusControllerHash,
          dependencies: LiveStatusControllerFamily._dependencies,
          allTransitiveDependencies:
              LiveStatusControllerFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  LiveStatusControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.channelId,
  }) : super.internal();

  final String channelId;

  @override
  FutureOr<LiveStatus?> runNotifierBuild(
    covariant LiveStatusController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
    );
  }

  @override
  Override overrideWith(LiveStatusController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LiveStatusControllerProvider._internal(
        () => create()..channelId = channelId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        channelId: channelId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LiveStatusController, LiveStatus?>
      createElement() {
    return _LiveStatusControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LiveStatusControllerProvider &&
        other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LiveStatusControllerRef
    on AutoDisposeAsyncNotifierProviderRef<LiveStatus?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _LiveStatusControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LiveStatusController,
        LiveStatus?> with LiveStatusControllerRef {
  _LiveStatusControllerProviderElement(super.provider);

  @override
  String get channelId => (origin as LiveStatusControllerProvider).channelId;
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
String _$multiviewMainScreenIndexHash() =>
    r'b635cec08842a099f524d6a8062b7a832bc45649';

/// See also [MultiviewMainScreenIndex].
@ProviderFor(MultiviewMainScreenIndex)
final multiviewMainScreenIndexProvider =
    AutoDisposeNotifierProvider<MultiviewMainScreenIndex, int?>.internal(
  MultiviewMainScreenIndex.new,
  name: r'multiviewMainScreenIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$multiviewMainScreenIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MultiviewMainScreenIndex = AutoDisposeNotifier<int?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
