// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_vod_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelVodControllerHash() =>
    r'396c2df2cebc5cb6ef982140fe01ad929d09d381';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
