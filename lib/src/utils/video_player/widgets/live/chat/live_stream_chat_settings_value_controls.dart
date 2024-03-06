import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/header_text.dart';
import '../../../../../features/chat/controller/chat_settings_controller.dart';
import '../../../controller/network_video_controller.dart';
import '../../common/control_icon.dart';

class LiveStreamChatSettingsValueControls extends StatelessWidget {
  const LiveStreamChatSettingsValueControls({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ChatFontSizeControl(videoFocusNode),
        _ChatVerticalInterval(videoFocusNode),
        _ChatContainerHeightControl(videoFocusNode),
        _ChatContainerWidthControl(videoFocusNode),
        _ChatTransparencyControl(videoFocusNode),
      ],
    );
  }
}

class _ChatFontSizeControl extends ConsumerWidget {
  const _ChatFontSizeControl(this.videoFocusNode);

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontSize = ref.watch(
        chatSettingsControllerProvider.select((setting) => setting.fontSize));

    const interval = 1;

    return _ChatSettingControl(
      headerText: '채팅 크기',
      value: fontSize.toString(),
      videoFocusNode: videoFocusNode,
      onPressedUp: () {
        ref
            .read(chatSettingsControllerProvider.notifier)
            .setFontSize(fontSize + interval);
      },
      onPressedDown: () {
        ref
            .read(chatSettingsControllerProvider.notifier)
            .setFontSize(fontSize - interval);
      },
    );
  }
}

class _ChatContainerHeightControl extends ConsumerWidget {
  const _ChatContainerHeightControl(this.videoFocusNode);

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heightRatio = ref.watch(chatSettingsControllerProvider
        .select((setting) => setting.chatContainerHeight));

    // 1 %
    const interval = 1;

    return _ChatSettingControl(
      headerText: '채팅창 높이',
      value: '$heightRatio %',
      videoFocusNode: videoFocusNode,
      onPressedUp: () {
        ref
            .read(chatSettingsControllerProvider.notifier)
            .setContainerHeight(heightRatio + interval);
      },
      onPressedDown: () {
        ref
            .read(chatSettingsControllerProvider.notifier)
            .setContainerHeight(heightRatio - interval);
      },
    );
  }
}

class _ChatContainerWidthControl extends ConsumerWidget {
  const _ChatContainerWidthControl(this.videoFocusNode);

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthRatio = ref.watch(chatSettingsControllerProvider
        .select((setting) => setting.chatContainerWidth));

    // 1 %
    const interval = 1;

    return _ChatSettingControl(
      headerText: '채팅창 너비',
      value: '$widthRatio %',
      videoFocusNode: videoFocusNode,
      onPressedUp: () {
        ref
            .read(chatSettingsControllerProvider.notifier)
            .setContainerWidth(widthRatio + interval);
      },
      onPressedDown: () {
        ref
            .read(chatSettingsControllerProvider.notifier)
            .setContainerWidth(widthRatio - interval);
      },
    );
  }
}

class _ChatTransparencyControl extends ConsumerWidget {
  const _ChatTransparencyControl(this.videoFocusNode);

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transparency = ref.watch(chatSettingsControllerProvider
        .select((setting) => setting.chatContainerTransparency));

    // 1 %
    const interval = 1;

    return _ChatSettingControl(
      headerText: '채팅창 투명도',
      value: '$transparency %',
      videoFocusNode: videoFocusNode,
      onPressedUp: () {
        ref
            .read(chatSettingsControllerProvider.notifier)
            .setChatContainerTransparency(transparency + interval);
      },
      onPressedDown: () {
        ref
            .read(chatSettingsControllerProvider.notifier)
            .setChatContainerTransparency(transparency - interval);
      },
    );
  }
}

class _ChatVerticalInterval extends ConsumerWidget {
  const _ChatVerticalInterval(this.videoFocusNode);

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verticalInterval = ref.watch(chatSettingsControllerProvider
        .select((setting) => setting.chatContainerVerticalInterval));

    // 1 %
    const interval = 1;

    return _ChatSettingControl(
      headerText: '채팅 간격',
      value: '$verticalInterval',
      videoFocusNode: videoFocusNode,
      onPressedUp: () {
        ref
            .read(chatSettingsControllerProvider.notifier)
            .setChatVerticalInterval(verticalInterval + interval);
      },
      onPressedDown: () {
        ref
            .read(chatSettingsControllerProvider.notifier)
            .setChatVerticalInterval(verticalInterval - interval);
      },
    );
  }
}

class _ChatSettingControl extends ConsumerWidget {
  const _ChatSettingControl({
    required this.headerText,
    required this.value,
    required this.videoFocusNode,
    required this.onPressedUp,
    required this.onPressedDown,
  });

  final String headerText;
  final String value;
  final FocusNode videoFocusNode;
  final VoidCallback onPressedUp;
  final VoidCallback onPressedDown;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText(
            text: headerText,
            fontSize: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 45.0,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              ControlIcon(
                iconData: Icons.arrow_upward_rounded,
                onPressed: () {
                  ref
                      .read(controlOverlayTimerProvider.notifier)
                      .showOverlayAndStartTimer(
                          videoFocusNode: videoFocusNode,
                          overlayType: OverlayType.chatSettings);
                  onPressedUp();
                },
              ),
              const SizedBox(width: 5.0),
              ControlIcon(
                iconData: Icons.arrow_downward_rounded,
                onPressed: () {
                  ref
                      .read(controlOverlayTimerProvider.notifier)
                      .showOverlayAndStartTimer(
                          videoFocusNode: videoFocusNode,
                          overlayType: OverlayType.chatSettings);

                  onPressedDown();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
