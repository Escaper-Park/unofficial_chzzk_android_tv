import 'bloc/browse_bloc.dart';

abstract final class BrowseScreenString {
  static const retry = '다시 시도';
  static const sortAction = '정렬';
  static const authRequiredTitle = '로그인이 필요한 항목입니다';
  static const authRequiredMessage = '로그인하면 팔로잉 동영상과 시청 기록을 볼 수 있습니다';
  static const moveToAuth = '로그인';
  static const liveLoading = '라이브를 불러오는 중입니다';
  static const vodLoading = '동영상을 불러오는 중입니다';
  static const liveEmpty = '표시할 라이브가 없습니다';
  static const vodEmpty = '표시할 동영상이 없습니다';
  static const liveError = '라이브를 불러오지 못했습니다';
  static const vodError = '동영상을 불러오지 못했습니다';
  static const noMoreData = '더 이상 불러올 항목이 없습니다';

  static String tabLabel(BrowseTab tab) {
    return switch (tab) {
      BrowseTab.live => '라이브',
      BrowseTab.vod => '동영상',
    };
  }

  static String liveSortLabel(BrowseLiveSortOption option) {
    return switch (option) {
      BrowseLiveSortOption.popular => '인기순',
      BrowseLiveSortOption.latest => '최신순',
    };
  }

  static String vodSortLabel(BrowseVodSortOption option) {
    return switch (option) {
      BrowseVodSortOption.popular => '인기순',
      BrowseVodSortOption.latest => '최신순',
      BrowseVodSortOption.following => '팔로잉',
      BrowseVodSortOption.watchingHistory => '시청 기록',
    };
  }

  static String sortLabel(BrowseState state) {
    return switch (state.selectedTab) {
      BrowseTab.live => liveSortLabel(state.liveSortOption),
      BrowseTab.vod => vodSortLabel(state.vodSortOption),
    };
  }
}
