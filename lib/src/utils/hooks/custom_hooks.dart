import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Infinite scrolling
void useInfiniteScroll({
  required ScrollController scrollController,
  required Future<void> Function()? fetchMore,

  /// damping
  double scrollPadding = 10.0,
}) {
  final isFetching = useState<bool>(false);

  useEffect(
    () {
      FutureOr<void> listener() async {
        final offset = scrollController.offset;
        final outOfRange = scrollController.position.outOfRange;

        if (!isFetching.value &&
            !outOfRange &&
            offset >=
                scrollController.position.maxScrollExtent - scrollPadding) {
          isFetching.value = true;
          await fetchMore?.call();
          isFetching.value = false;
        }
      }

      // mount
      scrollController.addListener(listener);
      // unmount
      return () => scrollController.removeListener(listener);
    },
    [scrollController, fetchMore, scrollPadding],
  );
}

/// Vertical auto scroll to focused item.
void useVerticalFocusedAutoScroll({
  required ScrollController scrollController,
  required List<FocusNode> focusNodes,

  /// List of base scroll position.
  required List<double> Function(double maxScrollExtent) offsetBuilder,
}) {
  useEffect(
    () {
      final disposers = <VoidCallback>[];
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!scrollController.hasClients) return;

        final maxExtent = scrollController.position.maxScrollExtent;
        final positions = offsetBuilder(maxExtent);

        for (var i = 0; i < focusNodes.length; i++) {
          final node = focusNodes[i];
          void listener() {
            if (node.hasFocus && i < positions.length) {
              scrollController.animateTo(
                positions[i],
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            }
          }

          node.addListener(listener);
          disposers.add(() => node.removeListener(listener));
        }
      });
      return () {
        for (final remove in disposers) {
          remove();
        }
      };
    },
    [scrollController, focusNodes.length, offsetBuilder],
  );
}

void useVerticalGridViewAutoScroll({
  required ScrollController scrollController,
  required List<FocusNode> focusNodes,
  required int crossAxisCount,
  required double itemHeight,
  required double mainAxisSpacing,
}) {
  useEffect(
    () {
      final disposers = <VoidCallback>[];
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!scrollController.hasClients) return;

        final viewportHeight = scrollController.position.viewportDimension;
        final offsetToCenter = viewportHeight / 2 - itemHeight / 2;

        for (var i = 0; i < focusNodes.length; i++) {
          final node = focusNodes[i];

          void listener() {
            if (node.hasFocus) {
              final rowIndex = i ~/ crossAxisCount;

              final pos =
                  rowIndex * (itemHeight + mainAxisSpacing) - offsetToCenter;
              final maxExtent = scrollController.position.maxScrollExtent;

              scrollController.animateTo(
                pos.clamp(0.0, maxExtent),
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            }
          }

          node.addListener(listener);
          disposers.add(() => node.removeListener(listener));
        }
      });
      return () {
        for (final remove in disposers) {
          remove();
        }
      };
    },
    [
      scrollController,
      focusNodes.length,
      crossAxisCount,
      itemHeight,
      mainAxisSpacing,
    ],
  );
}

/// Generate a list of FocusNodes with the dynamically changed itemCount.
List<FocusNode> useFocusNodes(int itemCount) {
  final nodesRef = useRef<List<FocusNode>>([]);

  final nodesRefLength = nodesRef.value.length;

  if (nodesRefLength < itemCount) {
    final extraNodes = List<FocusNode>.generate(
      itemCount - nodesRefLength,
      (_) => FocusNode(),
    );
    nodesRef.value = [...nodesRef.value, ...extraNodes];
  }

  useEffect(
    () {
      return () {
        for (final node in nodesRef.value) {
          node.dispose();
        }
      };
    },
    [],
  );

  return nodesRef.value;
}

List<FocusScopeNode> useFocusScopeNodes(int itemCount) {
  return List.generate(
    itemCount,
    (index) => useFocusScopeNode(debugLabel: 'node $index'),
  );
}

/// Automatically moves the scroll position when an item in a
/// horizontal ListView gets focus.
void useHorizontalFocusedAutoScroll({
  required ScrollController scrollController,
  required List<FocusNode> nodes,
  required double itemWidth,
  required double horizontalPadding,
  required double scrollPadding,
}) {
  useEffect(
    () {
      final disposers = <VoidCallback>[];

      for (int i = 1; i < nodes.length - 1; i++) {
        final node = nodes[i];

        void listener() {
          if (node.hasPrimaryFocus) {
            final movePos = i * (itemWidth + horizontalPadding) - scrollPadding;
            final maxScrollExtent = scrollController.position.maxScrollExtent;
            final target = min(movePos, maxScrollExtent);

            scrollController.animateTo(
              target,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          }
        }

        node.addListener(listener);
        disposers.add(
          () => node.removeListener(listener),
        );
      }

      return () {
        for (final remove in disposers) {
          remove();
        }
      };
    },
    [
      nodes.length,
      scrollController,
      itemWidth,
      horizontalPadding,
      scrollPadding,
    ],
  );
}
