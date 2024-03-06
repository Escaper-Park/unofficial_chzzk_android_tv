// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelControllerHash() => r'a0e6b5e1b9311d78ef0bfcddfa951e4a545e6f73';

/// See also [ChannelController].
@ProviderFor(ChannelController)
final channelControllerProvider =
    AutoDisposeAsyncNotifierProvider<ChannelController, Channel?>.internal(
  ChannelController.new,
  name: r'channelControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$channelControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChannelController = AutoDisposeAsyncNotifier<Channel?>;
String _$channelLiveControllerHash() =>
    r'c2da27e0721471adeb5a6b1fac0af57607f6bf62';

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

abstract class _$ChannelLiveController
    extends BuildlessAutoDisposeAsyncNotifier<LiveDetail?> {
  late final String channelId;

  FutureOr<LiveDetail?> build({
    required String channelId,
  });
}

/// See also [ChannelLiveController].
@ProviderFor(ChannelLiveController)
const channelLiveControllerProvider = ChannelLiveControllerFamily();

/// See also [ChannelLiveController].
class ChannelLiveControllerFamily extends Family<AsyncValue<LiveDetail?>> {
  /// See also [ChannelLiveController].
  const ChannelLiveControllerFamily();

  /// See also [ChannelLiveController].
  ChannelLiveControllerProvider call({
    required String channelId,
  }) {
    return ChannelLiveControllerProvider(
      channelId: channelId,
    );
  }

  @override
  ChannelLiveControllerProvider getProviderOverride(
    covariant ChannelLiveControllerProvider provider,
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
  String? get name => r'channelLiveControllerProvider';
}

/// See also [ChannelLiveController].
class ChannelLiveControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChannelLiveController,
        LiveDetail?> {
  /// See also [ChannelLiveController].
  ChannelLiveControllerProvider({
    required String channelId,
  }) : this._internal(
          () => ChannelLiveController()..channelId = channelId,
          from: channelLiveControllerProvider,
          name: r'channelLiveControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$channelLiveControllerHash,
          dependencies: ChannelLiveControllerFamily._dependencies,
          allTransitiveDependencies:
              ChannelLiveControllerFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  ChannelLiveControllerProvider._internal(
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
  FutureOr<LiveDetail?> runNotifierBuild(
    covariant ChannelLiveController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
    );
  }

  @override
  Override overrideWith(ChannelLiveController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChannelLiveControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ChannelLiveController, LiveDetail?>
      createElement() {
    return _ChannelLiveControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelLiveControllerProvider &&
        other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChannelLiveControllerRef
    on AutoDisposeAsyncNotifierProviderRef<LiveDetail?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _ChannelLiveControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChannelLiveController,
        LiveDetail?> with ChannelLiveControllerRef {
  _ChannelLiveControllerProviderElement(super.provider);

  @override
  String get channelId => (origin as ChannelLiveControllerProvider).channelId;
}

String _$channelVodControllerHash() =>
    r'd3cae44e11cd006b9644a45c3bb5a3654b114935';

abstract class _$ChannelVodController
    extends BuildlessAutoDisposeAsyncNotifier<List<Vod>?> {
  late final String channelId;

  FutureOr<List<Vod>?> build({
    required String channelId,
  });
}

/// See also [ChannelVodController].
@ProviderFor(ChannelVodController)
const channelVodControllerProvider = ChannelVodControllerFamily();

/// See also [ChannelVodController].
class ChannelVodControllerFamily extends Family<AsyncValue<List<Vod>?>> {
  /// See also [ChannelVodController].
  const ChannelVodControllerFamily();

  /// See also [ChannelVodController].
  ChannelVodControllerProvider call({
    required String channelId,
  }) {
    return ChannelVodControllerProvider(
      channelId: channelId,
    );
  }

  @override
  ChannelVodControllerProvider getProviderOverride(
    covariant ChannelVodControllerProvider provider,
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
  String? get name => r'channelVodControllerProvider';
}

/// See also [ChannelVodController].
class ChannelVodControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ChannelVodController, List<Vod>?> {
  /// See also [ChannelVodController].
  ChannelVodControllerProvider({
    required String channelId,
  }) : this._internal(
          () => ChannelVodController()..channelId = channelId,
          from: channelVodControllerProvider,
          name: r'channelVodControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$channelVodControllerHash,
          dependencies: ChannelVodControllerFamily._dependencies,
          allTransitiveDependencies:
              ChannelVodControllerFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  ChannelVodControllerProvider._internal(
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
  FutureOr<List<Vod>?> runNotifierBuild(
    covariant ChannelVodController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
    );
  }

  @override
  Override overrideWith(ChannelVodController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChannelVodControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ChannelVodController, List<Vod>?>
      createElement() {
    return _ChannelVodControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelVodControllerProvider &&
        other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChannelVodControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Vod>?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _ChannelVodControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChannelVodController,
        List<Vod>?> with ChannelVodControllerRef {
  _ChannelVodControllerProviderElement(super.provider);

  @override
  String get channelId => (origin as ChannelVodControllerProvider).channelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
