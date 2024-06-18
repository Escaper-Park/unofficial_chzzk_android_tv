import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../common/constants/api.dart';
import '../../auth/controller/auth_controller.dart';
import '../../user/controller/user_controller.dart';
import '../model/chat.dart';
import '../repository/chat_repository.dart';
import './chat_settings_controller.dart';

part 'chat_controller.g.dart';

@riverpod
class ChatController extends _$ChatController {
  late WebSocketChannel _channel;
  late ChatRepository _chatRepository;
  Options? _options;

  @override
  Stream<List<Chat>> build({
    required String channelId,
    required String chatChannelId,
  }) async* {
    final auth = await ref.watch(authControllerProvider.future);
    final user = await ref.watch(userControllerProvider.future);
    _options = auth?.getOptions();
    
    Random random = Random();
    int serverNo = random.nextInt(5) + 1;

    final int chatDelaySec =
        ref.read(chatSettingsControllerProvider.notifier).getChatDelaySec();

    _channel = WebSocketChannel.connect(
      Uri.parse(
        APIUrl.chatServer(serverNo),
      ),
    );

    _chatRepository = ref.read(
      chatRepositoryProvider(
        channel: _channel,
        chatChannelId: chatChannelId,
      ),
    );

    // Connect
    await _chatRepository.connect(
      options: _options,
      uid: user?.userIdHash,
    );

    // Disconnect chat ready
    ref.onDispose(_chatRepository.disconnect);

    final transformer = StreamTransformer<dynamic, dynamic>.fromHandlers(
      handleData: (data, sink) {
        if (data != null) {
          Future.delayed(Duration(seconds: chatDelaySec), () {
            sink.add(data);
          });
        }
      },
    );

    final Stream<dynamic> delayedStream = chatDelaySec == 0
        ? _channel.stream
        : _channel.stream.transform(transformer);

    List<Chat> allMessages = [];

    await for (final message in delayedStream) {
      Map<String, dynamic> response = json.decode(message);

      // Get chat messages
      if (response['cmd'] == ChatCmd.chat.value) {
        dynamic body = response['bdy'];

        List<Chat> msg = (body as List)
            .map((res) {
              String? profile = res['profile'];
              String? nickname;
              Map<String, dynamic>? emojis;

              if (profile != null) {
                try {
                  nickname = (jsonDecode(profile)['nickname']);
                  emojis = jsonDecode(res['extras'])['emojis'];
                } catch (_) {
                  nickname == 'ERROR';
                  emojis = null;
                }
              } else {
                nickname = 'ERROR';
              }

              Map<String, dynamic> json = {
                'nickname': nickname ?? 'ERROR',
                'msg': res['msg'] ?? 'ERROR',
                'emojis': emojis,
              };

              return Chat.fromJson(json);
            })
            .toList()
            .reversed
            .toList();

        allMessages = [...msg, ...allMessages];

        yield allMessages;
      }
      // Donation
      else if (response['cmd'] == ChatCmd.donation.value) {
      }
      // Ping - Pong
      else if (response['cmd'] == ChatCmd.ping.value) {
        _chatRepository.pong();
      }

      // Future works
    }
  }
}
