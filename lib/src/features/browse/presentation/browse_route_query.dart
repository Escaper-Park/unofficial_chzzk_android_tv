import 'bloc/browse_bloc.dart';

abstract final class BrowseRouteQuery {
  static const tabKey = 'tab';
  static const liveSortKey = 'liveSort';
  static const vodSortKey = 'vodSort';

  static Map<String, String> popularLive() {
    return {
      tabKey: BrowseTab.live.name,
      liveSortKey: BrowseLiveSortOption.popular.name,
    };
  }

  static Map<String, String> popularVod() {
    return {
      tabKey: BrowseTab.vod.name,
      vodSortKey: BrowseVodSortOption.popular.name,
    };
  }

  static Map<String, String> watchingHistory() {
    return {
      tabKey: BrowseTab.vod.name,
      vodSortKey: BrowseVodSortOption.watchingHistory.name,
    };
  }

  static BrowseTab tabFrom(Map<String, String> queryParameters) {
    return _enumValueByName(
      BrowseTab.values,
      queryParameters[tabKey],
      BrowseTab.live,
    );
  }

  static BrowseLiveSortOption liveSortFrom(
    Map<String, String> queryParameters,
  ) {
    return _enumValueByName(
      BrowseLiveSortOption.values,
      queryParameters[liveSortKey],
      BrowseLiveSortOption.popular,
    );
  }

  static BrowseVodSortOption vodSortFrom(Map<String, String> queryParameters) {
    return _enumValueByName(
      BrowseVodSortOption.values,
      queryParameters[vodSortKey],
      BrowseVodSortOption.popular,
    );
  }
}

T _enumValueByName<T extends Enum>(
  List<T> values,
  String? name,
  T fallback,
) {
  for (final value in values) {
    if (value.name == name) {
      return value;
    }
  }

  return fallback;
}
