import 'package:flutter/material.dart';

import '../../../../common/constants/enums.dart'
    show DpadAction, SettingItemType;
import '../../../../common/constants/dimensions.dart';
import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/dpad/dpad_widgets.dart'
    show DpadCallbackShortcuts;
import '../../../../common/widgets/ui/ui_widgets.dart'
    show FocusedOutlinedButton, HeaderText;

class SettingValueItem extends StatelessWidget {
  const SettingValueItem({
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
  }) : assert(
          itemType != SettingItemType.limited || displayTextList != null,
          'displayText cannot be null when itemType is SettingItemType.limited',
        );

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
        _buildHeader(),
        const SizedBox(width: 10.0),
        // display value
        _buildValue(displayText),
        const SizedBox(width: 30.0),
        // up button
        DpadCallbackShortcuts(
          dpadKeyNodeMap: {DpadAction.arrowLeft: settingMenuFSN},
          child: _button(
            autofocus: autofocus,
            Icons.arrow_upward_rounded,
            () {
              final updated = (currentValue + 1).clamp(minValue, maxValue);

              onUpdate(updated);
            },
          ),
        ),
        // down button
        _button(
          Icons.arrow_downward_rounded,
          () {
            final updated = (currentValue - 1).clamp(minValue, maxValue);

            onUpdate(updated);
          },
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      width: Dimensions.settingHeaderWidth,
      child: HeaderText(text: headerText, fontSize: 14.0),
    );
  }

  Widget _buildValue(String displayText) {
    return SizedBox(
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
      padding: const EdgeInsets.all(10.0),
      borderRadius: 8.0,
      child: Icon(
        iconData,
        color: AppColors.whiteColor,
      ),
    );
  }
}
