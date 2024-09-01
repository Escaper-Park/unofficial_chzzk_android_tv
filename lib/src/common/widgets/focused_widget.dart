import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../constants/styles.dart';

class FocusedOutlinedButton extends HookWidget {
  /// A button that changes the color of borderline/outline when getting focus.
  const FocusedOutlinedButton({
    super.key,
    this.autofocus = false,
    this.borderRadius = 12.0,
    this.borderWidth = 1.5,
    this.padding = EdgeInsets.zero,
    this.focusedBorderColor = AppColors.chzzkColor,
    this.focusedBackgroundColor,
    this.unFocusedBorderColor = Colors.transparent,
    this.focusNode,
    this.onPressed,
    required this.child,
  });

  final bool autofocus;

  /// Default value is 12.0.
  final double borderRadius;

  /// Default value is 1.5.
  final double borderWidth;

  /// The gap between border and child.
  ///
  /// Default value is EdgeInsets.zero.
  final EdgeInsetsGeometry padding;

  /// Color when this button has focus.
  final Color focusedBorderColor;

  /// Background Color when the button has focus
  final Color? focusedBackgroundColor;

  /// Color when this button doens't have focus.
  final Color unFocusedBorderColor;

  /// Use [FocusNode] if you want to call the focusNode in other widgets.
  final FocusNode? focusNode;
  final VoidCallback? onPressed;
  final Widget Function(bool? hasFocus) child;

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
        minimumSize: Size.zero, // Constraint
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: focusedBackgroundColor,
        
        // overlayColor: focusedBackgroundColor,
        side: BorderSide(
          width: borderWidth,
          color: focusState.value == true
              ? focusedBorderColor
              : unFocusedBorderColor,
        ),
      ),
      onPressed: onPressed,
      child: child(focusState.value),
    );
  }
}
