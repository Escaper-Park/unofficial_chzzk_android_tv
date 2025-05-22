part of '../../search_result_screen.dart';

class _SearchResultLive extends StatelessWidget {
  const _SearchResultLive({
    required this.asyncLive,
    required this.aboveFSN,
    required this.itemNode,
    required this.belowFSN,
  });

  final AsyncValue<List<LiveInfo>?> asyncLive;
  final FocusScopeNode aboveFSN;
  final FocusScopeNode itemNode;
  final FocusScopeNode belowFSN;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(text: '라이브'),
        DpadListViewWithAsyncValue<LiveInfo>(
          asyncValue: asyncLive,
          useFetchMore: false,
          itemWidth: Dimensions.videoContainerWidth,
          itemHeight: Dimensions.videoContainerHeight,
          aboveFSN: aboveFSN,
          listViewFSN: itemNode,
          belowFSN: belowFSN,
          fallbackAction: () {
            context.pop();
          },
          emptyText: '라이브 검색 결과가 없습니다',
          errorText: '검색 오류',
          itemBuilder: (index, focusNode, object) {
            return LiveContainer(
              appRoute: AppRoute.searchResult,
              autofocus: false,
              focusNode: focusNode,
              channel: object.channel!,
              liveInfo: object,
            );
          },
        ),
      ],
    );
  }
}
