// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_chat_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$liveChatControllerHash() =>
    r'df086bb437c7af51ff4528621913943398f7bb7b';

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

abstract class _$LiveChatController
    extends BuildlessAutoDisposeStreamNotifier<List<dynamic>> {
  late final String channelId;
  late final String chatChannelId;

  Stream<List<dynamic>> build({
    required String channelId,
    required String chatChannelId,
  });
}

/// See also [LiveChatController].
@ProviderFor(LiveChatController)
const liveChatControllerProvider = LiveChatControllerFamily();

/// See also [LiveChatController].
class LiveChatControllerFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [LiveChatController].
  const LiveChatControllerFamily();

  /// See also [LiveChatController].
  LiveChatControllerProvider call({
    required String channelId,
    required String chatChannelId,
  }) {
    return LiveChatControllerProvider(
      channelId: channelId,
      chatChannelId: chatChannelId,
    );
  }

  @override
  LiveChatControllerProvider getProviderOverride(
    covariant LiveChatControllerProvider provider,
  ) {
    return call(
      channelId: provider.channelId,
      chatChannelId: provider.chatChannelId,
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
  String? get name => r'liveChatControllerProvider';
}

/// See also [LiveChatController].
class LiveChatControllerProvider extends AutoDisposeStreamNotifierProviderImpl<
    LiveChatController, List<dynamic>> {
  /// See also [LiveChatController].
  LiveChatControllerProvider({
    required String channelId,
    required String chatChannelId,
  }) : this._internal(
          () => LiveChatController()
            ..channelId = channelId
            ..chatChannelId = chatChannelId,
          from: liveChatControllerProvider,
          name: r'liveChatControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$liveChatControllerHash,
          dependencies: LiveChatControllerFamily._dependencies,
          allTransitiveDependencies:
              LiveChatControllerFamily._allTransitiveDependencies,
          channelId: channelId,
          chatChannelId: chatChannelId,
        );

  LiveChatControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.channelId,
    required this.chatChannelId,
  }) : super.internal();

  final String channelId;
  final String chatChannelId;

  @override
  Stream<List<dynamic>> runNotifierBuild(
    covariant LiveChatController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
      chatChannelId: chatChannelId,
    );
  }

  @override
  Override overrideWith(LiveChatController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LiveChatControllerProvider._internal(
        () => create()
          ..channelId = channelId
          ..chatChannelId = chatChannelId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        channelId: channelId,
        chatChannelId: chatChannelId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<LiveChatController, List<dynamic>>
      createElement() {
    return _LiveChatControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LiveChatControllerProvider &&
        other.channelId == channelId &&
        other.chatChannelId == chatChannelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);
    hash = _SystemHash.combine(hash, chatChannelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LiveChatControllerRef
    on AutoDisposeStreamNotifierProviderRef<List<dynamic>> {
  /// The parameter `channelId` of this provider.
  String get channelId;

  /// The parameter `chatChannelId` of this provider.
  String get chatChannelId;
}

class _LiveChatControllerProviderElement
    extends AutoDisposeStreamNotifierProviderElement<LiveChatController,
        List<dynamic>> with LiveChatControllerRef {
  _LiveChatControllerProviderElement(super.provider);

  @override
  String get channelId => (origin as LiveChatControllerProvider).channelId;
  @override
  String get chatChannelId =>
      (origin as LiveChatControllerProvider).chatChannelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
