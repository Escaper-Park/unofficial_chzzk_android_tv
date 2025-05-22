part of '../../search_result_screen.dart';

class _SearchResultChannel extends StatelessWidget {
  const _SearchResultChannel({
    required this.asyncChannelList,
    required this.itemNode,
    required this.belowFSN,
    required this.onPressedChannelCard,
  });

  final AsyncValue<List<Channel>?> asyncChannelList;
  final FocusScopeNode itemNode;
  final FocusScopeNode belowFSN;
  final void Function(Channel channel) onPressedChannelCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(text: '채널'),
        DpadListViewWithAsyncValue<Channel>(
          asyncValue: asyncChannelList,
          useFetchMore: false,
          itemWidth: Dimensions.searchResultChannelCardWidth,
          itemHeight: Dimensions.searchResultChannelCardHeight,
          listViewFSN: itemNode,
          belowFSN: belowFSN,
          fallbackAction: () {
            context.pop();
          },
          emptyText: '채널 검색 결과가 없습니다',
          errorText: '검색 오류',
          itemBuilder: (index, focusNode, object) {
            return SearchResultChannelCard(
              autofocus: index == 0,
              focusNode: focusNode,
              channel: object,
              onPressedChannelCard: (channel) => onPressedChannelCard(channel),
            );
          },
        ),
      ],
    );
  }
}
