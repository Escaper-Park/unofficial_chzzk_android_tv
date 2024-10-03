import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/dpad_widgets.dart';
import '../../../setting/controller/chat_settings_controller.dart';
import '../../../setting/widgets/chat/chat_settings_data.dart';
import '../../live/controller/live_overlay_controller.dart';

class SimpleChatPositionSetter extends HookConsumerWidget {
  const SimpleChatPositionSetter({super.key, required this.videoFocusNode});

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatSettings = ref.watch(chatSettingsControllerProvider);

    final itemData = ChatSettingsData.chatPositionData;

    final int initialPositionIndex = ChatSettingsData.getPositionIndex(
      chatSettings.chatPositionX,
      chatSettings.chatPositionY,
    );

    final currentValue = useState<int>(initialPositionIndex);

    // Update Icon
    useEffect(() {
      final newPositionIndex = ChatSettingsData.getPositionIndex(
        chatSettings.chatPositionX,
        chatSettings.chatPositionY,
      );
      currentValue.value = newPositionIndex;
      return null;
    }, [chatSettings.chatPositionX, chatSettings.chatPositionY]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: DpadActionWidget(
        autofocus: true,
        useFocusedBorder: true,
        useKeyRepeatEvent: true,
        dpadActionCallbacks: {
          DpadAction.arrowLeft: () {
            ref
                .read(liveOverlayControllerProvider.notifier)
                .resetOverlayTimer(videoFocusNode: videoFocusNode);
          },
          DpadAction.arrowRight: () {
            ref
                .read(liveOverlayControllerProvider.notifier)
                .resetOverlayTimer(videoFocusNode: videoFocusNode);
          },
          DpadAction.arrowUp: () {
            final updatedValue = (currentValue.value + 1) % 9;

            currentValue.value = updatedValue;
            _setChatPositions(
              ref,
              itemData[updatedValue].posX,
              itemData[updatedValue].posY,
            );
          },
          DpadAction.arrowDown: () {
            final updatedValue = (currentValue.value - 1) % 9;

            currentValue.value = updatedValue;
            _setChatPositions(
              ref,
              itemData[updatedValue].posX,
              itemData[updatedValue].posY,
            );
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
                flipX: itemData[currentValue.value].isFlipX,
                flipY: itemData[currentValue.value].isFlipY,
                child: Icon(
                  itemData[currentValue.value].iconData,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void _setChatPositions(WidgetRef ref, int x, int y) {
    // Set positions
    ref.read(chatSettingsControllerProvider.notifier).setChatPositionX(x);
    ref.read(chatSettingsControllerProvider.notifier).setChatPositionY(y);

    // Reset timer
    ref
        .read(liveOverlayControllerProvider.notifier)
        .resetOverlayTimer(videoFocusNode: videoFocusNode);
  }
}
