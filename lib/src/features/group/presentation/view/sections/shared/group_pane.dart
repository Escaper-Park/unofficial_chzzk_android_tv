import 'package:flutter/material.dart';

import '../../../group_screen_design.dart';

class GroupPane extends StatelessWidget {
  const GroupPane({
    super.key,
    required this.header,
    required this.content,
    required this.panePadding,
    this.sectionHeader,
  });

  final Widget header;
  final Widget content;
  final EdgeInsets panePadding;
  final Widget? sectionHeader;

  @override
  Widget build(BuildContext context) {
    final sectionHeader = this.sectionHeader;
    const listHorizontalFocusBleed = GroupScreenDesign.listHorizontalFocusBleed;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: panePadding.left,
            top: GroupScreenDesign.headerTopPadding,
            right: panePadding.right,
          ),
          child: header,
        ),
        if (sectionHeader != null)
          Padding(
            padding: EdgeInsets.only(
              left: panePadding.left,
              right: panePadding.right,
            ),
            child: sectionHeader,
          ),
        Expanded(
          child: Padding(
            padding: GroupScreenDesign.listViewportPadding,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  left: panePadding.left - listHorizontalFocusBleed,
                  right: panePadding.right - listHorizontalFocusBleed,
                  child: SingleChildScrollView(
                    clipBehavior: Clip.hardEdge,
                    padding: GroupScreenDesign.listContentPadding,
                    child: content,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
