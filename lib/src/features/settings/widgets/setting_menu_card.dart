import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/ui_widgets.dart' show FocusedOutlinedButton;

class SettingMenuCard extends StatelessWidget {
  const SettingMenuCard({
    super.key,
    required this.currentIndex,
    required this.itemIndex,
    required this.autofocus,
    required this.focusNode,
    required this.onPressed,
    required this.icon,
    required this.subject,
  });

  final int currentIndex;
  final int itemIndex;
  final bool autofocus;
  final FocusNode focusNode;
  final VoidCallback onPressed;
  final IconData icon;
  final String subject;

  @override
  Widget build(BuildContext context) {
    final Color color =
        currentIndex == itemIndex ? AppColors.chzzkColor : AppColors.whiteColor;

    return FocusedOutlinedButton(
      autofocus: autofocus,
      focusNode: focusNode,
      padding: const EdgeInsets.all(10.0),
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              icon,
              size: 24.0,
              color: color,
            ),
          ),
          const SizedBox(width: 5.0),
          Expanded(
            flex: 2,
            child: Text(
              subject,
              style: TextStyle(
                fontSize: 14.0,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
