import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../common/constants/api.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/access_token.dart';

part 'chat_repository.g.dart';

enum ChatCmd {
  ping(0),
  pong(10000),
  connect(100),
  connected(10100),
  requestRecentChat(5101),
  recentChat(15101),
  event(93006),
  chat(93101),
  donation(93102),
  kick(94005),
  block(94006),
  blind(94008),
  notice(94010),
  penalty(94015),
  sendChat(3101);

  final int value;

  const ChatCmd(this.value);
}

enum MsgTypeCode {
  text(1),
  image(2),
  sticker(3),
  video(4),
  rich(5),
  donation(10),
  subscription(11),
  systemMsg(30);

  final int value;

  const MsgTypeCode(this.value);
}

@riverpod
ChatRepository chatRepository(
  ChatRepositoryRef ref, {
  required WebSocketChannel wsChannel,
  required String chatChannelId,
  required Dio dio,
}) =>
    ChatRepository(
      wsChannel: wsChannel,
      chatChannelId: chatChannelId,
      dio: dio,
    );

class ChatRepository {
  final WebSocketChannel wsChannel;
  final String chatChannelId;
  final Dio dio;

  ChatRepository({
    required this.wsChannel,
    required this.chatChannelId,
    required this.dio,
  });

  void send(Map<String, dynamic> object) {
    wsChannel.sink.add(json.encode(object));
  }

  Future<AccessToken?> _getAccessToken({required Options? options}) async {
    const String apiUrl = ApiUrl.accessToken;

    if (options != null) {
      try {
        final response = await dio.get(
          apiUrl,
          options: options,
          queryParameters: {
            'channelId': chatChannelId,
            'chatType': 'STREAMING',
          },
        );

        return AccessToken.fromJson(response.data['content']);
      } catch (_) {
        return null;
      }
    }

    return null;
  }

  Future<void> connect({
    /// user?.userHashId
    required String? uid,
    required Options? options,
  }) async {
    // Get Access Token for watching adult restriction channel's chats
    final AccessToken? accessToken = await _getAccessToken(options: options);

    send({
      'bdy': {
        'accTkn': accessToken?.accessToken,
        'auth': uid == null ? 'READ' : 'SEND',
        'devType': 2001,
        'locale': 'ko',
        'timezone': 'Asia/Seoul',
        'uid': uid,
      },
      'cid': chatChannelId,
      'svcid': 'game',
      'cmd': ChatCmd.connect.value,
      'tid': 1,
      'ver': "3",
    });
  }

  /// After connect, get sid from connect response and use in.
  void requestRecentChat({required String? sid}) {
    send({
      'bdy': {"recentMessageCount": 50},
      'cid': chatChannelId,
      'cmd': ChatCmd.requestRecentChat.value,
      'sid': sid,
      'svcid': 'game',
      'tid': 2,
      'ver': "3",
    });
  }

  void pong() {
    wsChannel.sink.add(json.encode({
      'cmd': ChatCmd.pong.value,
      'ver': "3",
    }));
  }

  Future<void> disconnect() async {
    await wsChannel.sink.close();
  }
}
