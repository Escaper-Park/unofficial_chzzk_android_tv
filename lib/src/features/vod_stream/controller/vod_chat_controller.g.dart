// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_chat_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vodChatQueueControllerHash() =>
    r'51f0635b612088c9d4c3d9a38ec7c8e0452e2804';

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

abstract class _$VodChatQueueController
    extends BuildlessAsyncNotifier<ListQueue<VodChat>> {
  late final int videoNo;

  FutureOr<ListQueue<VodChat>> build({
    required int videoNo,
  });
}

/// See also [VodChatQueueController].
@ProviderFor(VodChatQueueController)
const vodChatQueueControllerProvider = VodChatQueueControllerFamily();

/// See also [VodChatQueueController].
class VodChatQueueControllerFamily
    extends Family<AsyncValue<ListQueue<VodChat>>> {
  /// See also [VodChatQueueController].
  const VodChatQueueControllerFamily();

  /// See also [VodChatQueueController].
  VodChatQueueControllerProvider call({
    required int videoNo,
  }) {
    return VodChatQueueControllerProvider(
      videoNo: videoNo,
    );
  }

  @override
  VodChatQueueControllerProvider getProviderOverride(
    covariant VodChatQueueControllerProvider provider,
  ) {
    return call(
      videoNo: provider.videoNo,
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
  String? get name => r'vodChatQueueControllerProvider';
}

/// See also [VodChatQueueController].
class VodChatQueueControllerProvider extends AsyncNotifierProviderImpl<
    VodChatQueueController, ListQueue<VodChat>> {
  /// See also [VodChatQueueController].
  VodChatQueueControllerProvider({
    required int videoNo,
  }) : this._internal(
          () => VodChatQueueController()..videoNo = videoNo,
          from: vodChatQueueControllerProvider,
          name: r'vodChatQueueControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vodChatQueueControllerHash,
          dependencies: VodChatQueueControllerFamily._dependencies,
          allTransitiveDependencies:
              VodChatQueueControllerFamily._allTransitiveDependencies,
          videoNo: videoNo,
        );

  VodChatQueueControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.videoNo,
  }) : super.internal();

  final int videoNo;

  @override
  FutureOr<ListQueue<VodChat>> runNotifierBuild(
    covariant VodChatQueueController notifier,
  ) {
    return notifier.build(
      videoNo: videoNo,
    );
  }

  @override
  Override overrideWith(VodChatQueueController Function() create) {
    return ProviderOverride(
      origin: this,
      override: VodChatQueueControllerProvider._internal(
        () => create()..videoNo = videoNo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        videoNo: videoNo,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<VodChatQueueController, ListQueue<VodChat>>
      createElement() {
    return _VodChatQueueControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VodChatQueueControllerProvider && other.videoNo == videoNo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, videoNo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VodChatQueueControllerRef
    on AsyncNotifierProviderRef<ListQueue<VodChat>> {
  /// The parameter `videoNo` of this provider.
  int get videoNo;
}

class _VodChatQueueControllerProviderElement
    extends AsyncNotifierProviderElement<VodChatQueueController,
        ListQueue<VodChat>> with VodChatQueueControllerRef {
  _VodChatQueueControllerProviderElement(super.provider);

  @override
  int get videoNo => (origin as VodChatQueueControllerProvider).videoNo;
}

String _$vodChatControllerHash() => r'0e1b0100261277bfd8c34f17e8262082e70e95ca';

abstract class _$VodChatController
    extends BuildlessAutoDisposeStreamNotifier<List<VodChat>> {
  late final VideoPlayerController controller;
  late final int videoNo;

  Stream<List<VodChat>> build({
    required VideoPlayerController controller,
    required int videoNo,
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
    required int videoNo,
  }) {
    return VodChatControllerProvider(
      controller: controller,
      videoNo: videoNo,
    );
  }

  @override
  VodChatControllerProvider getProviderOverride(
    covariant VodChatControllerProvider provider,
  ) {
    return call(
      controller: provider.controller,
      videoNo: provider.videoNo,
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
class VodChatControllerProvider extends AutoDisposeStreamNotifierProviderImpl<
    VodChatController, List<VodChat>> {
  /// See also [VodChatController].
  VodChatControllerProvider({
    required VideoPlayerController controller,
    required int videoNo,
  }) : this._internal(
          () => VodChatController()
            ..controller = controller
            ..videoNo = videoNo,
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
          videoNo: videoNo,
        );

  VodChatControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.controller,
    required this.videoNo,
  }) : super.internal();

  final VideoPlayerController controller;
  final int videoNo;

  @override
  Stream<List<VodChat>> runNotifierBuild(
    covariant VodChatController notifier,
  ) {
    return notifier.build(
      controller: controller,
      videoNo: videoNo,
    );
  }

  @override
  Override overrideWith(VodChatController Function() create) {
    return ProviderOverride(
      origin: this,
      override: VodChatControllerProvider._internal(
        () => create()
          ..controller = controller
          ..videoNo = videoNo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        controller: controller,
        videoNo: videoNo,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<VodChatController, List<VodChat>>
      createElement() {
    return _VodChatControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VodChatControllerProvider &&
        other.controller == controller &&
        other.videoNo == videoNo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);
    hash = _SystemHash.combine(hash, videoNo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VodChatControllerRef
    on AutoDisposeStreamNotifierProviderRef<List<VodChat>> {
  /// The parameter `controller` of this provider.
  VideoPlayerController get controller;

  /// The parameter `videoNo` of this provider.
  int get videoNo;
}

class _VodChatControllerProviderElement
    extends AutoDisposeStreamNotifierProviderElement<VodChatController,
        List<VodChat>> with VodChatControllerRef {
  _VodChatControllerProviderElement(super.provider);

  @override
  VideoPlayerController get controller =>
      (origin as VodChatControllerProvider).controller;
  @override
  int get videoNo => (origin as VodChatControllerProvider).videoNo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
