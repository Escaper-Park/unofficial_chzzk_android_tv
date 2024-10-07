import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/common/widgets/focused_widget.dart';

import '../constants/dimensions.dart';
import '../constants/styles.dart';
import './center_widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

typedef ShortcutsBindings = Map<ShortcutActivator, void Function()>;
typedef DpadActionCallbacks = Map<DpadAction, void Function()?>;

enum DpadAction {
  arrowUp,
  arrowDown,
  arrowLeft,
  arrowRight,
  select,
}

class DpadFocusScopeNavigator extends StatelessWidget {
  /// FocusScope navigator widget that request focus to another [FocusScope] when
  /// press the directional key such as ArrowUp, ArrowDown, etc.
  ///
  /// If the child [ListView]'s scroll direction is [Axis.horizontal] you should use
  /// ArrowUp or ArrowDown or both in [dpadKeyFocusScopeNodeMap].
  const DpadFocusScopeNavigator({
    super.key,
    required this.node,
    required this.dpadKeyFocusScopeNodeMap,
    this.autofocus = false,
    this.skipTraversal = true,
    this.onFocusChange,
    required this.child,
  });

  final FocusScopeNode node;

  /// Add a map that constists of [Direction(DpadAction)] and [FocusScopeNode] of FocusScope widget
  /// that you want to move the focus to.
  final Map<DpadAction, FocusScopeNode?> dpadKeyFocusScopeNodeMap;
  final bool autofocus;
  final bool skipTraversal;
  final void Function(bool value)? onFocusChange;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: _createBindings(),
      child: FocusScope(
        node: node,
        autofocus: autofocus,
        skipTraversal: skipTraversal,
        onFocusChange: onFocusChange,
        child: child,
      ),
    );
  }

  ShortcutsBindings _createBindings() {
    ShortcutsBindings bindings = {};

    dpadKeyFocusScopeNodeMap.forEach((DpadAction action, FocusScopeNode? node) {
      if (node != null) {
        // Mapping DpadAction to LogicalKeyboardKey
        LogicalKeyboardKey key = switch (action) {
          DpadAction.arrowUp => LogicalKeyboardKey.arrowUp,
          DpadAction.arrowDown => LogicalKeyboardKey.arrowDown,
          DpadAction.arrowLeft => LogicalKeyboardKey.arrowLeft,
          DpadAction.arrowRight => LogicalKeyboardKey.arrowRight,
          DpadAction.select => LogicalKeyboardKey.select,
        };

        bindings[SingleActivator(key)] = () {
          node.requestFocus();
        };
      }
    });

    return bindings;
  }
}

class DpadActionWidget extends HookWidget {
  /// Do action when a directional key is pressed.
  const DpadActionWidget({
    super.key,
    this.autofocus = false,
    this.focusNode,
    this.useKeyRepeatEvent = false,
    this.useFocusedBorder = true,
    this.borderRadius = 12.0,
    this.customOnKeyEvent,
    required this.dpadActionCallbacks,
    required this.child,
  });

  final bool autofocus;
  final FocusNode? focusNode;

  /// Repeat when the button is long-pressed.
  final bool useKeyRepeatEvent;

  /// Show border when this widget has focus.
  final bool useFocusedBorder;
  final double borderRadius;

  /// Excute this function when the keyRepeatEvent is ends.
  final void Function(KeyEvent event, DpadActionCallbacks dpadActionCallbacks)?
      customOnKeyEvent;

  /// Add a map that constists of [Direction(DpadAction)] and [VoidCallback].
  /// The callback is activated when you press a directional key.
  final DpadActionCallbacks dpadActionCallbacks;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // If focusNode is null, create it's own [FocusNode] using hooks to show focused border.
    final widgetFocusNode = focusNode ?? useFocusNode();
    final focusState = useState<bool>(widgetFocusNode.hasFocus);

    // Add listener to highlight border
    useEffect(() {
      widgetFocusNode.addListener(() {
        if (context.mounted) focusState.value = widgetFocusNode.hasFocus;
      });
      return null;
    }, [widgetFocusNode]);

    return KeyboardListener(
      autofocus: autofocus,
      focusNode: widgetFocusNode,
      onKeyEvent: customOnKeyEvent == null
          ? (KeyEvent event) {
              if (event is KeyDownEvent) {
                _onKeyEvent(event);
              }

              if (useKeyRepeatEvent && event is KeyRepeatEvent) {
                _onKeyEvent(event);
              }
            }
          : // custom event
          (KeyEvent event) {
              customOnKeyEvent!(event, dpadActionCallbacks);
            },
      child: useFocusedBorder
          ? Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  width: 1.5,
                  color: focusState.value
                      ? AppColors.chzzkColor
                      : Colors.transparent,
                ),
              ),
              child: child,
            )
          : child,
    );
  }

  void _onKeyEvent(KeyEvent event) {
    final String keyLabel = event.logicalKey.keyLabel;

    switch (keyLabel) {
      case "Arrow Up": // up
        dpadActionCallbacks[DpadAction.arrowUp]?.call();
        break;
      case "Arrow Down": // down
        dpadActionCallbacks[DpadAction.arrowDown]?.call();
        break;
      case "Arrow Left": // left
        dpadActionCallbacks[DpadAction.arrowLeft]?.call();
        break;
      case "Arrow Right": // right
        dpadActionCallbacks[DpadAction.arrowRight]?.call();
        break;
      case "Select": // select
        dpadActionCallbacks[DpadAction.select]?.call();
        break;
      default:
        break;
    }
  }
}

class DpadHorizontalListViewContainer<T> extends HookWidget {
  /// A horizontal ListView of T with AsyncValue.
  const DpadHorizontalListViewContainer({
    super.key,
    required this.asyncValue,
    this.containerHeight = Dimensions.videoContainerHeight,
    this.containerWidth = Dimensions.videoContainerWidth,
    required this.emptyText,
    required this.errorText,
    required this.listFSN,
    this.sidebarFSN,
    this.aboveFSN,
    this.belowFSN,
    this.useExceptionFallbackWidget = true,
    this.exceptionWidgetAutofocus = true,
    this.fallback,
    this.horizontalPadding = 10.0,
    this.scrollPadding = 20.0,
    this.useFetchMore = false,
    this.fetchMore,
    required this.itemBuilder,
  }) : assert(
          !(useExceptionFallbackWidget && fallback == null),
          'fallback must not be null when useExceptionFallbackWidget is true.',
        );

  /// An async T list.
  final AsyncValue<List<T>?> asyncValue;

  /// Height of ListView.
  final double containerHeight;
  final double containerWidth;

  /// Show this text if List is empty.
  final String emptyText;

  /// Show this text if you get errors when you get data.
  final String errorText;

  /// This list's [FocusScopeNode].
  final FocusScopeNode listFSN;

  /// Press ArrowLeft moves focus to sidebar if screen has a sidebar and item index is 0.
  final FocusScopeNode? sidebarFSN;

  final FocusScopeNode? aboveFSN;
  final FocusScopeNode? belowFSN;

  /// If data is null or empty, use this fallback widget at the home screen
  /// to avoid focus stucks.
  final bool useExceptionFallbackWidget;

  final bool exceptionWidgetAutofocus;

  /// Fallback actions for exception handling
  final VoidCallback? fallback;

  /// Horizontal seperate padding
  final double horizontalPadding;

  /// Scroll Padding to show a former item.
  final double scrollPadding;

  /// Set this true if you want infinite scrolling,
  final bool useFetchMore;

  /// A fetchMore function.
  final Future<void> Function()? fetchMore;

  /// ItemBuilder that has own focusNode.
  final Widget Function(int index, FocusNode focusNode, T object) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final isFirstFocused = useState<bool>(true);
    final scrollController = useScrollController();
    final isFetching = useState<bool>(false);

    if (useFetchMore && fetchMore != null) {
      useEffect(() {
        scrollController.addListener(() async {
          // -scrollPadding : damping
          if (scrollController.offset >=
                  scrollController.position.maxScrollExtent - scrollPadding &&
              !scrollController.position.outOfRange &&
              isFetching.value == false) {
            isFetching.value = true;
            await fetchMore!();
            isFetching.value = false;
          }
        });
        return null;
      }, [scrollController]);
    }

    return SizedBox(
      height: containerHeight,
      child: asyncValue.when(
        data: (data) {
          if (data == null) {
            return useExceptionFallbackWidget
                ? _exceptionFallbackWidget(
                    errorText, fallback ?? () {}, exceptionWidgetAutofocus)
                : CenteredText(text: errorText);
          }

          if (data.isEmpty) {
            return useExceptionFallbackWidget
                ? _exceptionFallbackWidget(
                    emptyText, fallback ?? () {}, exceptionWidgetAutofocus)
                : CenteredText(text: emptyText);
          }

          // Generate focus nodes to check the first index item to move focus to sidebar.
          final focusNodes = List.generate(
            data.length,
            (index) => useFocusNode(),
          );

          for (var i = 1; i < focusNodes.length - 1; i++) {
            final focusNode = focusNodes[i];
            focusNode.addListener(() {
              if (focusNode.hasPrimaryFocus) {
                final movePosition = i * (containerWidth + horizontalPadding) -
                    scrollPadding; // damping.

                final maxScrollExtent =
                    scrollController.position.maxScrollExtent;

                final targetPosition = movePosition > maxScrollExtent
                    ? maxScrollExtent
                    : movePosition;

                scrollController.animateTo(
                  targetPosition,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              }
            });
          }

          return DpadFocusScopeNavigator(
            node: listFSN,
            dpadKeyFocusScopeNodeMap: {
              DpadAction.arrowUp: aboveFSN,
              DpadAction.arrowDown: belowFSN,
            },
            onFocusChange: (value) {
              // To highlight for the first time.
              if (value && isFirstFocused.value) {
                focusNodes[0].requestFocus();
                isFirstFocused.value = false;
              }
            },
            child: ListView.separated(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final object = data[index];

                return index == 0 && sidebarFSN != null
                    ? CallbackShortcuts(
                        bindings: {
                          const SingleActivator(LogicalKeyboardKey.arrowLeft):
                              () {
                            sidebarFSN?.requestFocus();
                          }
                        },
                        child: itemBuilder(index, focusNodes[0], object),
                      )
                    : itemBuilder(index, focusNodes[index], object);
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: horizontalPadding),
            ),
          );
        },
        error: (_, __) => useExceptionFallbackWidget
            ? _exceptionFallbackWidget(
                errorText,
                () {},
                exceptionWidgetAutofocus,
              )
            : CenteredText(text: errorText),
        loading: () {
          isFirstFocused.value = true;
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _exceptionFallbackWidget(
      String exceptionText, VoidCallback fallback, bool autofocus) {
    final focusNode = useFocusNode();

    return DpadFocusScopeNavigator(
      node: listFSN,
      dpadKeyFocusScopeNodeMap: {
        DpadAction.arrowUp: aboveFSN,
        DpadAction.arrowDown: belowFSN,
      },
      child: Center(
        child: SizedBox(
          width: Dimensions.exceptionFallbackWidgetSize.width,
          height: Dimensions.exceptionFallbackWidgetSize.height,
          child: FocusedOutlinedButton(
            autofocus: autofocus,
            focusNode: focusNode,
            onPressed: fallback,
            child: (hasFocus) => CenteredText(text: exceptionText),
          ),
        ),
      ),
    );
  }
}
