import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/dpad_widgets.dart';
import '../../../common/widgets/focused_widget.dart';

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
      onFocusChange: (value) {
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items,
      ),
    );
  }
}

class ControlIcon extends StatelessWidget {
  /// Icon with label to control video player.
  const ControlIcon({
    super.key,
    this.autofocus = false,
    this.focusNode,
    this.iconSize = 25.0,
    this.label,
    required this.iconData,
    required this.onPressed,
  });

  final bool autofocus;
  final FocusNode? focusNode;

  /// If label is null, show only an icon.
  final String? label;
  final double iconSize;

  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: FocusedOutlinedButton(
        autofocus: autofocus,
        focusNode: focusNode,
        padding: const EdgeInsets.all(5.0),
        onPressed: onPressed,
        child: (_) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: iconSize,
                color: AppColors.whiteColor,
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
    );
  }
}
