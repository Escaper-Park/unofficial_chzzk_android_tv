// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_live_container.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentChannelLiveHash() =>
    r'9c767d41281c62d65049b79f166a78c51f567b71';

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

/// See also [currentChannelLive].
@ProviderFor(currentChannelLive)
const currentChannelLiveProvider = CurrentChannelLiveFamily();

/// See also [currentChannelLive].
class CurrentChannelLiveFamily extends Family<AsyncValue<LiveDetail?>> {
  /// See also [currentChannelLive].
  const CurrentChannelLiveFamily();

  /// See also [currentChannelLive].
  CurrentChannelLiveProvider call({
    required String channelId,
  }) {
    return CurrentChannelLiveProvider(
      channelId: channelId,
    );
  }

  @override
  CurrentChannelLiveProvider getProviderOverride(
    covariant CurrentChannelLiveProvider provider,
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
  String? get name => r'currentChannelLiveProvider';
}

/// See also [currentChannelLive].
class CurrentChannelLiveProvider
    extends AutoDisposeFutureProvider<LiveDetail?> {
  /// See also [currentChannelLive].
  CurrentChannelLiveProvider({
    required String channelId,
  }) : this._internal(
          (ref) => currentChannelLive(
            ref as CurrentChannelLiveRef,
            channelId: channelId,
          ),
          from: currentChannelLiveProvider,
          name: r'currentChannelLiveProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentChannelLiveHash,
          dependencies: CurrentChannelLiveFamily._dependencies,
          allTransitiveDependencies:
              CurrentChannelLiveFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  CurrentChannelLiveProvider._internal(
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
  Override overrideWith(
    FutureOr<LiveDetail?> Function(CurrentChannelLiveRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrentChannelLiveProvider._internal(
        (ref) => create(ref as CurrentChannelLiveRef),
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
  AutoDisposeFutureProviderElement<LiveDetail?> createElement() {
    return _CurrentChannelLiveProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentChannelLiveProvider && other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentChannelLiveRef on AutoDisposeFutureProviderRef<LiveDetail?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _CurrentChannelLiveProviderElement
    extends AutoDisposeFutureProviderElement<LiveDetail?>
    with CurrentChannelLiveRef {
  _CurrentChannelLiveProviderElement(super.provider);

  @override
  String get channelId => (origin as CurrentChannelLiveProvider).channelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
