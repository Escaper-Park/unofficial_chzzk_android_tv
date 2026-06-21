import 'bloc/search_bloc.dart';

abstract final class SearchScreenString {
  static const channelRailTitle = '채널';
  static const categoryRailTitle = '카테고리';
  static const tagRailTitle = '태그';
  static const suggestionError = '자동완성을 불러오지 못했습니다';
  static const retry = '다시 시도';

  static String tabLabel(SearchTab tab) {
    return switch (tab) {
      SearchTab.channelCategory => '채널 \u2022 카테고리',
      SearchTab.tag => '태그',
    };
  }

  static String inputHint(SearchTab tab) {
    return switch (tab) {
      SearchTab.channelCategory => '채널, 라이브, 동영상 검색',
      SearchTab.tag => '태그 검색',
    };
  }
}
