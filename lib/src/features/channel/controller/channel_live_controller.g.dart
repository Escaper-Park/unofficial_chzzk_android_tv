// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_live_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelLiveControllerHash() =>
    r'6d5c3e467464a950d5305962b62cd8cc2a190272';

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

/// Get current selected channel's live if the streamer is broadcast.
///
/// Copied from [ChannelLiveController].
@ProviderFor(ChannelLiveController)
const channelLiveControllerProvider = ChannelLiveControllerFamily();

/// Get current selected channel's live if the streamer is broadcast.
///
/// Copied from [ChannelLiveController].
class ChannelLiveControllerFamily extends Family<AsyncValue<LiveDetail?>> {
  /// Get current selected channel's live if the streamer is broadcast.
  ///
  /// Copied from [ChannelLiveController].
  const ChannelLiveControllerFamily();

  /// Get current selected channel's live if the streamer is broadcast.
  ///
  /// Copied from [ChannelLiveController].
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

/// Get current selected channel's live if the streamer is broadcast.
///
/// Copied from [ChannelLiveController].
class ChannelLiveControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChannelLiveController,
        LiveDetail?> {
  /// Get current selected channel's live if the streamer is broadcast.
  ///
  /// Copied from [ChannelLiveController].
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
