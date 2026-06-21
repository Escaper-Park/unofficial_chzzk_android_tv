import 'search_results_screen_string.dart';

String searchResultsLoadingMessage() {
  return SearchResultsScreenString.loading;
}

String searchResultsErrorMessage() {
  return SearchResultsScreenString.error;
}

String searchResultsEmptyMessage() {
  return SearchResultsScreenString.empty;
}

String searchResultsRailEmptyMessage(SearchResultsRail rail) {
  return switch (rail) {
    SearchResultsRail.channel => SearchResultsScreenString.channelEmpty,
    SearchResultsRail.live => SearchResultsScreenString.liveEmpty,
    SearchResultsRail.vod => SearchResultsScreenString.vodEmpty,
  };
}

enum SearchResultsRail {
  channel,
  live,
  vod,
}
