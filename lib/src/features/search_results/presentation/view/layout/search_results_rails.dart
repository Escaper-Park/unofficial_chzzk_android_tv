part of 'search_results_layout.dart';

class _SearchResultsRails extends HookWidget {
  const _SearchResultsRails({
    required this.state,
    required this.channelRailNode,
    required this.liveRailNode,
    required this.vodRailNode,
    required this.onChannelPressed,
    required this.onLivePressed,
    required this.onVodPressed,
  });

  final SearchResultsState state;
  final FocusScopeNode channelRailNode;
  final FocusScopeNode liveRailNode;
  final FocusScopeNode vodRailNode;
  final ValueChanged<SearchChannelResult> onChannelPressed;
  final ValueChanged<SearchLiveResult> onLivePressed;
  final ValueChanged<SearchVideoResult> onVodPressed;

  @override
  Widget build(BuildContext context) {
    final hasChannels = state.channels.isNotEmpty;
    final hasLives = state.lives.isNotEmpty;
    final hasVideos = state.videos.isNotEmpty;
    final scrollController = useScrollController();
    final entries = <_SearchResultsRailEntry>[
      if (hasChannels)
        _SearchResultsRailEntry(
          node: channelRailNode,
          builder: ({required up, required down, required autofocus}) {
            return SearchResultsChannelRail(
              items: state.channels,
              node: channelRailNode,
              down: down,
              autofocusFirstItem: autofocus,
              onPressed: onChannelPressed,
            );
          },
        ),
      if (hasLives)
        _SearchResultsRailEntry(
          node: liveRailNode,
          scrollAlignment:
              SearchResultsScreenDesign.liveVerticalScrollAlignment,
          builder: ({required up, required down, required autofocus}) {
            return SearchResultsLiveRail(
              items: state.lives,
              node: liveRailNode,
              up: up,
              down: down,
              autofocusFirstItem: autofocus,
              onPressed: onLivePressed,
            );
          },
        ),
      if (hasVideos)
        _SearchResultsRailEntry(
          node: vodRailNode,
          builder: ({required up, required down, required autofocus}) {
            return SearchResultsVodRail(
              items: state.videos,
              node: vodRailNode,
              up: up,
              autofocusFirstItem: autofocus,
              onPressed: onVodPressed,
            );
          },
        ),
    ];

    return SingleChildScrollView(
      controller: scrollController,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.only(
          top: SearchResultsScreenDesign.contentTopPadding,
          bottom: SearchResultsScreenDesign.contentBottomPadding,
        ),
        child: Column(
          children: [
            for (var index = 0; index < entries.length; index += 1)
              _SearchResultsRailSpacing(
                addTopGap: index > 0,
                child: _SearchResultsAutoScrollSection(
                  node: entries[index].node,
                  alignment: entries[index].scrollAlignment,
                  child: entries[index].builder(
                    up: index == 0 ? null : entries[index - 1].node,
                    down: index == entries.length - 1
                        ? null
                        : entries[index + 1].node,
                    autofocus: index == 0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SearchResultsRailEntry {
  const _SearchResultsRailEntry({
    required this.node,
    required this.builder,
    this.scrollAlignment = SearchResultsScreenDesign.verticalScrollAlignment,
  });

  final FocusScopeNode node;
  final Widget Function({
    required FocusScopeNode? up,
    required FocusScopeNode? down,
    required bool autofocus,
  })
  builder;
  final double scrollAlignment;
}

class _SearchResultsRailSpacing extends StatelessWidget {
  const _SearchResultsRailSpacing({
    required this.addTopGap,
    required this.child,
  });

  final bool addTopGap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!addTopGap) {
      return child;
    }

    return Padding(
      padding: const EdgeInsets.only(top: SearchResultsScreenDesign.railGap),
      child: child,
    );
  }
}
