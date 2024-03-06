import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/video_player/controller/live_stream_controller.dart';
import '../../utils/video_player/live_network_video.dart';
import '../chat/controller/chat_settings_controller.dart';

import '../live/model/live.dart';
import './widgets/live_chat_stream.dart';

class LiveStreamingScreen extends ConsumerWidget {
  const LiveStreamingScreen({super.key, required this.liveDetail});

  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenMode = ref.watch(liveStreamScreenModeControllerProvider);
    final chatSettings = ref.watch(chatSettingsControllerProvider);

    final double chatFontSize = chatSettings.fontSize.toDouble();
    final double verticalInterval =
        chatSettings.chatContainerVerticalInterval.toDouble();

    return Scaffold(
      body: Stack(
        children: [
          // Video
          Row(
            children: [
              Expanded(
                flex: 3,
                child: LiveStreamingNetworkVideo(liveDetail: liveDetail),
              ),
              if (screenMode == LiveStreamScreenMode.chat)
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: double.infinity,
                    child: LiveChatStream(
                      liveDetail: liveDetail,
                      fontSize: chatFontSize,
                      verticalInterval: verticalInterval,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
