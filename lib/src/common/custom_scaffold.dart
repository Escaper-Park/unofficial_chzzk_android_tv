import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  /// Custom Scaffold
  const CustomScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.useUnfocus = false,
    this.useSafeArea = true,
    this.useTextField = false,
    this.horizontalPadding = 0.0,
    this.topPadding = 12.0,
    this.bottomPadding = 12.0,
    this.backgroundColor,
  });

  /// This appBar can only be used by a PreferredSizeWidget, not a Widget.
  final PreferredSizeWidget? appBar;

  /// The body widget.
  final Widget body;

  /// If this is true, the textField is unfocused
  /// when you tap an empty space(background scaffold).
  /// Default value is false.
  final bool useUnfocus;

  /// If this is true, the widgets in body are placed outside of safe area only.
  /// Default value is true.
  final bool useSafeArea;

  /// Double value of horizontal padding of Body.
  /// Default value is 0.0.
  final double horizontalPadding;

  /// Double value of top padding of Body.
  /// Default value is 12.0.
  final double topPadding;

  /// Double value of bottom padding of Body.
  /// Default value is 12.0.
  final double bottomPadding;

  /// Background Color of scaffold.
  /// If you want to change the background color of scaffold, set backgroundColor with transparent and wrap this scaffold with a Colored Container.
  final Color? backgroundColor;

  /// Set this true to avoid renderflex overflow error when you using textfield.
  final bool useTextField;

  @override
  Widget build(BuildContext context) {
    return useUnfocus
        ? GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: _scaffold(),
          )
        : _scaffold();
  }

  Widget _scaffold() {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: !useTextField,
      body: Padding(
        padding: EdgeInsets.only(
          left: horizontalPadding,
          right: horizontalPadding,
          top: topPadding,
          bottom: bottomPadding,
        ),
        child: useSafeArea ? SafeArea(child: body) : body,
      ),
    );
  }
}
