// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_live.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentChannelLiveDetailHash() =>
    r'e62283e73b660a83f1aa6020be1ac0b428d7e4d1';

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

/// See also [currentChannelLiveDetail].
@ProviderFor(currentChannelLiveDetail)
const currentChannelLiveDetailProvider = CurrentChannelLiveDetailFamily();

/// See also [currentChannelLiveDetail].
class CurrentChannelLiveDetailFamily extends Family<AsyncValue<LiveDetail?>> {
  /// See also [currentChannelLiveDetail].
  const CurrentChannelLiveDetailFamily();

  /// See also [currentChannelLiveDetail].
  CurrentChannelLiveDetailProvider call({
    required String channelId,
  }) {
    return CurrentChannelLiveDetailProvider(
      channelId: channelId,
    );
  }

  @override
  CurrentChannelLiveDetailProvider getProviderOverride(
    covariant CurrentChannelLiveDetailProvider provider,
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
  String? get name => r'currentChannelLiveDetailProvider';
}

/// See also [currentChannelLiveDetail].
class CurrentChannelLiveDetailProvider
    extends AutoDisposeFutureProvider<LiveDetail?> {
  /// See also [currentChannelLiveDetail].
  CurrentChannelLiveDetailProvider({
    required String channelId,
  }) : this._internal(
          (ref) => currentChannelLiveDetail(
            ref as CurrentChannelLiveDetailRef,
            channelId: channelId,
          ),
          from: currentChannelLiveDetailProvider,
          name: r'currentChannelLiveDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentChannelLiveDetailHash,
          dependencies: CurrentChannelLiveDetailFamily._dependencies,
          allTransitiveDependencies:
              CurrentChannelLiveDetailFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  CurrentChannelLiveDetailProvider._internal(
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
    FutureOr<LiveDetail?> Function(CurrentChannelLiveDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrentChannelLiveDetailProvider._internal(
        (ref) => create(ref as CurrentChannelLiveDetailRef),
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
    return _CurrentChannelLiveDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentChannelLiveDetailProvider &&
        other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentChannelLiveDetailRef on AutoDisposeFutureProviderRef<LiveDetail?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _CurrentChannelLiveDetailProviderElement
    extends AutoDisposeFutureProviderElement<LiveDetail?>
    with CurrentChannelLiveDetailRef {
  _CurrentChannelLiveDetailProviderElement(super.provider);

  @override
  String get channelId =>
      (origin as CurrentChannelLiveDetailProvider).channelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
