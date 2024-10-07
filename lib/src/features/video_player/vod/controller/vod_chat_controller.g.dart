// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_chat_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vodChatQueueHash() => r'aa5c89bcb02574528533b2f25504e3daf708ee07';

/// See also [VodChatQueue].
@ProviderFor(VodChatQueue)
final vodChatQueueProvider =
    AsyncNotifierProvider<VodChatQueue, VodChatResponse?>.internal(
  VodChatQueue.new,
  name: r'vodChatQueueProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$vodChatQueueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VodChatQueue = AsyncNotifier<VodChatResponse?>;
String _$vodChatControllerHash() => r'dae1615c084a87a255eb244568c28aa7f7dcec44';

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

abstract class _$VodChatController
    extends BuildlessAutoDisposeAsyncNotifier<List<VodChat>> {
  late final VideoPlayerController controller;

  FutureOr<List<VodChat>> build({
    required VideoPlayerController controller,
  });
}

/// See also [VodChatController].
@ProviderFor(VodChatController)
const vodChatControllerProvider = VodChatControllerFamily();

/// See also [VodChatController].
class VodChatControllerFamily extends Family<AsyncValue<List<VodChat>>> {
  /// See also [VodChatController].
  const VodChatControllerFamily();

  /// See also [VodChatController].
  VodChatControllerProvider call({
    required VideoPlayerController controller,
  }) {
    return VodChatControllerProvider(
      controller: controller,
    );
  }

  @override
  VodChatControllerProvider getProviderOverride(
    covariant VodChatControllerProvider provider,
  ) {
    return call(
      controller: provider.controller,
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
  String? get name => r'vodChatControllerProvider';
}

/// See also [VodChatController].
class VodChatControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    VodChatController, List<VodChat>> {
  /// See also [VodChatController].
  VodChatControllerProvider({
    required VideoPlayerController controller,
  }) : this._internal(
          () => VodChatController()..controller = controller,
          from: vodChatControllerProvider,
          name: r'vodChatControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vodChatControllerHash,
          dependencies: VodChatControllerFamily._dependencies,
          allTransitiveDependencies:
              VodChatControllerFamily._allTransitiveDependencies,
          controller: controller,
        );

  VodChatControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.controller,
  }) : super.internal();

  final VideoPlayerController controller;

  @override
  FutureOr<List<VodChat>> runNotifierBuild(
    covariant VodChatController notifier,
  ) {
    return notifier.build(
      controller: controller,
    );
  }

  @override
  Override overrideWith(VodChatController Function() create) {
    return ProviderOverride(
      origin: this,
      override: VodChatControllerProvider._internal(
        () => create()..controller = controller,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        controller: controller,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<VodChatController, List<VodChat>>
      createElement() {
    return _VodChatControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VodChatControllerProvider && other.controller == controller;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VodChatControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<VodChat>> {
  /// The parameter `controller` of this provider.
  VideoPlayerController get controller;
}

class _VodChatControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<VodChatController,
        List<VodChat>> with VodChatControllerRef {
  _VodChatControllerProviderElement(super.provider);

  @override
  VideoPlayerController get controller =>
      (origin as VodChatControllerProvider).controller;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
