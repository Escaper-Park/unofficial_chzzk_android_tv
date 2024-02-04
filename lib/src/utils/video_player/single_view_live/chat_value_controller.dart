import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/styles.dart';
import '../../../controller/setting/setting_controller.dart';
import '../common/control_icon.dart';
import '../network_video_controller.dart';

class ChatFontSizeController extends ConsumerWidget {
  const ChatFontSizeController({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontSize = ref.watch(
      chatSettingControllerProvider.select((setting) => setting.fontSize),
    );

    const int interval = 1;

    return ChatValueController(
      valueString: fontSize.toString(),
      videoFocusNode: videoFocusNode,
      onPressedUp: () {
        ref
            .read(chatSettingControllerProvider.notifier)
            .setFontSize(fontSize + interval);
      },
      onPressedDown: () {
        ref
            .read(chatSettingControllerProvider.notifier)
            .setFontSize(fontSize - interval);
      },
    );
  }
}

class ChatContainerHeightController extends ConsumerWidget {
  const ChatContainerHeightController({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heightRatio = ref.watch(
      chatSettingControllerProvider
          .select((setting) => setting.chatContainerHeight),
    );

    // Interval: 5%
    const int interval = 5;

    return ChatValueController(
      valueString: '$heightRatio%',
      videoFocusNode: videoFocusNode,
      onPressedUp: () {
        ref
            .read(chatSettingControllerProvider.notifier)
            .setContainerHeight(heightRatio + interval);
      },
      onPressedDown: () {
        ref
            .read(chatSettingControllerProvider.notifier)
            .setContainerHeight(heightRatio - interval);
      },
    );
  }
}

class ChatContainerWidthController extends ConsumerWidget {
  const ChatContainerWidthController({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthRatio = ref.watch(
      chatSettingControllerProvider
          .select((setting) => setting.chatContainerWidth),
    );

    // Interval: 5%
    const int interval = 5;

    return ChatValueController(
      valueString: '$widthRatio%',
      videoFocusNode: videoFocusNode,
      onPressedUp: () {
        ref
            .read(chatSettingControllerProvider.notifier)
            .setContainerWidth(widthRatio + interval);
      },
      onPressedDown: () {
        ref
            .read(chatSettingControllerProvider.notifier)
            .setContainerWidth(widthRatio - interval);
      },
    );
  }
}

class ChatTransparencyController extends ConsumerWidget {
  const ChatTransparencyController({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transparency = ref.watch(
      chatSettingControllerProvider
          .select((setting) => setting.chatContainerTransparency),
    );

    // Interval: 5%
    const int interval = 5;

    return ChatValueController(
      valueString: '$transparency%',
      videoFocusNode: videoFocusNode,
      onPressedUp: () {
        ref
            .read(chatSettingControllerProvider.notifier)
            .setChatContainerTransparency(transparency + interval);
      },
      onPressedDown: () {
        ref
            .read(chatSettingControllerProvider.notifier)
            .setChatContainerTransparency(transparency - interval);
      },
    );
  }
}

class ChatValueController extends ConsumerWidget {
  const ChatValueController({
    super.key,
    required this.valueString,
    required this.videoFocusNode,
    required this.onPressedUp,
    required this.onPressedDown,
  });

  final String valueString;
  final FocusNode videoFocusNode;
  final VoidCallback onPressedUp;
  final VoidCallback onPressedDown;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 45.0,
          child: Text(
            valueString,
            style: const TextStyle(
              fontSize: 14.0,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        ControlIcon(
          iconData: Icons.arrow_upward_rounded,
          onPressed: () {
            ref.read(videoControlsTimerProvider.notifier).showControlsWithTimer(
                  videoFocusNode: videoFocusNode,
                  controlType: ControlType.chat,
                );
            onPressedUp();
          },
        ),
        const SizedBox(width: 5.0),
        ControlIcon(
          iconData: Icons.arrow_downward_rounded,
          onPressed: () {
            ref.read(videoControlsTimerProvider.notifier).showControlsWithTimer(
                  videoFocusNode: videoFocusNode,
                  controlType: ControlType.chat,
                );

            onPressedDown();
          },
        ),
      ],
    );
  }
}
