import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/dpad_widgets.dart';
import '../../setting/widgets/common/setting_item.dart';
import '../live/controller/live_overlay_controller.dart';

class ControlsNavigator extends StatelessWidget {
  /// A list of controls with dpad navigator
  const ControlsNavigator({
    super.key,
    required this.node,
    required this.dpadKeyFocusScopeNodeMap,
    required this.items,
  });

  final FocusScopeNode node;
  final Map<DpadAction, FocusScopeNode?> dpadKeyFocusScopeNodeMap;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return DpadFocusScopeNavigator(
      node: node,
      dpadKeyFocusScopeNodeMap: dpadKeyFocusScopeNodeMap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items,
      ),
    );
  }
}

class ControlIconButton extends StatelessWidget {
  /// Icon with label to control video player.
  const ControlIconButton({
    super.key,
    this.autofocus = false,
    this.focusNode,
    this.iconSize = 25.0,
    this.iconColor = AppColors.whiteColor,
    this.label,
    this.labelFontSize = 11.0,
    this.padding = const EdgeInsets.all(5.0),
    required this.iconData,
    this.useKeyRepeatEvent = false,
    required this.resetOverlayTimer,
    required this.onPressed,
  });

  final bool autofocus;
  final FocusNode? focusNode;

  final double iconSize;
  final Color iconColor;

  /// If label is null, show only an icon.
  final String? label;
  final double labelFontSize;

  final EdgeInsetsGeometry padding;
  final IconData iconData;

  final bool useKeyRepeatEvent;

  /// Reset overlay timer to keep overlay state.
  final VoidCallback resetOverlayTimer;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: DpadActionWidget(
        autofocus: autofocus,
        focusNode: focusNode,
        useFocusedBorder: true,
        useKeyRepeatEvent: useKeyRepeatEvent,
        dpadActionCallbacks: {
          DpadAction.arrowLeft: () {
            resetOverlayTimer();
          },
          DpadAction.arrowRight: () {
            resetOverlayTimer();
          },
          DpadAction.select: () {
            resetOverlayTimer();
            onPressed();
          }
        },
        child: Padding(
          padding: padding,
          child: SizedBox(
            width: iconSize * 2 - 10.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: iconSize,
                  color: iconColor,
                ),
                if (label != null) const SizedBox(height: 5.0),
                if (label != null)
                  Text(
                    label!,
                    style: const TextStyle(
                      fontSize: 11.0,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DpadControlIconButton extends ConsumerWidget {
  /// Control icon button with dpad.
  ///
  /// Change the setting value by clicking the arrow up and down buttons on the Dpad.
  const DpadControlIconButton({
    super.key,
    required this.videoFocusNode,
    this.autofocus = false,
    this.itemType = SettingItemType.range,
    required this.headerText,
    this.displayTextList,
    this.headerTextSize = 12.0,
    this.arrowIconSize = 15.0,
    this.displayTextSize = 14.0,
    required this.currentValue,
    required this.minValue,
    required this.maxValue,
    this.unitSuffix,
    this.onPressedSelect,
    required this.onUpdate,
  }) : assert(itemType != SettingItemType.limited || displayTextList != null,
            'displayText cannot be null when itemType is SettingItemType.limited');

  /// To hide overlay controller when the timer ends.
  final FocusNode videoFocusNode;

  /// Type of the setting value.
  ///
  /// It depends on whether the number of setting values is fixed or
  /// it's an infinite(or finite) range like an int value.
  final SettingItemType itemType;

  final bool autofocus;

  /// Setting item's header.
  final String headerText;

  /// header's font size
  final double headerTextSize;

  /// arrow icon size.
  final double arrowIconSize;

  /// display text's font size
  final double displayTextSize;

  /// The list of setting item values to be displayed.
  ///
  /// It's used when the SettingItemType is limited.
  final List<String>? displayTextList;

  /// Current Item's value.
  ///
  /// If the type of setting's value is bool, true is 1, false is 0.
  final int currentValue;

  /// Setting item's min value.
  final int minValue;

  /// Setting item's max value.
  final int maxValue;

  /// Add a unit at the end of the text.
  final String? unitSuffix;

  /// OnPressed Button
  final Function(int value)? onPressedSelect;

  /// Callback when the arrow up button is preseed.
  final Function(int updateValue) onUpdate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String displayText = itemType == SettingItemType.limited
        ? displayTextList![currentValue]
        : currentValue.toString();

    if (unitSuffix != null) displayText = '$displayText ${unitSuffix!}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: DpadActionWidget(
        autofocus: autofocus,
        useFocusedBorder: true,
        useKeyRepeatEvent: true,
        dpadActionCallbacks: {
          DpadAction.arrowLeft: () {
            _resetOverlayTimer(ref);
          },
          DpadAction.arrowRight: () {
            _resetOverlayTimer(ref);
          },
          DpadAction.arrowUp: () {
            final updatedValue = currentValue + 1;
            _resetOverlayTimer(ref);
            if (updatedValue <= maxValue) onUpdate(updatedValue);
          },
          DpadAction.arrowDown: () {
            final updatedValue = currentValue - 1;
            _resetOverlayTimer(ref);
            if (updatedValue >= minValue) onUpdate(updatedValue);
          },
          DpadAction.select: () {
            if (onPressedSelect != null) {
              onPressedSelect!(currentValue);
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              Icon(
                Icons.arrow_drop_up_rounded,
                size: arrowIconSize,
              ),
              Text(
                displayText,
                style: TextStyle(
                  fontSize: displayTextSize,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(
                Icons.arrow_drop_down_rounded,
                size: 15.0,
              ),
              Text(
                headerText,
                style: TextStyle(
                  fontSize: headerTextSize,
                  color: AppColors.whiteColor,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _resetOverlayTimer(WidgetRef ref) {
    ref
        .read(liveOverlayControllerProvider.notifier)
        .resetOverlayTimer(videoFocusNode: videoFocusNode);
  }
}
