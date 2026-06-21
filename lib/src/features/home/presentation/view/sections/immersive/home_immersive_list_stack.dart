part of 'home_immersive_list.dart';

class _HomeImmersiveListStack extends StatelessWidget {
  const _HomeImmersiveListStack({
    required this.item,
    required this.itemIndex,
    required this.itemCount,
    required this.metadataTransitionDirection,
    required this.onActionPressed,
    required this.actionAutofocus,
    required this.actionFocusNode,
    required this.actionProgress,
    required this.previewPlaying,
    required this.showBackground,
  });

  final HomeImmersiveItem item;
  final int itemIndex;
  final int itemCount;
  final int metadataTransitionDirection;
  final VoidCallback onActionPressed;
  final bool actionAutofocus;
  final FocusNode? actionFocusNode;
  final double? actionProgress;
  final bool previewPlaying;
  final bool showBackground;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HomeImmersiveListDesign.layoutHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (showBackground)
            _HomeImmersiveBackgroundPosition(
              item: item,
              previewPlaying: previewPlaying,
            ),
          _HomeImmersiveContentPosition(
            item: item,
            itemIndex: itemIndex,
            metadataTransitionDirection: metadataTransitionDirection,
            onActionPressed: onActionPressed,
            actionAutofocus: actionAutofocus,
            actionFocusNode: actionFocusNode,
            actionProgress: actionProgress,
          ),
          _HomeImmersivePaginationPosition(
            itemCount: itemCount,
            itemIndex: itemIndex,
          ),
        ],
      ),
    );
  }
}

class _HomeImmersiveBackgroundPosition extends StatelessWidget {
  const _HomeImmersiveBackgroundPosition({
    required this.item,
    required this.previewPlaying,
  });

  final HomeImmersiveItem item;
  final bool previewPlaying;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -HomeImmersiveListDesign.shellOverlap,
      right: 0,
      width: HomeImmersiveListDesign.thumbnailSize.width,
      height: HomeImmersiveListDesign.thumbnailSize.height,
      child: HomeImmersiveListBackground(
        thumbnail: item.thumbnail,
        showScrim: !previewPlaying,
      ),
    );
  }
}

class _HomeImmersiveContentPosition extends StatelessWidget {
  const _HomeImmersiveContentPosition({
    required this.item,
    required this.itemIndex,
    required this.metadataTransitionDirection,
    required this.onActionPressed,
    required this.actionAutofocus,
    required this.actionFocusNode,
    required this.actionProgress,
  });

  final HomeImmersiveItem item;
  final int itemIndex;
  final int metadataTransitionDirection;
  final VoidCallback onActionPressed;
  final bool actionAutofocus;
  final FocusNode? actionFocusNode;
  final double? actionProgress;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: HomeImmersiveListDesign.horizontalPadding,
      top: HomeImmersiveListDesign.metadataTopPadding,
      width: HomeImmersiveListDesign.contentBlockSize.width,
      height: HomeImmersiveListDesign.contentBlockSize.height,
      child: _HomeImmersiveContent(
        item: item,
        itemIndex: itemIndex,
        metadataTransitionDirection: metadataTransitionDirection,
        onActionPressed: onActionPressed,
        actionAutofocus: actionAutofocus,
        actionFocusNode: actionFocusNode,
        actionProgress: actionProgress,
      ),
    );
  }
}

class _HomeImmersivePaginationPosition extends StatelessWidget {
  const _HomeImmersivePaginationPosition({
    required this.itemCount,
    required this.itemIndex,
  });

  final int itemCount;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: HomeImmersiveListDesign.paginationLeft,
      top: HomeImmersiveListDesign.paginationTop,
      height: HomeImmersiveListDesign.paginationHeight,
      child: TvPagination(
        count: itemCount,
        activeIndex: itemIndex,
      ),
    );
  }
}
