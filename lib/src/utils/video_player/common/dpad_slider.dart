import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/styles.dart';
import '../../../ui/common/dpad_widget.dart';
import '../network_video_controller.dart';

class DpadSlider extends HookConsumerWidget {
  const DpadSlider({
    super.key,
    required this.controller,
    required this.videoFocusNode,
    required this.min,
    required this.max,
    required this.initialPosition,
    required this.leftCallback,
    required this.rightCallback,
  });

  final ChewieController controller;
  final FocusNode videoFocusNode;

  final double min;
  final double max;
  final double initialPosition;
  final Function(double positionValue) leftCallback;
  final Function(double positionValue) rightCallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = useState<double>(initialPosition);

    final double interval = (max - min) * 0.01; // 1 %

    return DpadWidget(
      useFocusedBorder: true,
      leftCallback: () {
        if (position.value - interval > 0.0) {
          position.value -= interval;
        } else {
          position.value = 0.0;
        }

        leftCallback(position.value);

        ref.read(videoControlsTimerProvider.notifier).showControlsWithTimer(
              videoFocusNode: videoFocusNode,
            );
      },
      rightCallback: () {
        if (position.value + interval < max) {
          position.value += interval;
        } else {
          position.value = max;
        }
        rightCallback(position.value);

        ref.read(videoControlsTimerProvider.notifier).showControlsWithTimer(
              videoFocusNode: videoFocusNode,
            );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final lineLength = constraints.maxWidth - 20.0; // padding

          final valuePosition =
              ((position.value - min) / (max - min)) * lineLength;

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 5.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.greyColor,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 8.0,
                  right: lineLength - valuePosition,
                  child: Container(
                    height: 5.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.chzzkColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(
                      ((position.value - min) / (max - min) * 2 - 1), 0.0),
                  child: const Icon(
                    Icons.circle,
                    color: AppColors.chzzkColor,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
