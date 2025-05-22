import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../common/constants/api.dart';
import '../../../common/constants/enums.dart' show ChatCmd;
import '../model/access_token.dart';

class ChatRepository {
  final String chatChannelId;
  final WebSocketChannel wsChannel;
  final Dio dio;

  ChatRepository({
    required this.chatChannelId,
    required this.wsChannel,
    required this.dio,
  });

  void _send(Map<String, dynamic> object) {
    wsChannel.sink.add(json.encode(object));
  }

  Future<AccessToken?> _getAccessToken() async {
    const String accessTokenUrl = NaverGameApi.accessToken;

    try {
      final response = await dio.get(
        accessTokenUrl,
        queryParameters: {
          'channelId': chatChannelId,
          'chatType': 'STREAMING',
        },
      );

      return AccessToken.fromJson(response.data);
    } catch (_) {
      return null;
    }
  }

  Future<void> connect({
    /// user?.userHashId
    required String? uid,
  }) async {
    // Get Access Token for watching adult restriction channel's chats
    final AccessToken? accessToken = await _getAccessToken();

    _send({
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

  Future<void> disconnect() async {
    await wsChannel.sink.close();
  }

  /// Get sid from connect response and use in, after connection.
  void requestRecentChat({required String? sid}) {
    _send({
      'bdy': {"recentMessageCount": 50},
      'cid': chatChannelId,
      'cmd': ChatCmd.requestRecentChat.value,
      'sid': sid,
      'svcid': 'game',
      'tid': 2,
      'ver': "3",
    });
  }

  void sendPing() {
    _send({
      'cmd': ChatCmd.ping.value,
      'ver': "3",
    });
  }

  void sendPong() {
    _send({
      'cmd': ChatCmd.pong.value,
      'ver': "3",
    });
  }
}
