import 'package:flutter/material.dart';

import '../../../settings_screen_design.dart';

class SettingsPane extends StatelessWidget {
  const SettingsPane({
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
    const listHorizontalFocusBleed =
        SettingsScreenDesign.listHorizontalFocusBleed;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: panePadding.left,
            top: SettingsScreenDesign.headerTopPadding,
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
            padding: SettingsScreenDesign.listViewportPadding,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  left: panePadding.left - listHorizontalFocusBleed,
                  right: panePadding.right - listHorizontalFocusBleed,
                  child: SingleChildScrollView(
                    clipBehavior: Clip.hardEdge,
                    padding: SettingsScreenDesign.listContentPadding,
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
