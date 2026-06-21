import 'package:flutter/material.dart';

import '../../../design/design.dart';

class TvListContainer extends StatelessWidget {
  const TvListContainer({
    super.key,
    required this.child,
    this.dense = false,
    this.padding,
  });

  final Widget child;
  final bool dense;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColorTokens.neutral10,
        borderRadius: TvRadius.xl.borderRadius,
      ),
      child: Padding(
        padding:
            padding ??
            (dense
                ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
                : const EdgeInsets.all(16)),
        child: child,
      ),
    );
  }
}
