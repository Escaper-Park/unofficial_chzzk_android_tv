import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../common/constants/api.dart';
import '../../../utils/dio/dio_client.dart';
import '../../auth/controller/auth_controller.dart';
import '../../user/controller/user_controller.dart';

import '../repository/chat_repository.dart';

import '../model/chat.dart';
import '../model/recent_chat.dart';

part 'chat_controller.g.dart';

@riverpod
class ChatController extends _$ChatController {
  Options? _options;
  String? _uid;
  String? _sid;

  late ChatRepository _chatRepository;
  late WebSocketChannel _wsChannel;

  @override
  Stream<dynamic> build({
    required String channelId,
    required String chatChannelId,
  }) async* {
    // websocket init
    await init();

    // connect to chat server
    await connect();

    requestRecentChat();

    // disconnect chat ready
    onDispose();

    return;
  }

  Future<void> init() async {
    final auth = await ref.watch(authControllerProvider.future);
    final user = await ref.watch(userControllerProvider.future);
    final dio = ref.watch(dioClientProvider);

    _options = auth?.getOptions();
    _uid = user?.userIdHash;

    Random random = Random();
    int serverNo = random.nextInt(5) + 1;

    _wsChannel =
        WebSocketChannel.connect(Uri.parse(ApiUrl.chatServer(serverNo)));

    _chatRepository = ref.read(chatRepositoryProvider(
      wsChannel: _wsChannel,
      chatChannelId: chatChannelId,
      dio: dio,
    ));
  }

  Future<void> connect() async {
    _chatRepository.connect(uid: _uid, options: _options);
  }

  void requestRecentChat() {
    _chatRepository.requestRecentChat(sid: _sid);
  }

  void onDispose() {
    ref.onDispose(_chatRepository.disconnect);
  }

  Stream<dynamic> handleMsg() async* {
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
          break;

        // recent chat
        case 15101:
          // TODO : recentChat['bdy']['messageList].reverse();
          yield RecentChat.fromJson(response);

        // chat
        case 93101:
          // TODO : chat['bdy'].reverse();
          yield Chat.fromJson(response);

        // donation
        case 93102:
          break;
      }
    }
  }
}
