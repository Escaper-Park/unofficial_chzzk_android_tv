import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../category/model/category.dart';
import '../../following/model/following.dart';
import '../../live/model/live_info.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/ui/ui_widgets.dart' show HeaderText;
import '../../../common/widgets/dpad/dpad_widgets.dart'
    show DpadListViewWithAsyncValue;

class HomeHorizontalListViewWithHeaderText<T> extends StatelessWidget {
  /// A horizontal axis [ListView] of videos or categories in the [HomeScreen].
  ///
  /// The available generic types are [Following], [Category], and [LiveInfo].
  const HomeHorizontalListViewWithHeaderText({
    super.key,
    required this.headerText,
    required this.asyncList,
    this.itemWidth = Dimensions.videoContainerWidth,
    this.itemHeight = Dimensions.videoContainerHeight,
    required this.listViewFSN,
    required this.sidebarFSN,
    this.aboveFSN,
    this.belowFSN,
    required this.emptyText,
    required this.errorText,
    required this.fallbackAction,
    required this.itemBuilder,
  }) : assert(
          T == Following || T == Category || T == LiveInfo,
          '$T is not supported. Use Following, Category or LiveInfo only.',
        );

  /// Title of the list.
  final String headerText;

  /// An async list of type T.
  final AsyncValue<List<T>?> asyncList;

  /// The width of an item used for auto-scrolling.
  final double itemWidth;

  /// The width of an item used for auto-scrolling.
  final double itemHeight;

  final FocusScopeNode listViewFSN;

  /// FocusScopeNode for passing focus to the sidebar
  /// when the back button is pressed, or the left button is pressed
  /// while the first item has focus.
  final FocusScopeNode sidebarFSN;

  /// Add this to all lists except the top menu.
  final FocusScopeNode? aboveFSN;

  /// Add this to all lists except the categories list at the bottom.
  final FocusScopeNode? belowFSN;

  final String emptyText;
  final String errorText;

  final VoidCallback fallbackAction;

  final Widget Function(int index, FocusNode focusNode, T object) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        HeaderText(text: headerText),
        // ListView
        DpadListViewWithAsyncValue<T>(
          asyncValue: asyncList,
          scrollDirection: Axis.horizontal,
          itemWidth: itemWidth,
          itemHeight: itemHeight,
          emptyText: emptyText,
          errorText: errorText,
          sidebarFSN: sidebarFSN,
          listViewFSN: listViewFSN,
          aboveFSN: aboveFSN,
          belowFSN: belowFSN,
          fallbackAction: fallbackAction,
          itemBuilder: itemBuilder,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
