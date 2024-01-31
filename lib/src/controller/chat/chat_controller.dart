import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../constants/api.dart';
import '../../model/chat/chat.dart';
import '../../service/chat/chat_repository.dart';

part 'chat_controller.g.dart';

@riverpod
class ChatController extends _$ChatController {
  late WebSocketChannel _channel;
  late ChatRepository _chatRepository;

  @override
  Stream<List<Chat>> build({
    required String channelId,
    required String chatChannelId,
  }) async* {
    Random random = Random();
    int serverNo = random.nextInt(5) + 1;

    _channel = WebSocketChannel.connect(
      Uri.parse(
        APIUrl.chatServer(serverNo),
      ),
    );

    _chatRepository = ref.watch(
      // ignore: avoid_manual_providers_as_generated_provider_dependency
      ChatRepositoryProvider(
        channel: _channel,
        chatChannelId: chatChannelId,
      ),
    );

    // Connect
    _chatRepository.connect();

    // Disconnect chat ready
    ref.onDispose(_chatRepository.disconnect);

    const int chatDeleySec = 4;

    final transformer = StreamTransformer<dynamic, dynamic>.fromHandlers(
      handleData: (data, sink) {
        if (data != null) {
          Future.delayed(const Duration(seconds: chatDeleySec), () {
            sink.add(data);
          });
        }
      },
    );

    List<Chat> allMessages = [];

    final transformChannelStream =
        _channel.stream.transform(transformer).asBroadcastStream();

    await for (final message in transformChannelStream) {
      Map<String, dynamic> response = json.decode(message);

      // Get chat messages
      if (response['cmd'] == ChatCmd.chat.value) {
        dynamic body = response['bdy'];

        List<Chat> msg = (body as List)
            .map((res) {
              String profile = res['profile'];

              Map<String, dynamic> json = {
                'nickname': jsonDecode(profile)['nickname'],
                'msg': res['msg'],
              };

              return Chat.fromJson(json);
            })
            .toList()
            .reversed
            .toList();

        allMessages = [...msg, ...allMessages];

        yield allMessages;
      }
      // Ping - Pong
      else if (response['cmd'] == ChatCmd.ping.value) {
        _chatRepository.pong();
      }

      // Future works
    }
  }
}
