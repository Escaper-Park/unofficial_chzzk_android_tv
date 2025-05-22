part of '../../search_result_screen.dart';

class _SearchResultVod extends StatelessWidget {
  const _SearchResultVod({
    required this.asyncVod,
    required this.aboveFSN,
    required this.itemNode,
  });

  final AsyncValue<List<Vod>?> asyncVod;
  final FocusScopeNode aboveFSN;
  final FocusScopeNode itemNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(text: '다시보기'),
        DpadListViewWithAsyncValue<Vod>(
          asyncValue: asyncVod,
          useFetchMore: false,
          itemWidth: Dimensions.videoContainerWidth,
          itemHeight: Dimensions.videoContainerHeight,
          aboveFSN: aboveFSN,
          listViewFSN: itemNode,
          fallbackAction: () {
            context.pop();
          },
          emptyText: '라이브 검색 결과가 없습니다',
          errorText: '검색 오류',
          itemBuilder: (index, focusNode, object) {
            return VodContainer(
              appRoute: AppRoute.searchResult,
              autofocus: false,
              focusNode: focusNode,
              vod: object,
            );
          },
        ),
      ],
    );
  }
}
