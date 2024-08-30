// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_stream_status_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$liveStreamStatusControllerHash() =>
    r'b4c1bae7c7f7da0019cabdfaa3eaa98c101ff1bd';

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

abstract class _$LiveStreamStatusController
    extends BuildlessAutoDisposeAsyncNotifier<LiveStatus?> {
  late final String channelId;

  FutureOr<LiveStatus?> build({
    required String channelId,
  });
}

/// See also [LiveStreamStatusController].
@ProviderFor(LiveStreamStatusController)
const liveStreamStatusControllerProvider = LiveStreamStatusControllerFamily();

/// See also [LiveStreamStatusController].
class LiveStreamStatusControllerFamily extends Family<AsyncValue<LiveStatus?>> {
  /// See also [LiveStreamStatusController].
  const LiveStreamStatusControllerFamily();

  /// See also [LiveStreamStatusController].
  LiveStreamStatusControllerProvider call({
    required String channelId,
  }) {
    return LiveStreamStatusControllerProvider(
      channelId: channelId,
    );
  }

  @override
  LiveStreamStatusControllerProvider getProviderOverride(
    covariant LiveStreamStatusControllerProvider provider,
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
  String? get name => r'liveStreamStatusControllerProvider';
}

/// See also [LiveStreamStatusController].
class LiveStreamStatusControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LiveStreamStatusController,
        LiveStatus?> {
  /// See also [LiveStreamStatusController].
  LiveStreamStatusControllerProvider({
    required String channelId,
  }) : this._internal(
          () => LiveStreamStatusController()..channelId = channelId,
          from: liveStreamStatusControllerProvider,
          name: r'liveStreamStatusControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$liveStreamStatusControllerHash,
          dependencies: LiveStreamStatusControllerFamily._dependencies,
          allTransitiveDependencies:
              LiveStreamStatusControllerFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  LiveStreamStatusControllerProvider._internal(
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
    covariant LiveStreamStatusController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
    );
  }

  @override
  Override overrideWith(LiveStreamStatusController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LiveStreamStatusControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LiveStreamStatusController,
      LiveStatus?> createElement() {
    return _LiveStreamStatusControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LiveStreamStatusControllerProvider &&
        other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LiveStreamStatusControllerRef
    on AutoDisposeAsyncNotifierProviderRef<LiveStatus?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _LiveStreamStatusControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LiveStreamStatusController,
        LiveStatus?> with LiveStreamStatusControllerRef {
  _LiveStreamStatusControllerProviderElement(super.provider);

  @override
  String get channelId =>
      (origin as LiveStreamStatusControllerProvider).channelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
