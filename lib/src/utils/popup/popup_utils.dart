import 'package:flutter/material.dart';

import '../../common/constants/styles.dart';
import '../../common/widgets/center_widgets.dart';
import '../../common/widgets/focused_widget.dart';

enum DialogButtonType {
  singleButton,
  doubleButton,
}

class PopupUtils {
  /// Show popup dialog with a single button.
  static Future<void> showButtonDialog({
    /// Choose number of buttons(single or double).
    DialogButtonType buttonType = DialogButtonType.singleButton,
    required BuildContext context,
    required String titleText,
    required String contentText,
    double titleFontSize = 20.0,
    double fontSize = 16.0,
    String confirmText = '확인',
    String cancelText = '취소',
    VoidCallback? confirmCallback,
    VoidCallback? cancelFallback,
  }) async {
    await showDialog(
      context: context,
      useRootNavigator: false,
      // Set the value of 'barrierDismissible' to 'false'
      // to escape from the popup dialog when you click on an outside empty space.
      barrierDismissible: false,
      traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.greyContainerColor,
          title: Text(
            titleText,
            style: TextStyle(
              fontSize: titleFontSize,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: IntrinsicHeight(
            child: CenteredText(
              text: contentText,
              fontSize: fontSize,
              fontColor: AppColors.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: switch (buttonType) {
            DialogButtonType.singleButton => [
                PopupActionButton(
                  actionText: confirmText,
                  onPressed: () {
                    // Escape from popup dialog
                    if (dialogContext.mounted) Navigator.pop(dialogContext);
                  },
                ),
              ],
            DialogButtonType.doubleButton => [
                // Cancel
                PopupActionButton(
                  autofocus: true,
                  actionText: cancelText,
                  onPressed: () {
                    if (cancelFallback != null) cancelFallback();
                    // Escape from popup dialog
                    if (dialogContext.mounted) Navigator.pop(dialogContext);
                  },
                ),
                // Confirm
                PopupActionButton(
                  autofocus: false,
                  actionText: confirmText,
                  onPressed: () {
                    // Do action
                    if (confirmCallback != null) confirmCallback();

                    // Escape from popup dialog
                    if (dialogContext.mounted) Navigator.pop(dialogContext);
                  },
                ),
              ],
          },
        );
      },
    );
  }

  /// Show snackbar
  static void showSnackbar(
    BuildContext context,
    String content, {
    int milliseconds = 2000, // Display duration
    double bottomMargin = 0.0, // Position
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: bottomMargin),
        elevation: 0.0,
        backgroundColor: AppColors.blackColor.withOpacity(0.7),
        duration: Duration(milliseconds: milliseconds),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(bottomMargin < 0.1 ? 12.0 : 0.0),
            topRight: Radius.circular(bottomMargin < 0.1 ? 12.0 : 0.0),
          ),
        ),
        content: CenteredText(
          text: content,
          fontColor: AppColors.whiteColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  static Future<void> showWidgetDialog({
    required BuildContext context,
    required String titleText,
    required Widget Function(BuildContext dialogContext) content,
    double titleFontSize = 16.0,
  }) async {
    await showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.greyContainerColor,
          title: Text(
            titleText,
            style: TextStyle(
              fontSize: titleFontSize,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: content(dialogContext),
        );
      },
    );
  }
}

class PopupActionButton extends StatelessWidget {
  const PopupActionButton({
    super.key,
    this.autofocus = true,
    this.fontSize = 14.0,
    required this.actionText,
    required this.onPressed,
  });

  /// If you use this in [DoubleButtonDialog],
  /// use this as true for either of them.
  final bool autofocus;

  final double fontSize;

  /// Show user what this button do.
  final String actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlinedButton(
      autofocus: autofocus,
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      onPressed: onPressed,
      unFocusedBorderColor: AppColors.greyColor,
      child: (_) => Text(
        actionText,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
