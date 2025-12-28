import 'package:flutter/material.dart';

import '../../common/constants/enums.dart' show DialogButtonType;
import '../../common/constants/styles.dart' show AppColors;
import '../../common/widgets/ui/ui_widgets.dart'
    show CenteredText, FocusedOutlinedButton, HeaderText;

abstract class PopupUtils {
  const PopupUtils._();

  /// Shows the [SnackBar]. If the Snackbar position is at the bottom, it shows a
  /// rounded snack bar, and if it's at the top, it shows a flat SnackBar.
  static void showSnackBar({
    required BuildContext context,
    required String content,
    double bottomMargin = 0.0,

    /// Opacity of background container.
    double alpha = 0.7,

    /// Display duration in milliseconds.
    int displayDuration = 2000,
  }) {
    final Radius radius = Radius.circular(bottomMargin < 0.1 ? 12.0 : 0.0);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: bottomMargin),
        elevation: 0.0,
        backgroundColor: AppColors.blackColor.withValues(alpha: alpha),
        duration: Duration(milliseconds: displayDuration),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: radius,
            topRight: radius,
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

  /// Shows a dialog with a button or buttons.
  static Future<void> showButtonDialog({
    required BuildContext context,
    required String titleText,
    required String contentText,
    DialogButtonType buttonType = DialogButtonType.singleButton,
    double titleFontSize = 20.0,
    double contentFontSize = 16.0,
    String confirmText = '확인',
    String cancelText = '취소',
    VoidCallback? confirmCallback,
    VoidCallback? fallback,
  }) async {
    await showDialog(
      context: context,
      useRootNavigator: false,
      // Set the value of `barrierDismissible` to `false`
      // to escape from the popup dialog when you click on an outside empty space.
      barrierDismissible: false,
      traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
      builder: (dialogContext) {
        PopupActionButton createButton({
          required String text,
          required VoidCallback? callback,
          bool autofocus = false,
        }) {
          return PopupActionButton(
            autofocus: autofocus,
            actionText: text,
            onPressed: () {
              callback?.call();
              if (dialogContext.mounted) Navigator.pop(dialogContext);
            },
          );
        }

        return AlertDialog(
          backgroundColor: AppColors.greyContainerColor,
          title: HeaderText(
            text: titleText,
            fontSize: titleFontSize,
          ),
          content: _PopupDialogContent(
            contentText: contentText,
            contentFontSize: contentFontSize,
          ),
          actions: switch (buttonType) {
            DialogButtonType.singleButton => [
                createButton(
                  autofocus: true,
                  text: confirmText,
                  callback: confirmCallback,
                ),
              ],
            DialogButtonType.doubleButton => [
                createButton(
                  text: cancelText,
                  callback: fallback,
                  autofocus: true,
                ),
                createButton(
                  text: confirmText,
                  callback: confirmCallback,
                ),
              ]
          },
        );
      },
    );
  }

  static Future<dynamic> showWidgetDialog({
    Color backgroundColor = AppColors.backgroundBlack,
    required BuildContext context,
    required Widget Function(BuildContext dialogContext) widget,
  }) async {
    await showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.backgroundBlack,
        content: widget(dialogContext),
      ),
    );
  }
}

class _PopupDialogContent extends StatelessWidget {
  const _PopupDialogContent({
    required this.contentText,
    required this.contentFontSize,
  });

  final String contentText;
  final double contentFontSize;

  @override
  Widget build(BuildContext context) {
    // for using dynamic height
    return IntrinsicHeight(
      child: CenteredText(
        text: contentText,
        fontSize: contentFontSize,
        fontWeight: FontWeight.w500,
      ),
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
  final String actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlinedButton(
      autofocus: autofocus,
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      onPressed: onPressed,
      unFocusedBorderColor: AppColors.whiteColor,
      child: Text(
        actionText,
        style: TextStyle(
          fontSize: fontSize,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
