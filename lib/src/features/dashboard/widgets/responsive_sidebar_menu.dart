import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/center_widgets.dart';
import './responsive_sidebar_item_container.dart';

class ResponsiveSidebarMenu extends StatelessWidget {
  /// Responsive sidebar item consisting of an icon and text.
  ///
  /// When the sidebar has focus, it shows both the icon and text.
  /// Otherwise, it shows only the icon.
  const ResponsiveSidebarMenu({
    super.key,
    this.iconSize = 25.0,
    this.fontSize = 14.0,
    required this.sidebarHasFocus,
    required this.focusNode,
    required this.currentScreenIndex,
    required this.menuIndex,
    required this.iconData,
    required this.menuText,
    required this.onPressed,
  });

  /// Default value is 25.0.
  final double iconSize;

  /// Default value is 14.0.
  final double fontSize;

  /// Sidebar's focus state.
  final bool sidebarHasFocus;

  /// This item's focusNode.
  final FocusNode focusNode;

  /// Current content area's index to notice you what screen is currently activate.
  final int currentScreenIndex;

  /// This menu's index is used to highlight the sidebar item when this menu's screen is activated.
  final int menuIndex;

  /// Collapsed side's icon.
  final IconData iconData;

  /// Expanded side's text.
  final String menuText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // Highlight current screen's sidebar item.
    final Color color = currentScreenIndex == menuIndex
        ? AppColors.chzzkColor
        : AppColors.whiteColor;

    return ResponsiveSidebarItemContainer(
      focusNode: focusNode,
      sidebarHasFocus: sidebarHasFocus,
      onPressed: onPressed,
      collapsedWidget: _icon(color),
      expandedWidget: _text(color),
    );
  }

  // Collapsed side
  Widget _icon(Color color) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Icon(
        iconData,
        color: color,
        size: iconSize,
      ),
    );
  }

  // Expanded side
  Widget _text(Color color) {
    return CenteredText(
      text: menuText,
      fontSize: fontSize,
      fontColor: color,
    );
  }
}
