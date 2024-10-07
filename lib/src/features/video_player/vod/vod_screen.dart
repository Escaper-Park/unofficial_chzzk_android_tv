import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/center_widgets.dart';
import '../common/chat/chat_window_mode.dart';
import './controller/vod_mode_controller.dart';
import './single_vod_player.dart';
import './controller/vod_player_controller.dart';
import './widgets/chat/vod_chat_stream.dart';

class VodScreen extends ConsumerWidget {
  const VodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatWindowMode = ref.watch(vodChatWindowModeControllerProvider);
    final asyncController = ref.watch(vodPlayerControllerProvider);

    return asyncController.when(
      data: (controller) {
        final isVodChatExist = ref
                .read(vodPlayerControllerProvider.notifier)
                .getVodPlay()
                ?.$1
                .videoChatEnabled ==
            true;

        return controller != null && controller.value.isInitialized
            ? Stack(
                children: [
                  // Full, Side
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: SingleVodPlayer(controller: controller),
                      ),
                      // Side Chat
                      if (chatWindowMode == ChatWindowMode.side)
                        Expanded(
                          flex: 1,
                          child: isVodChatExist
                              ? VodChatStream(
                                  controller: controller,
                                  chatWindowMode: chatWindowMode,
                                )
                              : const CenteredText(
                                  text: '다시보기 채팅이 저장되어 있지 않습니다'),
                        ),
                    ],
                  ),
                  if (chatWindowMode == ChatWindowMode.overlay &&
                      isVodChatExist)
                    VodChatStream(
                      controller: controller,
                      chatWindowMode: chatWindowMode,
                    ),
                ],
              )
            : const CenteredText(text: '동영상이 마지막까지 재생되었습니다');
      },
      error: (error, stackTrace) => CenteredText(text: error.toString()),
      loading: () => const CenteredText(text: '동영상 로딩중...'),
    );
  }
}
