import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/constants/enums.dart' show DpadAction;
import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/dpad/dpad_widgets.dart';
import '../../../settings/model/chat_settings.dart';
import '../../../settings/widgets/value/chat_setting_data.dart';

class StreamChatSimplePositionSetter extends HookWidget {
  const StreamChatSimplePositionSetter({
    super.key,
    required this.chatSettings,
    required this.resetOverlayTimer,
    required this.updateChatPosition,
  });

  final ChatSettings chatSettings;
  final VoidCallback resetOverlayTimer;
  final void Function(int, int) updateChatPosition;

  @override
  Widget build(BuildContext context) {
    final chatPositionData = ChatSettingsData.chatPositionData;

    final int initialPositionIndex = ChatSettingsData.getPositionIndex(
      chatSettings.chatPositionX,
      chatSettings.chatPositionY,
    );

    final currentValue = useState<int>(initialPositionIndex);

    // Update Icon
    useEffect(
      () {
        final newPositionIndex = ChatSettingsData.getPositionIndex(
          chatSettings.chatPositionX,
          chatSettings.chatPositionY,
        );
        currentValue.value = newPositionIndex;
        return null;
      },
      [chatSettings.chatPositionX, chatSettings.chatPositionY],
    );

    return SizedBox(
      width: Dimensions.streamChatSettingControlIconWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: DpadActionWidget(
          autofocus: true,
          useFocusedBorder: true,
          useKeyRepeatEvent: true,
          dpadActionCallbacks: {
            DpadAction.arrowLeft: resetOverlayTimer,
            DpadAction.arrowRight: resetOverlayTimer,
            DpadAction.arrowUp: () {
              final updatedValue = (currentValue.value + 1) % 9;

              currentValue.value = updatedValue;
              updateChatPosition(
                chatPositionData[updatedValue].posX,
                chatPositionData[updatedValue].posY,
              );
              resetOverlayTimer();
            },
            DpadAction.arrowDown: () {
              final updatedValue = (currentValue.value - 1) % 9;

              currentValue.value = updatedValue;
              updateChatPosition(
                chatPositionData[updatedValue].posX,
                chatPositionData[updatedValue].posY,
              );
              resetOverlayTimer();
            },
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                const Icon(
                  Icons.arrow_drop_up_rounded,
                  size: 15.0,
                ),
                Transform.flip(
                  flipX: chatPositionData[currentValue.value].isFlipX,
                  flipY: chatPositionData[currentValue.value].isFlipY,
                  child: Icon(
                    chatPositionData[currentValue.value].iconData,
                    size: 20.0,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 15.0,
                ),
                const Text(
                  '간편위치',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
