abstract final class SearchTagResultsApiPaths {
  static const lives = '/service/v1/tag/lives';
  static const videos = '/service/v1/tag/videos';
}

abstract final class SearchTagResultsApiQueryKeys {
  static const size = 'size';
  static const sortType = 'sortType';
  static const tags = 'tags';
  static const tag = 'tag';
  static const concurrentUserCount = 'concurrentUserCount';
  static const liveId = 'liveId';
  static const start = 'start';
}

abstract final class SearchTagResultsApiDefaults {
  static const pageSize = 18;
  static const sortTypePopular = 'POPULAR';
  static const sortTypeLatest = 'LATEST';
}
