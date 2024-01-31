import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/video_player/network_video_controller.dart';
import 'widgets/single_view_chat.dart';
import 'widgets/single_view_video_live.dart';

class SingleViewLiveScreen extends ConsumerWidget {
  const SingleViewLiveScreen({
    super.key,
    required this.videoPath,
    required this.channelId,
    required this.chatChannelId,
    required this.openDate,
  });

  final String videoPath;
  final String channelId;
  final String chatChannelId;
  final String openDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool showChat = ref.watch(showChatProvider);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: SingleViewVideoLive(
              videoPath: videoPath,
              openDate: openDate,
            ),
          ),
          if (showChat)
            Expanded(
              flex: 1,
              child: SizedBox(
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleViewChat(
                    channelId: channelId,
                    chatChannelId: chatChannelId,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
