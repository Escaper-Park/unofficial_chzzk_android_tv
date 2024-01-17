import 'package:flutter/material.dart';

class PopupUtils {
  static Future<void> showSingleDialog({
    required BuildContext context,
    required String titleText,
    required String contentText,
    double contentHeight = 30.0,
  }) async {
    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      traversalEdgeBehavior: TraversalEdgeBehavior.leaveFlutterView,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            titleText,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          content: SizedBox(
            height: contentHeight,
            child: Center(
              child: Text(
                contentText,
                style: const TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          actions: [
            PopupActionButton(
              autoFocus: true,
              actionText: '확인',
              onPressed: () {
                if (dialogContext.mounted) Navigator.pop(dialogContext);
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showDoubleButtonDialog({
    required BuildContext context,
    required String titleText,
    required Widget content,
    String cancelText = '취소',
    String confirmText = '확인',
    VoidCallback? callback,
    // Use focusNode to auto-focus after submitting id and password.
    FocusNode? cancelFocusNode,
    FocusNode? confirmFocusNode,
    double contentHeight = 150.0,
  }) async {
    showDialog(
      // Set the value of 'barrierDismissible' to 'false'
      // to escape from the popup dialog when you click on an outside empty space.
      useRootNavigator: false,
      barrierDismissible: false,
      traversalEdgeBehavior: TraversalEdgeBehavior.leaveFlutterView,
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            titleText,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          content: SizedBox(
            height: contentHeight,
            child: Center(child: content),
          ),
          actions: [
            PopupActionButton(
              focusNode: cancelFocusNode,
              actionText: cancelText,
              onPressed: () {
                if (dialogContext.mounted) Navigator.pop(dialogContext);
              },
            ),
            PopupActionButton(
              focusNode: confirmFocusNode,
              actionText: confirmText,
              onPressed: () {
                if (callback != null) {
                  callback();
                }

                Navigator.pop(dialogContext);
              },
            ),
          ],
        );
      },
    );
  }
}

class PopupActionButton extends StatelessWidget {
  const PopupActionButton({
    super.key,
    required this.actionText,
    required this.onPressed,
    this.focusNode,
    this.autoFocus = false,
  });

  final String actionText;
  final VoidCallback onPressed;
  final FocusNode? focusNode;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      autofocus: autoFocus,
      focusNode: focusNode,
      onPressed: onPressed,
      child: Text(actionText),
    );
  }
}
