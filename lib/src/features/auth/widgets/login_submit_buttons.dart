import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
    required this.cancelCallback,
    required this.confirmCallback,
    required this.confirmFocusNode,
  });

  final VoidCallback cancelCallback;
  final VoidCallback confirmCallback;
  final FocusNode confirmFocusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _button(
          '취소',
          cancelCallback,
          null,
        ),
        const SizedBox(
          width: 10.0,
        ),
        _button(
          '확인',
          confirmCallback,
          confirmFocusNode,
        ),
      ],
    );
  }

  Widget _button(String text, VoidCallback callback, FocusNode? focusNode) {
    return ElevatedButton(
      focusNode: focusNode,
      onPressed: callback,
      child: Text(text),
    );
  }
}
