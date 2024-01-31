import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({
    super.key,
    required this.iconData,
    required this.menuTitle,
    required this.parentHasFocus,
    required this.currentIndex,
    required this.screenIndex,
    required this.onPressed,
  });

  final IconData iconData;
  final String menuTitle;
  final bool parentHasFocus;
  final int currentIndex;
  final int screenIndex;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Color color = currentIndex == screenIndex
        ? AppColors.chzzkColor
        : AppColors.whiteColor;

    return parentHasFocus
        ? MaterialButton(
            padding: const EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    iconData,
                    color: color,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      menuTitle,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : MaterialButton(
            padding: const EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            onPressed: onPressed,
            child: Icon(
              iconData,
              color: color,
            ),
          );
  }
}
