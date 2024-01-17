// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_videos.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelVideoListHash() => r'85a5fbdf66c22835e30b8d07657c4d91ce66392e';

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

/// See also [channelVideoList].
@ProviderFor(channelVideoList)
const channelVideoListProvider = ChannelVideoListFamily();

/// See also [channelVideoList].
class ChannelVideoListFamily extends Family<AsyncValue<List<BaseVideo>?>> {
  /// See also [channelVideoList].
  const ChannelVideoListFamily();

  /// See also [channelVideoList].
  ChannelVideoListProvider call({
    required String channelId,
  }) {
    return ChannelVideoListProvider(
      channelId: channelId,
    );
  }

  @override
  ChannelVideoListProvider getProviderOverride(
    covariant ChannelVideoListProvider provider,
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
  String? get name => r'channelVideoListProvider';
}

/// See also [channelVideoList].
class ChannelVideoListProvider
    extends AutoDisposeFutureProvider<List<BaseVideo>?> {
  /// See also [channelVideoList].
  ChannelVideoListProvider({
    required String channelId,
  }) : this._internal(
          (ref) => channelVideoList(
            ref as ChannelVideoListRef,
            channelId: channelId,
          ),
          from: channelVideoListProvider,
          name: r'channelVideoListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$channelVideoListHash,
          dependencies: ChannelVideoListFamily._dependencies,
          allTransitiveDependencies:
              ChannelVideoListFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  ChannelVideoListProvider._internal(
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
    FutureOr<List<BaseVideo>?> Function(ChannelVideoListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChannelVideoListProvider._internal(
        (ref) => create(ref as ChannelVideoListRef),
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
  AutoDisposeFutureProviderElement<List<BaseVideo>?> createElement() {
    return _ChannelVideoListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelVideoListProvider && other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChannelVideoListRef on AutoDisposeFutureProviderRef<List<BaseVideo>?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _ChannelVideoListProviderElement
    extends AutoDisposeFutureProviderElement<List<BaseVideo>?>
    with ChannelVideoListRef {
  _ChannelVideoListProviderElement(super.provider);

  @override
  String get channelId => (origin as ChannelVideoListProvider).channelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
