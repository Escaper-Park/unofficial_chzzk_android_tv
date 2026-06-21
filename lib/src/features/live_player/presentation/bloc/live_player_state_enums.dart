part of 'live_player_bloc.dart';

enum LivePlayerViewMode {
  single,
  multiview,
}

enum LivePlayerMultiviewLayoutMode {
  pbp,
  pip,
  focus,
}

enum LivePlayerOverlayMode {
  none,
  controls,
  browse,
}

enum LivePlayerSlotStatus {
  empty,
  loadingSource,
  ready,
  playing,
  ended,
  failure,
}

enum LivePlayerFailureReason {
  missingInitialTarget,
  liveDetailLoadFailed,
  entryBlocked,
  playbackSourceMissing,
  playbackFailed,
}

enum LivePlayerBrowseSection {
  following,
  popular,
  category,
  recent,
  group,
}

enum LivePlayerBrowseLoadStatus {
  initial,
  loading,
  success,
  empty,
  failure,
}

enum LivePlayerBrowseFallbackAction {
  none,
  showPopular,
  closeBrowse,
}

enum LivePlayerFeedbackType {
  followSuccess,
  followFailure,
  unfollowSuccess,
  unfollowFailure,
  groupAddSuccess,
  groupAddAlreadyExists,
  groupAddFailure,
  multiviewLiveAlreadyAdded,
}
