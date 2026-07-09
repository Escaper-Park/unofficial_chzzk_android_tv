part of 'home_layout.dart';

Widget _buildHomeImmersiveBackground({
  required HomeState state,
  required int activeIndex,
  required ScrollController scrollController,
  required LivePreviewStateListenable? previewState,
}) {
  if (!state.visibleSections.contains(HomeSectionId.immersive)) {
    return const SizedBox.shrink();
  }

  return AnimatedBuilder(
    animation: scrollController,
    builder: (context, _) {
      final scrollOffset = scrollController.hasClients
          ? scrollController.offset
          : 0.0;
      return _homeImmersiveBackgroundFor(
        state: state,
        activeIndex: activeIndex,
        scrollOffset: scrollOffset,
        previewState: previewState,
      );
    },
  );
}

Widget _homeImmersiveBackgroundFor({
  required HomeState state,
  required int activeIndex,
  required double scrollOffset,
  required LivePreviewStateListenable? previewState,
}) {
  final items = state.immersive.items;
  if (state.immersive.status != HomeSectionLoadStatus.ready || items.isEmpty) {
    return Positioned(
      top: -scrollOffset,
      right: 0,
      width: HomeImmersiveListDesign.thumbnailSize.width,
      height: HomeImmersiveListDesign.thumbnailSize.height,
      child: const IgnorePointer(
        child: _HomeImmersiveBackgroundPlaceholder(),
      ),
    );
  }

  final effectiveIndex = activeIndex >= items.length
      ? items.length - 1
      : activeIndex;

  return Positioned(
    top: -scrollOffset,
    right: 0,
    width: HomeImmersiveListDesign.thumbnailSize.width,
    height: HomeImmersiveListDesign.thumbnailSize.height,
    child: IgnorePointer(
      child: previewState == null
          ? _HomeImmersivePreviewBackground(
              item: items[effectiveIndex],
              previewState: LivePreviewState.inactive(),
            )
          : ValueListenableBuilder<LivePreviewState>(
              valueListenable: previewState,
              builder: (context, state, _) {
                return _HomeImmersivePreviewBackground(
                  item: items[effectiveIndex],
                  previewState: state,
                );
              },
            ),
    ),
  );
}

class _HomeImmersivePreviewBackground extends StatelessWidget {
  const _HomeImmersivePreviewBackground({
    required this.item,
    required this.previewState,
  });

  final Live item;
  final LivePreviewState previewState;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        HomeImmersiveBackground(item: item),
        if (previewState.playbackUri case final playbackUri?)
          LivePreviewPlayer(
            playbackUri: playbackUri,
            videoViewType: previewState.videoViewType,
            muted: previewState.muted,
          ),
      ],
    );
  }
}

class _HomeImmersiveBackgroundPlaceholder extends StatelessWidget {
  const _HomeImmersiveBackgroundPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(color: AppColorTokens.screenBackgroundColor),
        TvScrim(type: TvScrimType.homeImmersive),
      ],
    );
  }
}
