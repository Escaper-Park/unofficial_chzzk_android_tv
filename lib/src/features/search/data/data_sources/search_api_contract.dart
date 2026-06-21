abstract final class SearchApiPaths {
  static const channelAutoComplete =
      '/service/v1/search/channels/auto-complete';
  static const categoryAutoComplete =
      '/nng_main/v2/search/lounges/auto-complete';
  static const tagAutoComplete = '/service/v1/search/tags/auto-complete';
}

abstract final class SearchApiQueryKeys {
  static const keyword = 'keyword';
  static const offset = 'offset';
  static const size = 'size';
  static const limit = 'limit';
}

abstract final class SearchApiDefaults {
  static const offset = 0;
  static const channelAutoCompleteSize = 10;
  static const categoryAutoCompleteLimit = 10;
  static const tagAutoCompleteSize = 50;
}
