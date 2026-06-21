import 'bloc/search_tag_results_bloc.dart';

abstract final class SearchTagResultsScreenString {
  static const retry = '다시 시도';
  static const sortAction = '정렬';
  static const liveLoading = '라이브를 불러오는 중입니다';
  static const vodLoading = '동영상을 불러오는 중입니다';
  static const liveEmpty = '표시할 라이브가 없습니다';
  static const vodEmpty = '표시할 동영상이 없습니다';
  static const liveError = '라이브를 불러오지 못했습니다';
  static const vodError = '동영상을 불러오지 못했습니다';
  static const noMoreData = '더 이상 불러올 항목이 없습니다';

  static String headerTitle(String tag) {
    if (tag.isEmpty) {
      return '# 검색 결과';
    }

    return '#$tag 검색 결과';
  }

  static String tabLabel(SearchTagResultsTab tab) {
    return switch (tab) {
      SearchTagResultsTab.live => '라이브',
      SearchTagResultsTab.vod => '동영상',
    };
  }

  static String liveSortLabel(SearchTagResultsLiveSortOption option) {
    return switch (option) {
      SearchTagResultsLiveSortOption.popular => '인기순',
      SearchTagResultsLiveSortOption.latest => '최신순',
    };
  }

  static String vodSortLabel(SearchTagResultsVodSortOption option) {
    return switch (option) {
      SearchTagResultsVodSortOption.popular => '인기순',
      SearchTagResultsVodSortOption.latest => '최신순',
    };
  }

  static String sortLabel(SearchTagResultsState state) {
    return switch (state.selectedTab) {
      SearchTagResultsTab.live => liveSortLabel(state.liveSortOption),
      SearchTagResultsTab.vod => vodSortLabel(state.vodSortOption),
    };
  }
}
