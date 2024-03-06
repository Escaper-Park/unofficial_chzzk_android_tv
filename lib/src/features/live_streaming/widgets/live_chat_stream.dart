import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/center_text.dart';
import '../../chat/controller/chat_controller.dart';
import '../../live/model/live.dart';
import 'chat_container.dart';

class LiveChatStream extends ConsumerWidget {
  const LiveChatStream({
    super.key,
    required this.liveDetail,
    required this.fontSize,
    required this.verticalInterval,
  });

  final LiveDetail liveDetail;
  final double fontSize;
  final double verticalInterval;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatStream = ref.watch(
      chatControllerProvider(
          channelId: liveDetail.channel.channelId,
          chatChannelId: liveDetail.chatChannelId!),
    );

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: switch (chatStream) {
        AsyncData(:final value) => ListView.builder(
            reverse: true,
            shrinkWrap: false,
            itemCount: value.length,
            itemBuilder: (context, index) {
              final chat = value[index];

              return ChatContainer(
                chat: chat,
                fontSize: fontSize,
                verticalInterval: verticalInterval,
              );
            },
          ),
        AsyncError() => const CenterText(text: '채팅을 불러올 수 없습니다. 다시 시도해주세요.'),
        _ => const CenterText(text: '채팅 불러오는 중...'),
      },
    );
  }
}
