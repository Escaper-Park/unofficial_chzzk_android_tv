abstract final class HomeScreenString {
  static const more = '더보기';

  static const retry = '다시 시도';
  static const openLive = '시청하기';

  static const immersiveTitle = '추천 라이브';
  static const followingLiveTitle = '팔로잉 라이브';
  static const popularLiveTitle = '인기 라이브';
  static const watchingHistoryTitle = '시청 기록';
  static const popularVodTitle = '인기 동영상';
  static const followingCategoryTitle = '팔로잉 카테고리';
  static const trendingCategoryTitle = '인기 카테고리';

  static const liveBadge = 'LIVE';
  static const liveSectionEmpty = '표시할 라이브가 없습니다';
  static const vodSectionEmpty = '표시할 동영상이 없습니다';
  static const categorySectionEmpty = '표시할 카테고리가 없습니다';
  static const immersiveEmpty = '추천할 라이브가 없습니다';

  static const sectionLoadFailed = '섹션을 불러오지 못했습니다';

  static String watchingCount(String value) {
    return '$value명 시청 중';
  }
}
