import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/dpad_widgets.dart';
import '../../../../../setting/controller/chat_settings_controller.dart';
import '../../../controller/live_player_controller.dart';

class ChatPosition {
  final IconData iconData;
  final bool isFlipX;
  final bool isFlipY;
  final int posX;
  final int posY;

  ChatPosition({
    required this.iconData,
    required this.isFlipX,
    required this.isFlipY,
    required this.posX,
    required this.posY,
  });
}

class SimpleChatPositionSetter extends HookConsumerWidget {
  const SimpleChatPositionSetter({super.key, required this.videoFocusNode});

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatSettings = ref.watch(chatSettingsControllerProvider);

    final List<ChatPosition> itemData = [
      ChatPosition(
        iconData: Icons.arrow_outward_rounded,
        isFlipX: true,
        isFlipY: false,
        posX: 0,
        posY: 0,
      ),
      ChatPosition(
        iconData: Icons.arrow_upward_rounded,
        isFlipX: false,
        isFlipY: false,
        posX: 50,
        posY: 0,
      ),
      ChatPosition(
        iconData: Icons.arrow_outward_rounded,
        isFlipX: false,
        isFlipY: false,
        posX: 100,
        posY: 0,
      ),
      ChatPosition(
        iconData: Icons.arrow_back_rounded,
        isFlipX: false,
        isFlipY: false,
        posX: 0,
        posY: 50,
      ),
      ChatPosition(
        iconData: Icons.add_rounded,
        isFlipX: false,
        isFlipY: false,
        posX: 50,
        posY: 50,
      ),
      ChatPosition(
        iconData: Icons.arrow_forward_rounded,
        isFlipX: false,
        isFlipY: false,
        posX: 100,
        posY: 50,
      ),
      ChatPosition(
        iconData: Icons.arrow_outward_rounded,
        isFlipX: true,
        isFlipY: true,
        posX: 0,
        posY: 100,
      ),
      ChatPosition(
        iconData: Icons.arrow_downward_rounded,
        isFlipX: false,
        isFlipY: false,
        posX: 50,
        posY: 100,
      ),
      ChatPosition(
        iconData: Icons.arrow_outward_rounded,
        isFlipX: false,
        isFlipY: true,
        posX: 100,
        posY: 100,
      ),
    ];

    final int initialPositionIndex = _getPositionIndex(
      chatSettings.chatPositionX,
      chatSettings.chatPositionY,
    );

    final currentValue = useState<int>(initialPositionIndex);

    // Update Icon
    useEffect(() {
      final newPositionIndex = _getPositionIndex(
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

  /// 0, 1, 2
  /// 3, 4, 5
  /// 6, 7, 8
  int _getPositionIndex(int chatPositionX, int chatPositionY) {
    int column = chatPositionX ~/ 34;
    int row = chatPositionY ~/ 34;
    return row * 3 + column;
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
