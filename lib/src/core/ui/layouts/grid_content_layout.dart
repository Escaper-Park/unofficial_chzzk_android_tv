import 'package:flutter/material.dart';

import 'layouts_design.dart';

class GridContentLayout extends StatelessWidget {
  const GridContentLayout({
    super.key,
    required this.content,
    this.tabsRow,
    this.header,
    this.action,
    this.headerRowPadding = TvLayoutDesign.horizontalScreenPadding,
    this.headerContentGap = TvLayoutDesign.gridHeaderContentGap,
  }) : assert(header != null || tabsRow != null);

  final Widget content;
  final Widget? tabsRow;
  final Widget? header;
  final Widget? action;
  final EdgeInsetsGeometry headerRowPadding;
  final double headerContentGap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: headerRowPadding,
          child:
              header ??
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  tabsRow!,
                  const Spacer(),
                  ?action,
                ],
              ),
        ),
        SizedBox(height: headerContentGap),
        Expanded(child: content),
      ],
    );
  }
}
