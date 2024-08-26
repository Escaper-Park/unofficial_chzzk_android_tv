import 'dart:convert';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../common/constants/api.dart';
import '../../../utils/dio/dio_client.dart';
import '../../user/controller/user_controller.dart';

import '../repository/chat_repository.dart';

import '../model/chat.dart';
import '../model/recent_chat.dart';

part 'chat_controller.g.dart';

/// Chat stream controller
@riverpod
class ChatController extends _$ChatController {
  // Options? _options;
  String? _uid;
  String? _sid;

  late ChatRepository _chatRepository;
  late WebSocketChannel _wsChannel;
  late List<String> _privateUserBlocks;

  @override
  Stream<List<dynamic>> build({
    required String channelId,
    required String chatChannelId,
  }) async* {
    // websocket init
    await init();

    // connect to chat server
    await _connect();

    yield* handleMsg();

    // disconnect chat ready
    _onDispose();

    return;
  }

  Future<void> init() async {
    final user = await ref.watch(userControllerProvider.future);
    final dio = ref.watch(dioClientProvider);

    _uid = user?.userIdHash;

    Random random = Random();
    int serverNo = random.nextInt(5) + 1;

    _wsChannel =
        WebSocketChannel.connect(Uri.parse(ApiUrl.chatServer(serverNo)));

    _privateUserBlocks =
        await ref.watch(privateUserBlocksControllerProvider.future);

    _chatRepository = ref.read(chatRepositoryProvider(
      wsChannel: _wsChannel,
      chatChannelId: chatChannelId,
      dio: dio,
    ));
  }

  Future<void> _connect() async {
    _chatRepository.connect(uid: _uid);
  }

  void _requestRecentChat() {
    _chatRepository.requestRecentChat(sid: _sid);
  }

  void _onDispose() {
    ref.onDispose(_chatRepository.disconnect);
  }

  Future<void> disconnect() async {
    await _chatRepository.disconnect();
  }

  Stream<List<dynamic>> handleMsg() async* {
    List<dynamic> allMessages = [];

    await for (final msg in _wsChannel.stream) {
      Map<String, dynamic> response = json.decode(msg);

      switch (response['cmd']) {
        // ping
        case 0:
          _chatRepository.pong();
          break;
        // connected
        case 10100:
          _sid = response['bdy']['sid'];
          // request recent chat.
          _requestRecentChat();
          break;

        // recent chat
        case 15101:
          try {
            // Only chat (not donation, system msg, etc...)
            final Map<String, dynamic> filteredResponse = {
              'svcid': response['svcid'],
              'cmd': response['cmd'],
              'retCode': response['retCode'],
              'tid': response['tid'],
              'cid': response['cid'],
              // Filter
              'bdy': {
                'messageList':
                    (response['bdy']['messageList'] as List<dynamic>).where(
                  (element) {
                    return element['messageTypeCode'] == 1; // Chat
                  },
                ).toList(),
                'userCount': response['bdy']['userCount'],
              },
            };

            final RecentChat recentChat = RecentChat.fromJson(filteredResponse);

            final List<RecentChatMsg> msgList = recentChat.bdy.messageList
                .where((msg) => !_privateUserBlocks
                    .contains(msg.userId)) // Filter blocked user
                .toList()
                .reversed
                .toList();

            allMessages = [...msgList];
          } catch (_) {}

          yield allMessages;

        // chat
        case 93101:
          try {
            final Chat chat = Chat.fromJson(response);
            final List<ChatBdy> bdy = chat.bdy
                .where((chatBdy) => !_privateUserBlocks
                    .contains(chatBdy.uid)) // Filter blocked user
                .toList()
                .reversed
                .toList();
            allMessages = [...bdy, ...allMessages];
          } catch (_) {}

          yield allMessages;

        // donation
        case 93102:
          break;
      }
    }
  }
}
