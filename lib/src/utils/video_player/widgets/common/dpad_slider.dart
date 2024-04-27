import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/styles.dart';
import '../../../focus/dpad_widget.dart';
import '../../controller/network_video_controller.dart';

class DpadSlider extends HookConsumerWidget {
  const DpadSlider({
    super.key,
    required this.controller,
    required this.videoFocusNode,
    this.minValue = 0.0,
    required this.maxValue,
    required this.initialPosition,
    required this.leftCallback,
    required this.rightCallback,
    this.intervalScalingFactor = 0.01, // 1 %
  });

  final ChewieController controller;
  final FocusNode videoFocusNode;
  final double minValue;
  final double maxValue;
  final double initialPosition;

  final Function(double positionValue) leftCallback;
  final Function(double positionValue) rightCallback;

  final double intervalScalingFactor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = useState<double>(initialPosition);

    final double interval = (maxValue - minValue) * intervalScalingFactor;

    return DpadWidget(
      useFocusedBorder: true,
      useKeyRepeatEvent: true,
      padding: const EdgeInsets.all(5.0),
      actionCallbacks: {
        DpadAction.arrowLeft: () {
          if (position.value - interval > minValue) {
            position.value -= interval;
          } else {
            position.value = minValue;
          }
          leftCallback(position.value);

          // reset timer
          ref
              .read(controlOverlayTimerProvider.notifier)
              .showOverlayAndStartTimer(
                videoFocusNode: videoFocusNode,
              );
        },
        DpadAction.arrowRight: () {
          if (position.value + interval < maxValue) {
            position.value += interval;
          } else {
            position.value = maxValue;
          }
          rightCallback(position.value);

          ref
              .read(controlOverlayTimerProvider.notifier)
              .showOverlayAndStartTimer(
                videoFocusNode: videoFocusNode,
              );
        },
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final lineLength = constraints.maxWidth - 20.0; // -20.0 = padding

          final valuePosition =
              ((position.value - minValue) / (maxValue - minValue)) *
                  lineLength;

          return Stack(
            alignment: Alignment.center,
            children: [
              // Slider Container
              Container(
                height: 5.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: AppColors.greyColor,
                ),
              ),
              // Filled
              Positioned(
                left: 0.0,
                top: 0.0,
                bottom: 0.0,
                right: lineLength - valuePosition,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 5.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: AppColors.chzzkColor,
                    ),
                  ),
                ),
              ),
              // Current Position
              Align(
                alignment: Alignment(
                  ((position.value - minValue) / (maxValue - minValue) * 2 - 1),
                  0.0,
                ),
                child: const Icon(
                  Icons.circle,
                  color: AppColors.chzzkColor,
                  size: 20.0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
