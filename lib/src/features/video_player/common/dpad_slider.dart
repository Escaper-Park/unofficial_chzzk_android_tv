import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/dpad_widgets.dart';

class DpadSlider extends HookWidget {
  /// A horizontal slider to control values such as video time position or volume.
  const DpadSlider({
    super.key,
    required this.controller,
    required this.sliderFSN,
    this.dpadKeyFocusScopeNodeMap,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    this.intervalScalingFactor = 0.01,
    this.updateSliderEverySecond = false,
    required this.sliderMoveCallback,
    required this.resetTimerCallback,
  });

  final VideoPlayerController controller;

  /// This slider's FocusScopeNode.
  final FocusScopeNode sliderFSN;

  /// Playback control's FocusScopeNode.
  final Map<DpadAction, FocusScopeNode?>? dpadKeyFocusScopeNodeMap;

  final double minValue;
  final double maxValue;

  /// Initial position.
  final double initialValue;

  /// On arrowLeft of arrowRight key click.
  final Function(double position) sliderMoveCallback;

  /// Timer reset function
  final VoidCallback resetTimerCallback;

  /// Calculate interval with this scaling factor to move position of long video fast.
  ///
  /// If the value is volume, the maxValue is 1.0 and the minValue is 0.0
  /// so this factor should be 0.01 to divide range into 100.
  final double intervalScalingFactor;

  /// Set this true to update slider position every second.
  ///
  /// Use this to the vod playback slider.
  final bool updateSliderEverySecond;

  @override
  Widget build(BuildContext context) {
    final dpadFocusNode = useFocusNode();

    final position = useState<double>(initialValue);
    final double interval = (maxValue - minValue) * intervalScalingFactor;

    // Update position every second.
    if (updateSliderEverySecond) {
      final secondTimer = useRef<Timer?>(null);
      useEffect(() {
        secondTimer.value = Timer.periodic(const Duration(seconds: 1), (_) {
          final currentPos = controller.value.position.inSeconds.toDouble();
          if (currentPos <= maxValue && currentPos >= minValue) {
            position.value = currentPos;
          }
        });
        return () => secondTimer.value?.cancel();
      }, [controller, maxValue, minValue]);
    }

    return DpadFocusScopeNavigator(
      node: sliderFSN,
      dpadKeyFocusScopeNodeMap: dpadKeyFocusScopeNodeMap ?? {},
      onFocusChange: (value) {
        if (value) dpadFocusNode.requestFocus();
      },
      child: DpadActionWidget(
        focusNode: dpadFocusNode,
        useFocusedBorder: true,
        useKeyRepeatEvent: true,
        dpadActionCallbacks: {
          DpadAction.arrowLeft: () {
            position.value - interval > minValue
                ? position.value -= interval
                : position.value = minValue;

            sliderMoveCallback(position.value);
            resetTimerCallback();
          },
          DpadAction.arrowRight: () {
            position.value + interval < maxValue
                ? position.value += interval
                : position.value = maxValue;

            sliderMoveCallback(position.value);
            resetTimerCallback();
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
