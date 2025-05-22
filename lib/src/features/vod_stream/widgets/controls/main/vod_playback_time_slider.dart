import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

import '../../../../../common/constants/enums.dart'
    show DpadAction, PlaybackDirection;
import '../../../../../common/constants/styles.dart' show AppColors;
import '../../../../../common/widgets/dpad/dpad_widgets.dart';

class VodPlaybackTimeSlider extends HookWidget {
  const VodPlaybackTimeSlider({
    super.key,
    required this.controller,
    required this.playbackSliderFSN,
    required this.playbackButtonsFSN,
    required this.resetOverlayTimer,
    required this.seekToBySlider,
  });

  final VideoPlayerController controller;
  final FocusScopeNode playbackSliderFSN;
  final FocusScopeNode playbackButtonsFSN;
  final VoidCallback resetOverlayTimer;
  final void Function(PlaybackDirection direction, bool endSeek, double pos)
      seekToBySlider;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    final double intervalScalingFactor = 0.01;

    final minValue = 0.0;
    final maxValue = controller.value.duration.inSeconds.toDouble();
    final initialValue = controller.value.position.inSeconds.toDouble();
    final position = useState<double>(initialValue);
    final double interval = (maxValue - minValue) * intervalScalingFactor;

    // update position on controller changes
    useEffect(
      () {
        void update() {
          final curr = controller.value.position.inSeconds
              .toDouble()
              .clamp(minValue, maxValue);
          position.value = curr;
        }

        controller.addListener(update);
        return () => controller.removeListener(update);
      },
      [controller, minValue, maxValue],
    );

    return DpadFocusScopeNavigator(
      node: playbackSliderFSN,
      dpadKeyNodeMap: {
        DpadAction.arrowUp: playbackButtonsFSN,
      },
      onFocusChange: (value) {
        if (value) focusNode.requestFocus();
      },
      child: DpadActionWidget(
        autofocus: false,
        focusNode: focusNode,
        useFocusedBorder: true,
        useKeyRepeatEvent: true,
        customOnKeyEvent: (event, dpadActionCallbacks) {
          final String keyLabel = event.logicalKey.keyLabel;

          if (keyLabel == "Arrow Left" || keyLabel == "Arrow Right") {
            if (event is KeyUpEvent) {
              onKeyEvent(event, dpadActionCallbacks);
              seekToBySlider(
                keyLabel == "Arrow Left"
                    ? PlaybackDirection.backward
                    : PlaybackDirection.forward,
                true,
                position.value,
              );
            }

            if (event is KeyRepeatEvent) {
              onKeyEvent(event, dpadActionCallbacks);
              seekToBySlider(
                keyLabel == "Arrow Left"
                    ? PlaybackDirection.backward
                    : PlaybackDirection.forward,
                false,
                position.value,
              );
            }
          }
        },
        dpadActionCallbacks: {
          DpadAction.arrowLeft: () {
            position.value - interval > minValue
                ? position.value -= interval
                : position.value = minValue;

            resetOverlayTimer();
          },
          DpadAction.arrowRight: () {
            position.value + interval < maxValue
                ? position.value += interval
                : position.value = maxValue;

            resetOverlayTimer();
          },
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final lineLength = constraints.maxWidth;

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
                      ((position.value - minValue) / (maxValue - minValue) * 2 -
                          1),
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
        ),
      ),
    );
  }
}
