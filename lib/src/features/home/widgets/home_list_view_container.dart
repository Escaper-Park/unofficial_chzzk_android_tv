import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/dpad_widgets.dart';
import '../../../common/widgets/header_text.dart';

class HomeListViewContainer<T> extends StatelessWidget {
  /// Horizontal axis [ListView] of videos or categories.
  ///
  /// Available generic types are [Following], [LiveInfo] and [Category].
  const HomeListViewContainer({
    super.key,
    required this.headerText,
    required this.asyncValue,
    this.containerHeight = Dimensions.videoContainerHeight,
    this.containerWidth = Dimensions.videoContainerWidth,
    required this.emptyText,
    required this.errorText,
    required this.listFSN,
    required this.sidebarFSN,
    this.aboveFSN,
    this.belowFSN,
    required this.itemBuilder,
  });

  final String headerText;

  /// Async List of <T>.
  final AsyncValue<List<T>?> asyncValue;

  /// Different from T types. Check the category height.
  final double containerHeight;
  final double containerWidth;

  final String emptyText;
  final String errorText;

  final FocusScopeNode listFSN;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode? aboveFSN;
  final FocusScopeNode? belowFSN;

  /// FocusNode to move focus the sidebar when the item index is 0 and press arrowLeft key.
  final Widget Function(int index, FocusNode focusNode, T object) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          HeaderText(text: headerText, horizontalPadding: 0.0),
          // ListView
          DpadHorizontalListViewContainer<T>(
            asyncValue: asyncValue,
            containerHeight: containerHeight,
            containerWidth: containerWidth,
            emptyText: emptyText,
            errorText: errorText,
            listFSN: listFSN,
            sidebarFSN: sidebarFSN,
            aboveFSN: aboveFSN,
            belowFSN: belowFSN,
            itemBuilder: itemBuilder,
          ),
        ],
      ),
    );
  }
}
