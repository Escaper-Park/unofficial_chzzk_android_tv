import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../common/constants/api.dart';
import '../../../common/constants/enums.dart' show DonationType;
import '../../../utils/dio/dio_client.dart';
import '../../user/controller/private_user_blocks_controller.dart';
import '../../user/controller/user_controller.dart';
import '../../chat/model/chat.dart';
import '../../chat/model/recent_chat.dart';
import '../../chat/repository/chat_repository.dart';

part 'live_chat_controller.g.dart';

@riverpod
class LiveChatController extends _$LiveChatController {
  final int _pingInterval = 20000;
  final int _maxChatItemLength = 200;
  final int _dropChatCount = 150;

  late ChatRepository _repository;
  late WebSocketChannel _wsChannel;
  late List<String> _privateUserBlocks;

  // Ping
  Timer? _pingTimer;
  String? _uid;
  String? _sid;

  @override
  Stream<List<dynamic>> build({
    required String channelId,
    required String chatChannelId,
  }) async* {
    // init
    await _init();
    // disconnect chat ready
    _onDispose();
    // connect to chat server
    await _connect();

    yield* handleMsg();

    return;
  }

  Future<void> _init() async {
    final user = await ref.watch(userControllerProvider.future);
    final dio = ref.watch(dioClientProvider);

    _uid = user?.userIdHash;

    Random random = Random();
    int serverNo = random.nextInt(5) + 1;

    _wsChannel =
        WebSocketChannel.connect(Uri.parse(BaseUrl.chatServer(serverNo)));

    _privateUserBlocks =
        await ref.read(privateUserBlocksControllerProvider.future);

    _repository = ChatRepository(
      chatChannelId: chatChannelId,
      wsChannel: _wsChannel,
      dio: dio,
    );

    _pingTimer = null;
  }

  Future<void> _connect() async {
    await _repository.connect(uid: _uid);
  }

  void _onDispose() {
    ref.onDispose(disconnect);
  }

  void _runPingTimer() {
    _clearPingTimer();

    _pingTimer = Timer(
      Duration(milliseconds: _pingInterval),
      () {
        _repository.sendPing();
        _pingTimer = null;
      },
    );
  }

  void _clearPingTimer() {
    _pingTimer?.cancel();
    _pingTimer = null;
  }

  void _requestRecentChat() {
    _repository.requestRecentChat(sid: _sid);
  }

  Future<void> disconnect() async {
    _clearPingTimer();
    await _repository.disconnect();
  }

  Stream<List<dynamic>> handleMsg() async* {
    List<dynamic> allMessages = [];
    _runPingTimer();

    await for (final msg in _wsChannel.stream) {
      Map<String, dynamic> response = json.decode(msg);
      _runPingTimer();

      switch (response['cmd']) {
        // ping
        case 0:
          _repository.sendPong();
          break;
        // pong
        case 10000:
          break;
        // connect
        case 10100:
          _sid = response['bdy']['sid'];
          // request recent chat.
          _requestRecentChat();
          break;
        // recent chat
        case 15101:
          try {
            final bdy = response['bdy'] as Map<String, dynamic>;
            final rawList = (bdy['messageList'] as List<dynamic>)
                .cast<Map<String, dynamic>>();

            final chatMsgs = rawList
                .map(RecentChatMsg.fromJson)
                .where(
                  (msg) =>
                      msg.messageTypeCode == 1 &&
                      !_privateUserBlocks.contains(msg.userId),
                )
                .toList();

            allMessages = chatMsgs.reversed.toList();
          } catch (_) {}
          yield allMessages;
          break;
        // chat
        case 93101:
          try {
            final newChats = Chat.fromJson(response)
                .bdy
                .where(
                  (chat) => !_privateUserBlocks.contains(chat.uid),
                )
                .toList()
                .reversed
                .toList();

            allMessages = [...newChats, ...allMessages];
            if (allMessages.length > _maxChatItemLength) {
              final keepUpTo = allMessages.length - _dropChatCount;
              allMessages = allMessages.sublist(0, keepUpTo);
            }
          } catch (_) {}
          yield allMessages;
          break;

        // donation
        case 93102:
          try {
            final newChats = Chat.fromJson(response)
                .bdy
                .where(
                  (chat) =>
                      !_privateUserBlocks.contains(chat.uid) &&
                      chat.extras?.donationType == DonationType.chat.value,
                )
                .toList();

            allMessages = [...newChats, ...allMessages];

            if (allMessages.length > _maxChatItemLength) {
              final keepUpTo = allMessages.length - _dropChatCount;
              allMessages = allMessages.sublist(0, keepUpTo);
            }
          } catch (_) {}
          yield allMessages;
          break;

        default:
          break;
      }
    }
  }
}
