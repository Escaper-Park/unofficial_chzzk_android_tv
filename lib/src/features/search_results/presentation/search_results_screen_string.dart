abstract final class SearchResultsScreenString {
  static const retry = '다시 시도';
  static const channelRailTitle = '채널';
  static const liveRailTitle = '라이브';
  static const vodRailTitle = '동영상';
  static const loading = '검색 결과를 불러오는 중입니다';
  static const empty = '검색 결과가 없습니다';
  static const error = '검색 결과를 불러오지 못했습니다';
  static const channelEmpty = '표시할 채널이 없습니다';
  static const liveEmpty = '표시할 라이브가 없습니다';
  static const vodEmpty = '표시할 동영상이 없습니다';
  static const fallbackChannelName = '알 수 없는 채널';
  static const followerUnit = '팔로워';

  static String headerTitle(String query) {
    if (query.isEmpty) {
      return '검색 결과';
    }

    return '"$query" 검색 결과';
  }
}
