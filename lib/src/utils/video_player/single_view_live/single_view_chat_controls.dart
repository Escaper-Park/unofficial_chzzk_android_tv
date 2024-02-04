import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controller/setting/setting_controller.dart';
import '../../../ui/common/header_text.dart';
import '../network_video_controller.dart';
import 'chat_position_controller.dart';
import 'chat_value_controller.dart';

class SingleViewChatControls extends HookConsumerWidget {
  const SingleViewChatControls({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusScopeNode = useFocusScopeNode();

    final chatPosition = ref.watch(
        chatSettingControllerProvider.select((value) => value.chatPosition));

    final alignment = switch (chatPosition) {
      2 => Alignment.centerLeft,
      3 => Alignment.centerLeft,
      4 => Alignment.centerLeft,
      _ => Alignment.centerRight,
    };

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        ref.read(videoControlsTimerProvider.notifier).showControlsWithTimer(
              videoFocusNode: videoFocusNode,
              seconds: 0,
              controlType: ControlType.chat,
            );
      },
      child: Stack(
        children: [
          Align(
            alignment: alignment,
            child: Container(
              height: double.infinity,
              width: 250.0,
              color: Colors.black.withOpacity(0.9),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
                child: SingleChildScrollView(
                  child: FocusScope(
                    node: focusScopeNode,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeaderText(
                          text: '채팅창 위치',
                          fontSize: 16.0,
                        ),
                        ChatPositionController(
                          videoFocusNode: videoFocusNode,
                        ),
                        const HeaderText(
                          text: '글씨 크기',
                          fontSize: 16.0,
                        ),
                        ChatFontSizeController(
                          videoFocusNode: videoFocusNode,
                        ),
                        const HeaderText(
                          text: '채팅창 높이',
                          fontSize: 16.0,
                        ),
                        ChatContainerHeightController(
                          videoFocusNode: videoFocusNode,
                        ),
                        const HeaderText(
                          text: '채팅창 너비',
                          fontSize: 16.0,
                        ),
                        ChatContainerWidthController(
                          videoFocusNode: videoFocusNode,
                        ),
                        const HeaderText(
                          text: '투명도',
                          fontSize: 16.0,
                        ),
                        ChatTransparencyController(
                          videoFocusNode: videoFocusNode,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
