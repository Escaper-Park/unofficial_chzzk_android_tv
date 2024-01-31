import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/styles.dart';
import '../../../controller/multi_view/multi_view_controller.dart';
import '../../../ui/common/custom_outline_button.dart';
import '../network_video_controller.dart';

class MultiViewControlButtons extends ConsumerWidget {
  const MultiViewControlButtons({
    super.key,
    required this.index,
    required this.controller,
    required this.videoFocusNode,
    this.autofocus = false,
  });

  final int index;
  final bool autofocus;
  final FocusNode videoFocusNode;
  final ChewieController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSelectedChannel = ref.watch(currentSelectedChannelProvider);

    final double currentVolumne = controller.videoPlayerController.value.volume;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: MultiViewControlButton(
              autofocus: autofocus,
              text: index == currentSelectedChannel ? '같이보기' : '크게보기',
              iconData: index == currentSelectedChannel
                  ? Icons.fullscreen_exit_rounded
                  : Icons.fullscreen_rounded,
              callback: () {
                ref
                    .read(currentSelectedChannelProvider.notifier)
                    .setCurrentChannel(index);

                ref
                    .read(videoControlsTimerProvider.notifier)
                    .showControlsWithTimer(videoFocusNode: videoFocusNode);
              },
            ),
          ),
          const SizedBox(width: 5.0),
          Expanded(
            flex: 1,
            child: MultiViewControlButton(
              autofocus: false,
              text: currentVolumne == 0.0 ? '음소거' : '소리 켜기',
              iconData: currentVolumne == 0.0
                  ? Icons.volume_off_rounded
                  : Icons.volume_up_rounded,
              callback: () {
                // TODO: Remember prev values
                final double volume = currentVolumne == 0.0 ? 1.0 : 0.0;

                ref
                    .read(multiViewVolumeControlsProvider.notifier)
                    .muteOrUnmute(index: index);

                controller.setVolume(volume);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MultiViewControlButton extends StatelessWidget {
  const MultiViewControlButton({
    super.key,
    required this.text,
    required this.iconData,
    required this.callback,
    this.autofocus = false,
  });

  final String text;
  final IconData iconData;
  final VoidCallback callback;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return CustomOutlineButton(
      autofocus: autofocus,
      onPressed: callback,
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Icon(
            iconData,
            color: AppColors.whiteColor,
            size: 25.0,
          ),
          const SizedBox(height: 5.0),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14.0,
              color: AppColors.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
