import 'bloc/browse_bloc.dart';
import 'browse_screen_string.dart';

String browseLoadingMessage(BrowseTab tab) {
  return switch (tab) {
    BrowseTab.live => BrowseScreenString.liveLoading,
    BrowseTab.vod => BrowseScreenString.vodLoading,
  };
}

String browseEmptyMessage(BrowseTab tab) {
  return switch (tab) {
    BrowseTab.live => BrowseScreenString.liveEmpty,
    BrowseTab.vod => BrowseScreenString.vodEmpty,
  };
}

String browseErrorMessage(BrowseTab tab) {
  return switch (tab) {
    BrowseTab.live => BrowseScreenString.liveError,
    BrowseTab.vod => BrowseScreenString.vodError,
  };
}

String browseFeedbackMessage(BrowseFeedbackType type) {
  return switch (type) {
    BrowseFeedbackType.noMoreData => BrowseScreenString.noMoreData,
  };
}
