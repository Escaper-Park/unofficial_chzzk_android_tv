import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controller/chat/chat_controller.dart';
import 'delayed_chat.dart';

class SingleViewChat extends ConsumerWidget {
  const SingleViewChat({
    super.key,
    required this.channelId,
    required this.chatChannelId,
  });

  final String channelId;
  final String chatChannelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveChats = ref.watch(ChatControllerProvider(
        chatChannelId: chatChannelId, channelId: channelId));

    return switch (liveChats) {
      AsyncData(:final value) => ListView.builder(
          reverse: true,
          shrinkWrap: false,
          itemCount: value.length,
          itemBuilder: (context, index) {
            final chat = value[index];

            return DelayedChat(
              chat: chat,
            );
          },
        ),
      AsyncError(:final error) => Text(error.toString()),
      _ => const Center(child: Text('채팅 불러오는 중...')),
    };
  }
}
