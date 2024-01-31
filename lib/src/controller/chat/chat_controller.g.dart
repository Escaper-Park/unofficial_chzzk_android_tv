// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatControllerHash() => r'4b92300225a547941f070ad56766492585797a97';

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

abstract class _$ChatController
    extends BuildlessAutoDisposeStreamNotifier<List<Chat>> {
  late final String channelId;
  late final String chatChannelId;

  Stream<List<Chat>> build({
    required String channelId,
    required String chatChannelId,
  });
}

/// See also [ChatController].
@ProviderFor(ChatController)
const chatControllerProvider = ChatControllerFamily();

/// See also [ChatController].
class ChatControllerFamily extends Family<AsyncValue<List<Chat>>> {
  /// See also [ChatController].
  const ChatControllerFamily();

  /// See also [ChatController].
  ChatControllerProvider call({
    required String channelId,
    required String chatChannelId,
  }) {
    return ChatControllerProvider(
      channelId: channelId,
      chatChannelId: chatChannelId,
    );
  }

  @override
  ChatControllerProvider getProviderOverride(
    covariant ChatControllerProvider provider,
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
  String? get name => r'chatControllerProvider';
}

/// See also [ChatController].
class ChatControllerProvider
    extends AutoDisposeStreamNotifierProviderImpl<ChatController, List<Chat>> {
  /// See also [ChatController].
  ChatControllerProvider({
    required String channelId,
    required String chatChannelId,
  }) : this._internal(
          () => ChatController()
            ..channelId = channelId
            ..chatChannelId = chatChannelId,
          from: chatControllerProvider,
          name: r'chatControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatControllerHash,
          dependencies: ChatControllerFamily._dependencies,
          allTransitiveDependencies:
              ChatControllerFamily._allTransitiveDependencies,
          channelId: channelId,
          chatChannelId: chatChannelId,
        );

  ChatControllerProvider._internal(
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
  Stream<List<Chat>> runNotifierBuild(
    covariant ChatController notifier,
  ) {
    return notifier.build(
      channelId: channelId,
      chatChannelId: chatChannelId,
    );
  }

  @override
  Override overrideWith(ChatController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatControllerProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<ChatController, List<Chat>>
      createElement() {
    return _ChatControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatControllerProvider &&
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

mixin ChatControllerRef on AutoDisposeStreamNotifierProviderRef<List<Chat>> {
  /// The parameter `channelId` of this provider.
  String get channelId;

  /// The parameter `chatChannelId` of this provider.
  String get chatChannelId;
}

class _ChatControllerProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ChatController, List<Chat>>
    with ChatControllerRef {
  _ChatControllerProviderElement(super.provider);

  @override
  String get channelId => (origin as ChatControllerProvider).channelId;
  @override
  String get chatChannelId => (origin as ChatControllerProvider).chatChannelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
