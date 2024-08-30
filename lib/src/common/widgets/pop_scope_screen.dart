import 'package:flutter/material.dart';

class PopScopeScreen extends StatelessWidget {
  /// A [Scaffold] wrapped by [PopScope] to use [onPopInvoked]
  /// for sidebar and content screen navigation.
  const PopScopeScreen({
    super.key,
    required this.onPopInvoked,
    required this.body,
  });

  final void Function(bool didPop) onPopInvoked;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: onPopInvoked,
      child: Scaffold(body: body),
    );
  }
}
