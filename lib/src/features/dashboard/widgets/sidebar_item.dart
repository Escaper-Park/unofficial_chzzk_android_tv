import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/focused_outline_button.dart';

class SidebarItem extends StatelessWidget {
  const SidebarItem({
    super.key,
    required this.parentHasFocus,
    required this.focusNode,
    required this.currentIndex,
    required this.screenIndex,
    required this.iconData,
    required this.text,
    required this.onPressed,
  });

  final bool parentHasFocus;
  final FocusNode focusNode;
  final int currentIndex;
  final int screenIndex;
  final IconData iconData;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Color color = currentIndex == screenIndex
        ? AppColors.chzzkColor
        : AppColors.whiteColor;

    const double iconSize = 25.0;

    return FocusedOutlineButton(
      padding: const EdgeInsets.all(10.0),
      radius: 12.0,
      focusNode: focusNode,
      onPressed: onPressed,
      child: parentHasFocus
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  iconData,
                  color: color,
                  size: iconSize,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                iconData,
                color: color,
                size: iconSize,
              ),
            ),
    );
  }
}
