import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'chat_repository.g.dart';

// Future works
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

  final int cmdNumber;

  int get value => cmdNumber;

  const ChatCmd(this.cmdNumber);
}

@riverpod
ChatRepository chatRepository(
  ChatRepositoryRef ref, {
  required WebSocketChannel channel,
  required String chatChannelId,
}) =>
    ChatRepository(
      channel: channel,
      chatChannelId: chatChannelId,
    );

class ChatRepository {
  final WebSocketChannel channel;
  String chatChannelId;

  ChatRepository({
    required this.channel,
    required this.chatChannelId,
  });

  void connect() {
    channel.sink.add(json.encode({
      'bdy': {
        'accTkn': null,
        'auth': 'READ',
        'uid': null,
      },
      'cmd': ChatCmd.connect.cmdNumber,
      'tid': 1,
      'cid': chatChannelId,
      'svcid': 'game',
      'ver': '2'
    }));
  }

  void pong() {
    channel.sink.add(json.encode({
      'cmd': ChatCmd.pong.cmdNumber,
      'ver': '2',
    }));
  }

  Future<void> disconnect() async {
    channel.sink.close();
  }
}
