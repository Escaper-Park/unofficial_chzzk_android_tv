// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatRepositoryHash() => r'8c99a7e929fe2eeadc54cba86e7c375ccfa57361';

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

/// See also [chatRepository].
@ProviderFor(chatRepository)
const chatRepositoryProvider = ChatRepositoryFamily();

/// See also [chatRepository].
class ChatRepositoryFamily extends Family<ChatRepository> {
  /// See also [chatRepository].
  const ChatRepositoryFamily();

  /// See also [chatRepository].
  ChatRepositoryProvider call({
    required WebSocketChannel channel,
    required String chatChannelId,
  }) {
    return ChatRepositoryProvider(
      channel: channel,
      chatChannelId: chatChannelId,
    );
  }

  @override
  ChatRepositoryProvider getProviderOverride(
    covariant ChatRepositoryProvider provider,
  ) {
    return call(
      channel: provider.channel,
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
  String? get name => r'chatRepositoryProvider';
}

/// See also [chatRepository].
class ChatRepositoryProvider extends AutoDisposeProvider<ChatRepository> {
  /// See also [chatRepository].
  ChatRepositoryProvider({
    required WebSocketChannel channel,
    required String chatChannelId,
  }) : this._internal(
          (ref) => chatRepository(
            ref as ChatRepositoryRef,
            channel: channel,
            chatChannelId: chatChannelId,
          ),
          from: chatRepositoryProvider,
          name: r'chatRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatRepositoryHash,
          dependencies: ChatRepositoryFamily._dependencies,
          allTransitiveDependencies:
              ChatRepositoryFamily._allTransitiveDependencies,
          channel: channel,
          chatChannelId: chatChannelId,
        );

  ChatRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.channel,
    required this.chatChannelId,
  }) : super.internal();

  final WebSocketChannel channel;
  final String chatChannelId;

  @override
  Override overrideWith(
    ChatRepository Function(ChatRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChatRepositoryProvider._internal(
        (ref) => create(ref as ChatRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        channel: channel,
        chatChannelId: chatChannelId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ChatRepository> createElement() {
    return _ChatRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatRepositoryProvider &&
        other.channel == channel &&
        other.chatChannelId == chatChannelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channel.hashCode);
    hash = _SystemHash.combine(hash, chatChannelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatRepositoryRef on AutoDisposeProviderRef<ChatRepository> {
  /// The parameter `channel` of this provider.
  WebSocketChannel get channel;

  /// The parameter `chatChannelId` of this provider.
  String get chatChannelId;
}

class _ChatRepositoryProviderElement
    extends AutoDisposeProviderElement<ChatRepository> with ChatRepositoryRef {
  _ChatRepositoryProviderElement(super.provider);

  @override
  WebSocketChannel get channel => (origin as ChatRepositoryProvider).channel;
  @override
  String get chatChannelId => (origin as ChatRepositoryProvider).chatChannelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
