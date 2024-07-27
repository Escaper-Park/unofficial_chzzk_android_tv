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
      onKeyEvent: (event) {
        if (event is KeyUpEvent) {
          _onKeyEvent(event);
        }

        if (useKeyRepeatEvent && event is KeyRepeatEvent) {
          _onKeyEvent(event);
        }
      },
      child: useFocusedBorder
          ? Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  width: 1.5,
                  color: AppColors.chzzkColor,
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
      case 'Arrow Left': // left
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
    this.fallback,
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

  /// Fallback actions for exception handling
  final VoidCallback? fallback;

  /// ItemBuilder that has own focusNode.
  final Widget Function(int index, FocusNode focusNode, T object) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final isFirstFocused = useState<bool>(true);
    final scrollController = useScrollController();

    return SizedBox(
      height: containerHeight,
      child: asyncValue.when(
        data: (data) {
          if (data == null) {
            return useExceptionFallbackWidget
                ? _exceptionFallbackWidget(errorText, fallback ?? () {})
                : CenteredText(text: errorText);
          }

          if (data.isEmpty) {
            return useExceptionFallbackWidget
                ? _exceptionFallbackWidget(emptyText, fallback ?? () {})
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
                final movePosition =
                    i * (containerWidth + 10.0) - 20.0; // -20.0 padding.

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
              separatorBuilder: (context, index) => const SizedBox(width: 10.0),
            ),
          );
        },
        error: (_, __) => CenteredText(text: errorText),
        loading: () {
          isFirstFocused.value = true;
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _exceptionFallbackWidget(String exceptionText, VoidCallback fallback) {
    final focusNode = useFocusNode();

    return Center(
      child: SizedBox(
        width: Dimensions.exceptionFallbackWidgetSize.width,
        height: Dimensions.exceptionFallbackWidgetSize.height,
        child: CallbackShortcuts(
          bindings: {
            const SingleActivator(LogicalKeyboardKey.arrowUp): () {
              if (aboveFSN != null) aboveFSN!.requestFocus();
            },
            const SingleActivator(LogicalKeyboardKey.arrowDown): () {
              if (belowFSN != null) belowFSN!.requestFocus();
            },
            const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
              if (sidebarFSN != null) sidebarFSN!.requestFocus();
            }
          },
          child: FocusScope(
            node: listFSN,
            onFocusChange: (value) {
              if (value) focusNode.requestFocus();
            },
            child: FocusedOutlinedButton(
              autofocus: true,
              focusNode: focusNode,
              onPressed: fallback,
              child: (hasFocus) => CenteredText(text: emptyText),
            ),
          ),
        ),
      ),
    );
  }
}
