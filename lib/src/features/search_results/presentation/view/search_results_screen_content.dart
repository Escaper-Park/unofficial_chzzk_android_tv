part of 'search_results_screen.dart';

Widget _searchResultsScreenContent({
  required BuildContext context,
  required SearchResultsState state,
  required FocusScopeNode channelRailNode,
  required FocusScopeNode liveRailNode,
  required FocusScopeNode vodRailNode,
  required FocusScopeNode stateNode,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SearchResultsHeader(query: state.query),
      Expanded(
        child: SearchResultsLayout(
          state: state,
          channelRailNode: channelRailNode,
          liveRailNode: liveRailNode,
          vodRailNode: vodRailNode,
          stateNode: stateNode,
          onRetry: () {
            context.read<SearchResultsBloc>().add(
              const SearchResultsEvent.retryRequested(),
            );
          },
          onChannelPressed: (item) => _openChannel(context, item),
          onLivePressed: (item) => _openLive(context, item),
          onVodPressed: (item) => _openVod(context, item),
        ),
      ),
    ],
  );
}

void _openChannel(BuildContext context, SearchChannelResult item) {
  final channel = item.channel;
  if (channel == null) {
    return;
  }

  unawaited(
    context.pushNamed(
      AppRoute.channel.name,
      pathParameters: {'channelId': channel.channelId},
    ),
  );
}

void _openLive(BuildContext context, SearchLiveResult item) {
  if (item.live == null) {
    return;
  }

  unawaited(
    openLivePlayerFromCard(
      context,
      searchResultLiveCardItem(item),
    ),
  );
}

void _openVod(BuildContext context, SearchVideoResult item) {
  final video = item.video;
  if (video == null) {
    return;
  }

  unawaited(
    openVodPlayerFromCard(
      context,
      searchResultVideoCardItem(item),
    ),
  );
}
