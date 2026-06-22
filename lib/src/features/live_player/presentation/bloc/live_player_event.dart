part of 'live_player_bloc.dart';

@freezed
sealed class LivePlayerEvent with _$LivePlayerEvent {
  const factory LivePlayerEvent.started({
    LivePlayerInitialTarget? initialTarget,
  }) = _Started;

  const factory LivePlayerEvent.retryRequested() = _RetryRequested;

  const factory LivePlayerEvent.jumpToRealtimeRequested() =
      _JumpToRealtimeRequested;

  const factory LivePlayerEvent.controlsRequested() = _ControlsRequested;

  const factory LivePlayerEvent.controlsClosed() = _ControlsClosed;

  const factory LivePlayerEvent.browseRequested({
    required bool isSignedIn,
  }) = _BrowseRequested;

  const factory LivePlayerEvent.browseClosed() = _BrowseClosed;

  const factory LivePlayerEvent.browseNextSectionRequested() =
      _BrowseNextSectionRequested;

  const factory LivePlayerEvent.browsePreviousSectionRequested() =
      _BrowsePreviousSectionRequested;

  const factory LivePlayerEvent.browseFallbackPressed() =
      _BrowseFallbackPressed;

  const factory LivePlayerEvent.browseLoadMoreRequested() =
      _BrowseLoadMoreRequested;

  const factory LivePlayerEvent.browseLiveSelected({
    required Live live,
  }) = _BrowseLiveSelected;

  const factory LivePlayerEvent.browseReplacementClosed() =
      _BrowseReplacementClosed;

  const factory LivePlayerEvent.browseReplacementSlotSelected({
    required String slotId,
  }) = _BrowseReplacementSlotSelected;

  const factory LivePlayerEvent.preferencesChanged({
    required SettingsPreferences preferences,
  }) = _PreferencesChanged;

  const factory LivePlayerEvent.viewModeSelected({
    required LivePlayerViewMode viewMode,
  }) = _ViewModeSelected;

  const factory LivePlayerEvent.multiviewLayoutModeSelected({
    required LivePlayerMultiviewLayoutMode layoutMode,
  }) = _MultiviewLayoutModeSelected;

  const factory LivePlayerEvent.activeSlotShiftRequested({
    required int delta,
  }) = _ActiveSlotShiftRequested;

  const factory LivePlayerEvent.activeSlotSelected({
    required String slotId,
  }) = _ActiveSlotSelected;

  const factory LivePlayerEvent.slotAudioToggled({
    required String slotId,
  }) = _SlotAudioToggled;

  const factory LivePlayerEvent.slotResolutionSelected({
    required String slotId,
    required int resolutionIndex,
  }) = _SlotResolutionSelected;

  const factory LivePlayerEvent.slotCloseConfirmed({
    required String slotId,
  }) = _SlotCloseConfirmed;

  const factory LivePlayerEvent.liveStatusRefreshRequested({
    required String slotId,
    required String channelId,
  }) = _LiveStatusRefreshRequested;

  const factory LivePlayerEvent.followingToggled() = _FollowingToggled;

  const factory LivePlayerEvent.groupAddRequested({
    required String groupId,
  }) = _GroupAddRequested;

  const factory LivePlayerEvent.groupActivated({
    required String groupId,
  }) = _GroupActivated;

  const factory LivePlayerEvent.feedbackCleared({
    required int serial,
  }) = _FeedbackCleared;

  const factory LivePlayerEvent.playbackReady({
    required String slotId,
    required Uri playbackUri,
  }) = _PlaybackReady;

  const factory LivePlayerEvent.playbackEnded({
    required String slotId,
    required Uri playbackUri,
  }) = _PlaybackEnded;

  const factory LivePlayerEvent.playbackFailed({
    required String slotId,
    required Uri playbackUri,
  }) = _PlaybackFailed;
}
