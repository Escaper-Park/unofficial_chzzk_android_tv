import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.useTextField = false,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 16.0,
  });

  final Widget body;

  /// If you use textfield in a scaffold, set this value to true for avoiding
  /// screen overflow error.
  final bool useTextField;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: !useTextField,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: body,
      ),
    );
  }
}
