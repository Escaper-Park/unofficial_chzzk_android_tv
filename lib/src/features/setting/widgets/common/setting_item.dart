import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/focused_widget.dart';
import '../../../../common/widgets/header_text.dart';

/// Type of the setting value.
///
/// It depends on whether the number of setting values is fixed or
/// it's an infinite(or finite) range like an int value.
enum SettingItemType {
  limited, // If there is a fixed number of values that can be set.
  range, // If the value that can be set is in the range of int or something.
}

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    this.itemType = SettingItemType.range,
    this.autofocus = false,
    required this.settingMenuFSN,
    required this.headerText,
    this.displayTextList,
    required this.currentValue,
    required this.minValue,
    required this.maxValue,
    this.unitSuffix,
    required this.onUpdate,
  }) : assert(itemType != SettingItemType.limited || displayTextList != null,
            'displayText cannot be null when itemType is SettingItemType.limited');

  /// Type of the setting value.
  ///
  /// It depends on whether the number of setting values is fixed or
  /// it's an infinite(or finite) range like an int value.
  final SettingItemType itemType;

  final bool autofocus;

  /// FocusScopeNode to focus setting menu when user press the arrow left button
  /// at the left side button.
  final FocusScopeNode settingMenuFSN;

  /// Setting item's header.
  final String headerText;

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

  /// Callback when the arrow up button is preseed.
  final Function(int updateValue) onUpdate;

  @override
  Widget build(BuildContext context) {
    String displayText = itemType == SettingItemType.limited
        ? displayTextList![currentValue]
        : currentValue.toString();

    if (unitSuffix != null) displayText = '$displayText ${unitSuffix!}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Header
        SizedBox(
          width: Dimensions.settingHeaderTextWidth,
          child: HeaderText(text: headerText, fontSize: 14.0),
        ),
        const SizedBox(width: 10.0),
        // display value
        SizedBox(
          width: Dimensions.settingDisplayValueWidth,
          child: Text(
            displayText,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 14.0,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 30.0),
        // up button
        CallbackShortcuts(
          bindings: {
            const SingleActivator(LogicalKeyboardKey.arrowLeft):
                settingMenuFSN.requestFocus,
          },
          child: _button(
            autofocus: autofocus,
            Icons.arrow_upward_rounded,
            () {
              final updatedValue = currentValue + 1;
              if (updatedValue <= maxValue) onUpdate(updatedValue);
            },
          ),
        ),
        // down button
        _button(
          Icons.arrow_downward_rounded,
          () {
            final updatedValue = currentValue - 1;
            if (updatedValue >= minValue) onUpdate(updatedValue);
          },
        ),
      ],
    );
  }

  Widget _button(
    IconData iconData,
    VoidCallback callback, {
    bool autofocus = false,
  }) {
    return FocusedOutlinedButton(
      autofocus: autofocus,
      onPressed: callback,
      padding: const EdgeInsets.all(5.0),
      borderRadius: 12.0,
      child: (hasFocus) => Icon(
        iconData,
        color: AppColors.whiteColor,
      ),
    );
  }
}
