import 'package:flutter/material.dart';

import 'layouts_design.dart';

class SplitListLayout extends StatelessWidget {
  const SplitListLayout({
    super.key,
    required this.leading,
    required this.trailing,
    this.gap = TvLayoutDesign.splitListGap,
    this.leadingFlex = 1,
    this.trailingFlex = 1,
    this.leadingWidth,
    this.trailingWidth,
  });

  final Widget leading;
  final Widget trailing;
  final double gap;
  final int leadingFlex;
  final int trailingFlex;
  final double? leadingWidth;
  final double? trailingWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SplitListPane(
          flex: leadingFlex,
          width: leadingWidth,
          child: leading,
        ),
        SizedBox(width: gap),
        _SplitListPane(
          flex: trailingFlex,
          width: trailingWidth,
          child: trailing,
        ),
      ],
    );
  }
}

class _SplitListPane extends StatelessWidget {
  const _SplitListPane({
    required this.flex,
    required this.width,
    required this.child,
  });

  final int flex;
  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = this.width;
    if (width != null) {
      return SizedBox(width: width, child: child);
    }

    return Expanded(flex: flex, child: child);
  }
}
