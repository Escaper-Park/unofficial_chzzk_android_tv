part of 'tv_rail.dart';

class _TvRailFocusableItem extends StatelessWidget {
  const _TvRailFocusableItem({
    required this.index,
    required this.itemCount,
    required this.itemExtent,
    required this.controller,
    required this.hasMore,
    required this.isLoadingMore,
    required this.tailItemThreshold,
    required this.onFocusedTail,
    required this.child,
  });

  final int index;
  final int itemCount;
  final double itemExtent;
  final ScrollController controller;
  final bool hasMore;
  final bool isLoadingMore;
  final int tailItemThreshold;
  final VoidCallback? onFocusedTail;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onFocusChange: (focused) {
        if (!focused) {
          return;
        }

        _scrollToFocusedItem();

        if (!hasMore || isLoadingMore) {
          return;
        }

        if (TvRailDesign.isTailIndex(
          index: index,
          itemCount: itemCount,
          tailItemThreshold: tailItemThreshold,
        )) {
          onFocusedTail?.call();
        }
      },
      child: child,
    );
  }

  void _scrollToFocusedItem() {
    if (!controller.hasClients) {
      return;
    }

    final targetOffset = TvRailDesign.targetOffsetForIndex(
      index: index,
      itemExtent: itemExtent,
      maxScrollExtent: controller.position.maxScrollExtent,
    );
    if (!TvRailDesign.shouldScrollToTarget(
      currentOffset: controller.offset,
      targetOffset: targetOffset,
    )) {
      return;
    }

    controller.jumpTo(targetOffset);
  }
}
