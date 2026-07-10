part of 'tv_player_browse_overlay.dart';

class _TvPlayerBrowseBand extends StatelessWidget {
  const _TvPlayerBrowseBand({
    required this.node,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
    required this.cardWidth,
    required this.hasMore,
    required this.isLoadingMore,
    required this.tailItemThreshold,
    this.up,
    this.down,
    this.controller,
    this.placeholder,
    this.placeholderFocusNode,
    this.onFocusedTail,
  });

  final FocusScopeNode node;
  final String title;
  final int itemCount;
  final TvPlayerBrowseItemBuilder itemBuilder;
  final TvCardWidth cardWidth;
  final FocusScopeNode? up;
  final FocusScopeNode? down;
  final ScrollController? controller;
  final Widget? placeholder;
  final FocusNode? placeholderFocusNode;
  final VoidCallback? onFocusedTail;
  final bool hasMore;
  final bool isLoadingMore;
  final int tailItemThreshold;

  @override
  Widget build(BuildContext context) {
    final headerHeight = TvPlayerBrowseOverlayDesign.headerHeight(cardWidth);
    final cardHeight = TvPlayerBrowseOverlayDesign.cardHeight(cardWidth);

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        height: TvPlayerBrowseOverlayDesign.bandHeight(cardWidth),
        child: ColoredBox(
          color: TvPlayerBrowseOverlayDesign.backgroundColor,
          child: Padding(
            padding: EdgeInsets.only(
              top: TvPlayerBrowseOverlayDesign.topMargin(cardWidth),
              bottom: TvPlayerBrowseOverlayDesign.bottomMargin(cardWidth),
            ),
            child: SizedBox(
              height: TvPlayerBrowseOverlayDesign.containerHeight(cardWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _TvPlayerBrowseHeader(
                    title: title,
                    height: headerHeight,
                    cardWidth: cardWidth,
                  ),
                  const SizedBox(
                    height: TvPlayerBrowseOverlayDesign.headerCardGap,
                  ),
                  SizedBox(
                    height: cardHeight,
                    child: itemCount == 0
                        ? _TvPlayerBrowsePlaceholder(
                            node: node,
                            up: up,
                            down: down,
                            focusNode: placeholderFocusNode,
                            child:
                                placeholder ??
                                const TvPlayerBrowseMessage(
                                  label: TvPlayerBrowseString.emptyPlaceholder,
                                ),
                          )
                        : TvRail(
                            node: node,
                            up: up,
                            down: down,
                            controller: controller,
                            clipBehavior: Clip.hardEdge,
                            cacheExtent: 0,
                            addAutomaticKeepAlives: false,
                            itemCount: itemCount,
                            itemExtent: cardWidth.value,
                            onFocusedTail: onFocusedTail,
                            hasMore: hasMore,
                            isLoadingMore: isLoadingMore,
                            tailItemThreshold: tailItemThreshold,
                            itemBuilder: itemBuilder,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
