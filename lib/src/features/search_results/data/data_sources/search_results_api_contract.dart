abstract final class SearchResultsApiPaths {
  static const channels = '/service/v1/search/channels';
  static const videos = '/service/v1/search/videos';
  static const lives = '/service/v1/search/lives';
}

abstract final class SearchResultsApiQueryKeys {
  static const keyword = 'keyword';
  static const offset = 'offset';
  static const size = 'size';
  static const withFirstChannelContent = 'withFirstChannelContent';
}

abstract final class SearchResultsApiDefaults {
  static const offset = 0;
  static const resultSize = 18;
  static const withFirstChannelContent = false;
}
