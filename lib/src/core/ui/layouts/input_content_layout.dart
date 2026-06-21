import 'package:flutter/material.dart';

import 'layouts_design.dart';

class InputContentLayout extends StatelessWidget {
  const InputContentLayout({
    super.key,
    required this.input,
    required this.content,
    this.padding = TvLayoutDesign.horizontalScreenPadding,
    this.gap = TvLayoutDesign.inputContentGap,
  });

  final Widget input;
  final Widget content;
  final EdgeInsetsGeometry padding;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          input,
          SizedBox(height: gap),
          Expanded(child: content),
        ],
      ),
    );
  }
}
