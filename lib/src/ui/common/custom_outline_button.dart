import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants/styles.dart';

class CustomOutlineButton extends HookWidget {
  /// A custom outline button.
  ///
  /// The outline is shown when this widget has focus.
  const CustomOutlineButton({
    super.key,
    this.autofocus = false,
    required this.onPressed,
    required this.child,
    this.borderRadius = 10.0,
    this.padding = EdgeInsets.zero,
    this.focusNode,
  });

  final bool autofocus;
  final VoidCallback? onPressed;
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final focusState = useState<bool?>(null);

    return OutlinedButton(
      autofocus: autofocus,
      focusNode: focusNode,
      onFocusChange: (value) {
        focusState.value = value;
      },
      style: OutlinedButton.styleFrom(
        minimumSize: Size.zero,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(
          width: 1.5,
          color: focusState.value == true
              ? AppColors.chzzkColor
              : Colors.transparent,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

class CustomTextButton extends StatelessWidget {
  /// A custom outline text button.
  ///
  /// The outline is shown when this widget has focus.
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 14.0,
    this.textOverflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.w600, // Semi-bold.
  });

  final String text;
  final VoidCallback onPressed;
  final double fontSize;
  final TextOverflow textOverflow;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return CustomOutlineButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: AppColors.whiteColor,
          overflow: TextOverflow.ellipsis,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
