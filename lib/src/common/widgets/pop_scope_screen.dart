import 'package:flutter/material.dart';

class PopScopeScreen extends StatelessWidget {
  /// A [Scaffold] wrapped by [PopScope] to use [onPopInvokedWithResult]
  /// for sidebar and content screen navigation.
  const PopScopeScreen({
    super.key,
    required this.onPopInvokedWithResult,
    required this.body,
  });

  final void Function(bool didPop, dynamic result) onPopInvokedWithResult;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: onPopInvokedWithResult,
      child: Scaffold(body: body),
    );
  }
}
