// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatRepositoryHash() => r'2c0b5dd326021fb661fb4bcb422bee085338da3a';

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
    required WebSocketChannel wsChannel,
    required String chatChannelId,
    required Dio dio,
  }) {
    return ChatRepositoryProvider(
      wsChannel: wsChannel,
      chatChannelId: chatChannelId,
      dio: dio,
    );
  }

  @override
  ChatRepositoryProvider getProviderOverride(
    covariant ChatRepositoryProvider provider,
  ) {
    return call(
      wsChannel: provider.wsChannel,
      chatChannelId: provider.chatChannelId,
      dio: provider.dio,
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
    required WebSocketChannel wsChannel,
    required String chatChannelId,
    required Dio dio,
  }) : this._internal(
          (ref) => chatRepository(
            ref as ChatRepositoryRef,
            wsChannel: wsChannel,
            chatChannelId: chatChannelId,
            dio: dio,
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
          wsChannel: wsChannel,
          chatChannelId: chatChannelId,
          dio: dio,
        );

  ChatRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.wsChannel,
    required this.chatChannelId,
    required this.dio,
  }) : super.internal();

  final WebSocketChannel wsChannel;
  final String chatChannelId;
  final Dio dio;

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
        wsChannel: wsChannel,
        chatChannelId: chatChannelId,
        dio: dio,
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
        other.wsChannel == wsChannel &&
        other.chatChannelId == chatChannelId &&
        other.dio == dio;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, wsChannel.hashCode);
    hash = _SystemHash.combine(hash, chatChannelId.hashCode);
    hash = _SystemHash.combine(hash, dio.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatRepositoryRef on AutoDisposeProviderRef<ChatRepository> {
  /// The parameter `wsChannel` of this provider.
  WebSocketChannel get wsChannel;

  /// The parameter `chatChannelId` of this provider.
  String get chatChannelId;

  /// The parameter `dio` of this provider.
  Dio get dio;
}

class _ChatRepositoryProviderElement
    extends AutoDisposeProviderElement<ChatRepository> with ChatRepositoryRef {
  _ChatRepositoryProviderElement(super.provider);

  @override
  WebSocketChannel get wsChannel =>
      (origin as ChatRepositoryProvider).wsChannel;
  @override
  String get chatChannelId => (origin as ChatRepositoryProvider).chatChannelId;
  @override
  Dio get dio => (origin as ChatRepositoryProvider).dio;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
