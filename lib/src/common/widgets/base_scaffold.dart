import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseScaffold extends ConsumerWidget {
  const BaseScaffold({
    super.key,
    required this.body,
    this.horizontalPadding = 16.0,
    this.verticalPadding = 24.0,
    this.useTextField = false,
    this.appBar,
  });

  /// A child of scaffold.
  final Widget body;

  /// Horizontal padding of the scaffold.
  ///
  /// Default value is 16.0
  final double horizontalPadding;

  /// Vertical padding of the scaffold.
  ///
  /// Default value is 24.0
  final double verticalPadding;

  /// If you use textfield in a scaffold, set this value to true for avoiding
  /// screen overflow error.
  final bool useTextField;

  ///
  final AppBar? appBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBar,
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
