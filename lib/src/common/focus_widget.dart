import 'package:flutter/material.dart';

class FocusWidget extends StatelessWidget {
  const FocusWidget({
    super.key,
    required this.focusNode,
    this.onkey,
    required this.child,
  });

  final FocusNode focusNode;
  final Function(RawKeyEvent event)? onkey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: focusNode,
      onKey: onkey,
      child: child,
    );
  }
}
