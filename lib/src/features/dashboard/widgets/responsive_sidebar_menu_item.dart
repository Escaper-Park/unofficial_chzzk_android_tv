import 'package:flutter/material.dart';

import './responsive_sidebar_tile.dart';
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/ui_widgets.dart' show CenteredText;

class ResponsiveSidebarMenuItem extends StatelessWidget {
  /// A responsive sidebar item consisting of an icon and text.
  ///
  /// When the sidebar has focus, it displays both the icon and the text,
  /// otherwise, it displays only the icon.
  const ResponsiveSidebarMenuItem({
    super.key,
    required this.sidebarHasFocus,
    required this.isCurrentScreen,
    required this.iconData,
    required this.menuText,
    this.iconSize = 25,
    this.fontSize = 14.0,
    required this.onPressed,
  });

  /// Sidebar focus state to determine the expanded state of the tiles.
  final bool sidebarHasFocus;

  final bool isCurrentScreen;

  /// A collapsed side's icon.
  final IconData iconData;

  /// A Expanded side's text.
  final String menuText;

  final double iconSize;
  final double fontSize;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // highlight current screen's sidebar item.
    final Color color =
        isCurrentScreen ? AppColors.chzzkColor : AppColors.whiteColor;

    return ResponsiveSidebarTile(
      autofocus: isCurrentScreen,
      sidebarHasFocus: sidebarHasFocus,
      collapsedWidget: _icon(color),
      expandedWidget: _text(color),
      onPressed: onPressed,
    );
  }

  // collapsed and expanded
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

  // only expanded
  Widget _text(Color color) {
    return CenteredText(
      text: menuText,
      fontColor: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }
}
