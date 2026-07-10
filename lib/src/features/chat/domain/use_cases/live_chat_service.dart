import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:math';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../entities/chat.dart';
import '../failures/chat_failure.dart';
import '../repositories/chat_repository.dart';
import 'live_chat_message_parser.dart';

part 'live_chat_socket_connection.dart';
part 'live_chat_decode_worker.dart';
part 'live_chat_socket_frames.dart';
part 'live_chat_socket_helpers.dart';

typedef CreateLiveChatWebSocketChannel = WebSocketChannel Function(Uri uri);

final class LiveChatMessageBatch {
  const LiveChatMessageBatch({
    required this.messages,
    required this.replaceExisting,
  });

  final List<PlayerChatMessage> messages;
  final bool replaceExisting;
}

abstract interface class LiveChatConnection {
  Stream<LiveChatMessageBatch> get batches;

  Future<void> dispose();
}

final class LiveChatService {
  LiveChatService({
    required this.chatRepository,
    CreateLiveChatWebSocketChannel? createWebSocketChannel,
    Random? random,
    String Function()? idFactory,
    Duration? pingInterval,
    Duration? pongTimeout,
    Duration? disposeStepTimeout,
  }) : _createWebSocketChannel =
           createWebSocketChannel ?? WebSocketChannel.connect,
       _random = random ?? Random(),
       _idFactory = idFactory ?? _createClientId,
       _pingInterval = pingInterval ?? _defaultPingInterval,
       _pongTimeout = pongTimeout ?? _defaultPongTimeout,
       _disposeStepTimeout = disposeStepTimeout ?? _defaultDisposeStepTimeout;

  static const _websocketBaseHost = 'chat.naver.com';
  static const _chatServiceId = 'game';
  static const _connectVersion = '3';
  static const _locale = 'ko';
  static const _timezone = 'Asia/Seoul';
  static const _deviceType = 2001;
  static const _deviceName = 'Google Chrome/142.0.0.0';
  // CHZZK chat validates the web-client fingerprint used in connect frames.
  static const _osVersion = 'macOS/10.15.7';
  static const _libraryVersion = '4.9.3';
  static const _recentMessageCount = 20;
  static const _serverCount = 5;
  static const _defaultPingInterval = Duration(milliseconds: 25000);
  static const _defaultPongTimeout = Duration(seconds: 10);
  static const _defaultDisposeStepTimeout = Duration(seconds: 1);

  final ChatRepository chatRepository;
  final CreateLiveChatWebSocketChannel _createWebSocketChannel;
  final Random _random;
  final String Function() _idFactory;
  final Duration _pingInterval;
  final Duration _pongTimeout;
  final Duration _disposeStepTimeout;
  final String _windowId = _createClientId();

  Future<LiveChatConnection> connect(LiveChatSessionRequest request) async {
    if (request.channelId.isEmpty || request.chatChannelId.isEmpty) {
      throw ArgumentError('Live chat source ids must not be empty.');
    }

    final accessToken = await chatRepository.fetchAccessToken(
      channelId: request.chatChannelId,
    );
    final tokenValue = accessToken.accessToken.trim();
    if (tokenValue.isEmpty) {
      throw const ChatLoadFailure();
    }

    final serverNo = _random.nextInt(_serverCount) + 1;
    final uri = Uri.parse('wss://kr-ss$serverNo.$_websocketBaseHost/chat');
    final channel = _createWebSocketChannel(uri);
    return _LiveChatSocketConnection(
      channel: channel,
      chatChannelId: request.chatChannelId,
      accessToken: tokenValue,
      clientId: _idFactory(),
      windowId: _windowId,
      pingInterval: _pingInterval,
      pongTimeout: _pongTimeout,
      disposeStepTimeout: _disposeStepTimeout,
    )..start();
  }
}
