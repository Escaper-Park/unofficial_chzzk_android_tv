import 'bloc/search_tag_results_bloc.dart';
import 'search_tag_results_screen_string.dart';

String searchTagResultsLoadingMessage(SearchTagResultsTab tab) {
  return switch (tab) {
    SearchTagResultsTab.live => SearchTagResultsScreenString.liveLoading,
    SearchTagResultsTab.vod => SearchTagResultsScreenString.vodLoading,
  };
}

String searchTagResultsEmptyMessage(SearchTagResultsTab tab) {
  return switch (tab) {
    SearchTagResultsTab.live => SearchTagResultsScreenString.liveEmpty,
    SearchTagResultsTab.vod => SearchTagResultsScreenString.vodEmpty,
  };
}

String searchTagResultsErrorMessage(SearchTagResultsTab tab) {
  return switch (tab) {
    SearchTagResultsTab.live => SearchTagResultsScreenString.liveError,
    SearchTagResultsTab.vod => SearchTagResultsScreenString.vodError,
  };
}

String searchTagResultsFeedbackMessage(SearchTagResultsFeedbackType type) {
  return switch (type) {
    SearchTagResultsFeedbackType.noMoreData =>
      SearchTagResultsScreenString.noMoreData,
  };
}
