import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/dimensions.dart';
import './center_widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

typedef ShortcutsBindings = Map<ShortcutActivator, void Function()>;
typedef DpadActionCallbacks = Map<DpadAction, void Function()?>;

enum DpadAction {
  arrowUp,
  arrowDown,
  arrowLeft,
  arrowRight,
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
        };

        bindings[SingleActivator(key)] = () {
          node.requestFocus();
        };
      }
    });

    return bindings;
  }
}

class DpadWidget extends HookWidget {
  /// Do action when you press directional keys.
  const DpadWidget({
    super.key,
    this.autofocus = false,
    this.focusNode,
    this.useKeyRepeatEvent = false,
    required this.dpadActionCallbacks,
    required this.child,
  });

  final bool autofocus;
  final FocusNode? focusNode;

  /// Repeat when the button is long-pressed.
  final bool useKeyRepeatEvent;

  /// Add a map that constists of [Direction(DpadAction)] and [VoidCallback].
  /// The callback is activated when you press a directional key.
  final DpadActionCallbacks dpadActionCallbacks;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // If focusNode is null, create it's own [FocusNode] using hooks to show focused border.
    final widgetFocusNode = focusNode ?? useFocusNode();

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
      child: child,
    );
  }

  void _onKeyEvent(KeyEvent event) {
    final String keyLabel = event.logicalKey.keyLabel;

    switch (keyLabel) {
      case "Arrow Up": // up
        dpadActionCallbacks[DpadAction.arrowUp]?.call();
      case "Arrow Down": // down
        dpadActionCallbacks[DpadAction.arrowDown]?.call();
      case 'Arrow Left': // left
        dpadActionCallbacks[DpadAction.arrowLeft]?.call();
      case "Arrow Right": // right
        dpadActionCallbacks[DpadAction.arrowRight]?.call();
      default:
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
    required this.itemBuilder,
  });

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
          if (data == null) return CenteredText(text: errorText);

          if (data.isEmpty) return CenteredText(text: emptyText);

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
        loading: () => const SizedBox.shrink(),
      ),
    );
  }
}