import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/hooks/custom_hooks.dart';
import '../../../constants/dimensions.dart' show Dimensions;
import '../../../constants/enums.dart' show DpadAction;
import '../../dpad/dpad_widgets.dart'
    show DpadCallbackShortcuts, ShortcutsBindings;
import '../../ui/ui_widgets.dart' show CenteredText;

class AdaptiveGridViewWithAsyncValue<T> extends HookWidget {
  const AdaptiveGridViewWithAsyncValue({
    super.key,
    required this.asyncValue,
    this.crossAxisCount = 3,
    this.crossAxisSpacing = 10.0,
    this.mainAxisExtent = Dimensions.videoContainerHeight,
    this.mainAxisSpacing = 10.0,
    this.useFetchMore = true,
    this.fetchMore,
    required this.gridViewFSN,
    this.leftFSN,
    this.headerFSN,
    required this.emptyText,
    required this.errorText,
    required this.itemBuilder,
  });

  /// A list of items.
  final AsyncValue<List<T>?> asyncValue;

  /// Number of items in a row.
  final int crossAxisCount;

  /// crossAxisSpacing = right side padding.
  final double crossAxisSpacing;

  /// Height of an item.
  final double mainAxisExtent;

  /// mainAxisSpacing = bottom side padding.
  final double mainAxisSpacing;

  /// Use infinite scrolling.
  final bool useFetchMore;

  /// A function for infinit scrolling.
  final Future<void> Function()? fetchMore;

  /// This gridview's [FocusScopeNode].
  final FocusScopeNode gridViewFSN;

  /// Left side(sidebar or something) [FocusScopeNode].
  final FocusScopeNode? leftFSN;

  /// Top side(following button or something) [FocusScopeNode].
  final FocusScopeNode? headerFSN;

  /// If the list is empty show messages.
  final String emptyText;
  final String errorText;

  final Widget Function(
    BuildContext context,
    int index,
    FocusNode node,
    T object,
  ) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      data: (data) {
        if (data == null) return CenteredText(text: errorText);

        final focusNodes = useFocusNodes(data.length);

        return AdaptiveGridView(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          fetchMore: fetchMore,
          headerFSN: headerFSN,
          leftFSN: leftFSN,
          mainAxisExtent: mainAxisExtent,
          mainAxisSpacing: mainAxisSpacing,
          useFetchMore: useFetchMore,
          gridViewFSN: gridViewFSN,
          emptyText: emptyText,
          focusNodes: focusNodes,
          items: data,
          itemBuilder: (context, index) {
            final object = data[index];
            final node = focusNodes[index];

            return itemBuilder(context, index, node, object);
          },
        );
      },
      error: (_, __) => CenteredText(text: errorText),
      loading: () => const SizedBox.shrink(),
    );
  }
}

class AdaptiveGridView<T> extends HookWidget {
  /// This GridView calculates the width of an item based on crossAxisCount.
  const AdaptiveGridView({
    super.key,
    this.crossAxisCount = 3,
    this.crossAxisSpacing = 10.0,
    this.mainAxisExtent = Dimensions.videoContainerHeight,
    this.mainAxisSpacing = 10.0,
    this.useFetchMore = true,
    this.fetchMore,
    required this.gridViewFSN,
    this.leftFSN,
    this.headerFSN,
    required this.emptyText,
    required this.focusNodes,
    required this.items,
    required this.itemBuilder,
  });

  /// Number of items in a row.
  final int crossAxisCount;

  /// crossAxisSpacing = right side padding.
  final double crossAxisSpacing;

  /// Height of an item.
  final double mainAxisExtent;

  /// mainAxisSpacing = bottom side padding.
  final double mainAxisSpacing;

  /// Use infinite scrolling.
  final bool useFetchMore;

  /// A function for infinit scrolling.
  final Future<void> Function()? fetchMore;

  /// This gridview's [FocusScopeNode].
  final FocusScopeNode gridViewFSN;

  /// Left side(sidebar or something) [FocusScopeNode].
  final FocusScopeNode? leftFSN;

  /// Top side(following button or something) [FocusScopeNode].
  final FocusScopeNode? headerFSN;

  /// If the list is empty show messages.
  final String emptyText;

  final List<FocusNode> focusNodes;

  /// A list of items.
  final List<T>? items;

  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    if (useFetchMore && fetchMore != null) {
      useInfiniteScroll(
        scrollController: scrollController,
        fetchMore: fetchMore,
      );
    }

    useVerticalGridViewAutoScroll(
      scrollController: scrollController,
      focusNodes: focusNodes,
      crossAxisCount: crossAxisCount,
      itemHeight: mainAxisExtent,
      mainAxisSpacing: mainAxisSpacing,
    );

    return (items == null || items!.isEmpty)
        ? CenteredText(text: emptyText)
        : FocusScope(
            node: gridViewFSN,
            child: GridView.builder(
              controller: scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisExtent: mainAxisExtent,
                mainAxisSpacing: mainAxisSpacing,
              ),
              itemCount: items?.length,
              itemBuilder: (context, index) =>
                  _buildItemWithShorcuts(context, index),
            ),
          );
  }

  Widget _buildItemWithShorcuts(BuildContext context, int index) {
    // Get the appropriate bindings for this item
    return DpadCallbackShortcuts(
      dpadKeyNodeMap: {
        DpadAction.arrowLeft: leftFSN,
        DpadAction.arrowUp: headerFSN,
      },
      bindings: _getBindingsForPosition(index),
      child: itemBuilder(context, index),
    );
  }

  ShortcutsBindings _getBindingsForPosition(int index) {
    ShortcutsBindings bindings = {};

    final bool isTopRow = index < crossAxisCount;
    final bool isLeftColumn = index % crossAxisCount == 0;
    final bool isTopLeft = index == 0;

    // Add left arrow binding for leftmost items
    if (isLeftColumn || isTopLeft) {
      bindings[const SingleActivator(LogicalKeyboardKey.arrowLeft)] = () {
        leftFSN?.requestFocus();
      };
    }

    // Add up arrow binding for top row items
    if (isTopRow || isTopLeft) {
      bindings[const SingleActivator(LogicalKeyboardKey.arrowUp)] = () {
        headerFSN?.requestFocus();
      };
    }

    return bindings;
  }
}
