import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/styles.dart';
import '../../../../../features/chat/controller/chat_settings_controller.dart';
import '../../../controller/network_video_controller.dart';
import 'live_stream_chat_position_controls.dart';
import 'live_stream_chat_settings_value_controls.dart';

class LiveStreamChatControlOverlay extends HookConsumerWidget {
  const LiveStreamChatControlOverlay({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusScopeNode = useFocusScopeNode();

    // for scrollController
    final buttonsFocusNode1 = useFocusNode();
    final buttonsFocusNode2 = useFocusNode();

    final scrollController = useScrollController();

    useEffect(() {
      buttonsFocusNode1.addListener(() {
        if (buttonsFocusNode1.hasFocus) scrollController.jumpTo(0);
      });
      return () => scrollController.removeListener(
            () {},
          );
    }, [scrollController]);

    useEffect(() {
      buttonsFocusNode2.addListener(() {
        if (buttonsFocusNode2.hasFocus) scrollController.jumpTo(0);
      });
      return () => scrollController.removeListener(
            () {},
          );
    }, [scrollController]);

    final chatPosition = ref.watch(chatSettingsControllerProvider
        .select((chatSettings) => chatSettings.chatPosition));

    final alignment = switch (chatPosition) {
      2 || 3 || 4 => Alignment.centerLeft,
      _ => Alignment.centerRight,
    };

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        ref.read(controlOverlayTimerProvider.notifier).showOverlayAndStartTimer(
              videoFocusNode: videoFocusNode,
              seconds: 0,
              overlayType: OverlayType.chatSettings,
            );
      },
      child: Stack(
        children: [
          Align(
            alignment: alignment,
            child: Container(
              height: double.infinity,
              width: Dimensions.chatSettingsControlContainerWidth,
              color: AppColors.blackColor.withOpacity(0.9),
              child: FocusScope(
                node: focusScopeNode,
                child: ListView(
                  padding: const EdgeInsets.all(20.0),
                  controller: scrollController,
                  children: [
                    LiveStreamChatPositionControls(
                      videoFocusNode: videoFocusNode,
                      buttonsFocusNode1: buttonsFocusNode1,
                      buttonsFocusNode2: buttonsFocusNode2,
                    ),
                    LiveStreamChatSettingsValueControls(
                      videoFocusNode: videoFocusNode,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
