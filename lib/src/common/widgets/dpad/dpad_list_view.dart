import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dpad_widgets.dart' show DpadKeyNodeMap, DpadFocusScopeNavigator;
import '../error/async_value_error_widget.dart';
import '../ui/ui_widgets.dart' show CenteredText, FocusedOutlinedButton;
import '../../../utils/hooks/custom_hooks.dart';
import '../../constants/dimensions.dart';
import '../../constants/enums.dart' show DpadAction;
import '../../../features/dashboard/widgets/sidebar_callback_shortcuts.dart'
    show SidebarCallbackShortcuts;

class DpadListView<T> extends HookWidget {
  const DpadListView({
    super.key,
    this.scrollController,
    this.focusNodes,
    required this.itemList,
    this.scrollDirection = Axis.horizontal,
    this.shrinkWrap = false,
    required this.listViewFSN,
    this.sidebarFSN,
    this.aboveFSN,
    this.belowFSN,
    this.leftFSN,
    this.rightFSN,
    this.horizontalPadding = 10.0,
    this.verticalPadding = 10.0,
    required this.itemBuilder,
  });

  /// Scroll Controller
  final ScrollController? scrollController;
  final List<FocusNode>? focusNodes;

  /// An async List of type of T.
  final List<T> itemList;

  final Axis scrollDirection;

  /// If true, the list will be as wide as the actual item width.
  final bool shrinkWrap;

  /// [FocusScopeNode] of this ListView.
  final FocusScopeNode listViewFSN;

  /// `Axis.horizontal`:
  /// When the first item(index is 0) has focus, pressing the arrow left
  /// will cause the sidebar to have focus.
  final FocusScopeNode? sidebarFSN;

  /// `Axis.horizontal`:
  /// Press the arrow up button to bring focus to the above list.
  final FocusScopeNode? aboveFSN;

  /// `Axis.horizontal`:
  /// Press the arrow down button to bring focus to the below list.
  final FocusScopeNode? belowFSN;

  /// `Axis.vertical`:
  /// Press the arrow left button to bring focus to the left list.
  final FocusScopeNode? leftFSN;

  /// `Axis.vertical`:
  /// Press the arrow right button to bring focus to the right list.
  final FocusScopeNode? rightFSN;

  final double? horizontalPadding;
  final double? verticalPadding;

  /// ItemBuilder that has own [FocusNode].
  final Widget Function(int index, FocusNode focusNode, T object) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final isFirstFocused = useState<bool>(true);

    final widgetFocusNodes = focusNodes ?? useFocusNodes(itemList.length);

    return DpadFocusScopeNavigator(
      node: listViewFSN,
      dpadKeyNodeMap: _dpadKeyNodeMap,
      onFocusChange: (value) {
        // Highlight first item
        if (value && isFirstFocused.value) {
          widgetFocusNodes[0].requestFocus();
          isFirstFocused.value = false;
        }
      },
      child: ListView.separated(
        shrinkWrap: shrinkWrap,
        controller: scrollController,
        scrollDirection: scrollDirection,
        itemCount: itemList.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (_, __) => _padding(),
        itemBuilder: (context, index) {
          final object = itemList[index];

          // Axis.horizontal && SidebarFSN is exist.
          if (scrollDirection == Axis.horizontal &&
              index == 0 &&
              sidebarFSN != null) {
            return _firstItemBuilder(widgetFocusNodes[0], object);
          }

          return itemBuilder(index, widgetFocusNodes[index], object);
        },
      ),
    );
  }

  DpadKeyNodeMap get _dpadKeyNodeMap => {
        DpadAction.arrowUp: aboveFSN,
        DpadAction.arrowDown: belowFSN,
        DpadAction.arrowLeft: leftFSN,
        DpadAction.arrowRight: rightFSN,
      };

  Widget _padding() {
    return SizedBox(
      width: scrollDirection == Axis.horizontal ? horizontalPadding : null,
      height: scrollDirection == Axis.vertical ? verticalPadding : null,
    );
  }

  /// When the first item(index is 0) has focus, pressing the arrow left
  /// will cause the sidebar to have focus.
  Widget _firstItemBuilder(FocusNode firstNode, T object) {
    return SidebarCallbackShortcuts(
      sidebarFSN: sidebarFSN,
      child: itemBuilder(0, firstNode, object),
    );
  }
}

class DpadListViewWithAsyncValue<T> extends HookWidget {
  const DpadListViewWithAsyncValue({
    super.key,
    required this.asyncValue,
    this.scrollDirection = Axis.horizontal,
    required this.itemWidth,
    required this.itemHeight,
    required this.listViewFSN,
    this.sidebarFSN,
    this.aboveFSN,
    this.belowFSN,
    this.leftFSN,
    this.rightFSN,
    this.horizontalPadding = 10.0,
    this.verticalPadding = 10.0,
    this.scrollPadding = 20.0,
    this.useFetchMore = false,
    this.fetchMore,
    required this.emptyText,
    required this.errorText,
    this.useExceptionFallbackWidget = true,
    this.exceptionWidgetAutofocus = true,
    this.fallbackAction,
    required this.itemBuilder,
  }) : assert(
          !(useExceptionFallbackWidget && fallbackAction == null),
          'fallback must not be null when useExceptionFallbackWidget is true.',
        );

  /// An async List of type of T.
  final AsyncValue<List<T>?> asyncValue;

  final Axis scrollDirection;

  /// The width of an item used for auto-scrolling.
  final double itemWidth;

  /// The height of an item.
  final double itemHeight;

  /// [FocusScopeNode] of this ListView.
  final FocusScopeNode listViewFSN;

  /// `Axis.horizontal`:
  /// When the first item(index is 0) has focus, pressing the arrow left
  /// will cause the sidebar to have focus.
  final FocusScopeNode? sidebarFSN;

  /// `Axis.horizontal`:
  /// Press the arrow up button to bring focus to the above list.
  final FocusScopeNode? aboveFSN;

  /// `Axis.horizontal`:
  /// Press the arrow down button to bring focus to the below list.
  final FocusScopeNode? belowFSN;

  /// `Axis.vertical`:
  /// Press the arrow left button to bring focus to the left list.
  final FocusScopeNode? leftFSN;

  /// `Axis.vertical`:
  /// Press the arrow right button to bring focus to the right list.
  final FocusScopeNode? rightFSN;

  final double horizontalPadding;
  final double verticalPadding;
  final double scrollPadding;

  /// Use infinite scrolling.
  final bool useFetchMore;

  /// A function for infinit scrolling.
  final Future<void> Function()? fetchMore;

  /// Display this text when the list is empty.
  final String emptyText;

  /// Display this text when the list has error.
  final String errorText;

  /// When data is null or empty, use this fallback widget to avoid
  /// focus hangs.
  final bool useExceptionFallbackWidget;

  /// Give auto-focus to the exception widget.
  final bool exceptionWidgetAutofocus;
  final VoidCallback? fallbackAction;

  /// ItemBuilder that has own [FocusNode].
  final Widget Function(int index, FocusNode focusNode, T object) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    if (useFetchMore && fetchMore != null) {
      useInfiniteScroll(
        scrollController: scrollController,
        fetchMore: fetchMore,
      );
    }

    return SizedBox(
      width: scrollDirection == Axis.horizontal ? null : itemWidth,
      height: scrollDirection == Axis.vertical ? null : itemHeight,
      child: asyncValue.when(
        data: (data) {
          if (data == null) {
            return _defaultFallback(errorText);
          }

          if (data.isEmpty) {
            return _defaultFallback(emptyText);
          }

          final focusNodes = useFocusNodes(data.length);

          if (scrollDirection == Axis.horizontal) {
            useHorizontalFocusedAutoScroll(
              scrollController: scrollController,
              nodes: focusNodes,
              itemWidth: itemWidth,
              horizontalPadding: horizontalPadding,
              scrollPadding: scrollPadding,
            );
          }

          return DpadListView<T>(
            scrollController: scrollController,
            scrollDirection: scrollDirection,
            focusNodes: focusNodes,
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
            itemList: data,
            sidebarFSN: sidebarFSN,
            aboveFSN: aboveFSN,
            belowFSN: belowFSN,
            leftFSN: leftFSN,
            rightFSN: rightFSN,
            listViewFSN: listViewFSN,
            itemBuilder: itemBuilder,
          );
        },
        error: (error, stackTrace) => useExceptionFallbackWidget
            ? _defaultFallback(errorText)
            : AsyncValueErrorWidget(
                error: error,
                stackTrace: stackTrace,
                fallbackMessage: errorText,
                onRetry: fallbackAction,
              ),
        loading: () => const SizedBox.shrink(),
      ),
    );
  }

  /// Default fallback pattern.
  Widget _defaultFallback(
    String exceptionText, {
    bool autofocus = false,
  }) {
    return useExceptionFallbackWidget
        ? _exceptionFallbackWidget(
            exceptionText,
            autofocus: autofocus,
          )
        : CenteredText(text: exceptionText);
  }

  /// When data is null or empty, use this fallback widget to avoid
  /// focus hangs.
  Widget _exceptionFallbackWidget(
    String exceptionText, {
    bool autofocus = false,
  }) {
    return DpadFocusScopeNavigator(
      node: listViewFSN,
      dpadKeyNodeMap: _dpadKeyNodeMap,
      child: Center(
        child: SizedBox(
          width: Dimensions.defaultExceptionFallbackWidth,
          height: Dimensions.defaultExceptionFallbackHeight,
          child: FocusedOutlinedButton(
            autofocus: autofocus,
            onPressed: fallbackAction,
            child: CenteredText(text: exceptionText),
          ),
        ),
      ),
    );
  }

  DpadKeyNodeMap get _dpadKeyNodeMap => {
        DpadAction.arrowUp: aboveFSN,
        DpadAction.arrowDown: belowFSN,
        DpadAction.arrowLeft: leftFSN,
        DpadAction.arrowRight: rightFSN,
      };
}
