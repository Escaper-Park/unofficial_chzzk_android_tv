// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelControllerHash() => r'f4f5fe654f886917280bcee0bb650cc918896310';

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

abstract class _$ChannelController
    extends BuildlessAutoDisposeAsyncNotifier<Channel?> {
  late final String routeName;

  FutureOr<Channel?> build({
    required String routeName,
  });
}

/// Channel screen's current selected channel.
///
/// Uses Result pattern for proper error handling and provides
/// follow/unfollow functionality with error feedback.
///
/// Copied from [ChannelController].
@ProviderFor(ChannelController)
const channelControllerProvider = ChannelControllerFamily();

/// Channel screen's current selected channel.
///
/// Uses Result pattern for proper error handling and provides
/// follow/unfollow functionality with error feedback.
///
/// Copied from [ChannelController].
class ChannelControllerFamily extends Family<AsyncValue<Channel?>> {
  /// Channel screen's current selected channel.
  ///
  /// Uses Result pattern for proper error handling and provides
  /// follow/unfollow functionality with error feedback.
  ///
  /// Copied from [ChannelController].
  const ChannelControllerFamily();

  /// Channel screen's current selected channel.
  ///
  /// Uses Result pattern for proper error handling and provides
  /// follow/unfollow functionality with error feedback.
  ///
  /// Copied from [ChannelController].
  ChannelControllerProvider call({
    required String routeName,
  }) {
    return ChannelControllerProvider(
      routeName: routeName,
    );
  }

  @override
  ChannelControllerProvider getProviderOverride(
    covariant ChannelControllerProvider provider,
  ) {
    return call(
      routeName: provider.routeName,
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
  String? get name => r'channelControllerProvider';
}

/// Channel screen's current selected channel.
///
/// Uses Result pattern for proper error handling and provides
/// follow/unfollow functionality with error feedback.
///
/// Copied from [ChannelController].
class ChannelControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChannelController, Channel?> {
  /// Channel screen's current selected channel.
  ///
  /// Uses Result pattern for proper error handling and provides
  /// follow/unfollow functionality with error feedback.
  ///
  /// Copied from [ChannelController].
  ChannelControllerProvider({
    required String routeName,
  }) : this._internal(
          () => ChannelController()..routeName = routeName,
          from: channelControllerProvider,
          name: r'channelControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$channelControllerHash,
          dependencies: ChannelControllerFamily._dependencies,
          allTransitiveDependencies:
              ChannelControllerFamily._allTransitiveDependencies,
          routeName: routeName,
        );

  ChannelControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.routeName,
  }) : super.internal();

  final String routeName;

  @override
  FutureOr<Channel?> runNotifierBuild(
    covariant ChannelController notifier,
  ) {
    return notifier.build(
      routeName: routeName,
    );
  }

  @override
  Override overrideWith(ChannelController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChannelControllerProvider._internal(
        () => create()..routeName = routeName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        routeName: routeName,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChannelController, Channel?>
      createElement() {
    return _ChannelControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelControllerProvider && other.routeName == routeName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, routeName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChannelControllerRef on AutoDisposeAsyncNotifierProviderRef<Channel?> {
  /// The parameter `routeName` of this provider.
  String get routeName;
}

class _ChannelControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChannelController, Channel?>
    with ChannelControllerRef {
  _ChannelControllerProviderElement(super.provider);

  @override
  String get routeName => (origin as ChannelControllerProvider).routeName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
