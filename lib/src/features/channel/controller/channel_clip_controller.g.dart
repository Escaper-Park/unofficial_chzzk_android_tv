// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_clip_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelClipControllerHash() =>
    r'01fe362b74328fb47d7f99c415879ca69cf01509';

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

abstract class _$ChannelClipController
    extends BuildlessAutoDisposeAsyncNotifier<List<NaverClip>?> {
  late final String channelId;

  FutureOr<List<NaverClip>?> build({
    required String channelId,
  });
}

/// See also [ChannelClipController].
@ProviderFor(ChannelClipController)
const channelClipControllerProvider = ChannelClipControllerFamily();

/// See also [ChannelClipController].
class ChannelClipControllerFamily extends Family<AsyncValue<List<NaverClip>?>> {
  /// See also [ChannelClipController].
  const ChannelClipControllerFamily();

  /// See also [ChannelClipController].
  ChannelClipControllerProvider call({
    required String channelId,
  }) {
    return ChannelClipControllerProvider(
      channelId: channelId,
    );
  }

  @override
  ChannelClipControllerProvider getProviderOverride(
    covariant ChannelClipControllerProvider provider,
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
  String? get name => r'channelClipControllerProvider';
}

/// See also [ChannelClipController].
class ChannelClipControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChannelClipController,
        List<NaverClip>?> {
  /// See also [ChannelClipController].
  ChannelClipControllerProvider({
    required String channelId,
  }) : this._internal(
          () => ChannelClipController()..channelId = channelId,
          from: channelClipControllerProvider,
          name: r'channelClipControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$channelClipControllerHash,
          dependencies: ChannelClipControllerFamily._dependencies,
          allTransitiveDependencies:
              ChannelClipControllerFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  ChannelClipControllerProvider._internal(
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
  FutureOr<List<NaverClip>?> runNotifierBuild(
    covariant ChannelClipController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
    );
  }

  @override
  Override overrideWith(ChannelClipController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChannelClipControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ChannelClipController,
      List<NaverClip>?> createElement() {
    return _ChannelClipControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelClipControllerProvider &&
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
mixin ChannelClipControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<NaverClip>?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _ChannelClipControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChannelClipController,
        List<NaverClip>?> with ChannelClipControllerRef {
  _ChannelClipControllerProviderElement(super.provider);

  @override
  String get channelId => (origin as ChannelClipControllerProvider).channelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
