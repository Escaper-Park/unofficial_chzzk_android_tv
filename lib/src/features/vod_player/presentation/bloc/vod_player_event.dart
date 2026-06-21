part of 'vod_player_bloc.dart';

@freezed
sealed class VodPlayerEvent with _$VodPlayerEvent {
  const factory VodPlayerEvent.started({
    VodPlayerInitialTarget? initialTarget,
  }) = _Started;

  const factory VodPlayerEvent.targetSelected({
    required VodPlayerInitialTarget target,
  }) = _TargetSelected;

  const factory VodPlayerEvent.retryRequested() = _RetryRequested;

  const factory VodPlayerEvent.controlsRequested() = _ControlsRequested;

  const factory VodPlayerEvent.controlsClosed() = _ControlsClosed;

  const factory VodPlayerEvent.browseRequested() = _BrowseRequested;

  const factory VodPlayerEvent.browseClosed() = _BrowseClosed;

  const factory VodPlayerEvent.browseFallbackPressed() = _BrowseFallbackPressed;

  const factory VodPlayerEvent.browseLoadMoreRequested() =
      _BrowseLoadMoreRequested;

  const factory VodPlayerEvent.browseVodSelected({
    required VodPlayerInitialTarget target,
  }) = _BrowseVodSelected;

  const factory VodPlayerEvent.preferencesChanged({
    required SettingsPreferences preferences,
  }) = _PreferencesChanged;

  const factory VodPlayerEvent.followingToggled() = _FollowingToggled;

  const factory VodPlayerEvent.groupAddRequested({
    required String groupId,
  }) = _GroupAddRequested;

  const factory VodPlayerEvent.feedbackCleared({
    required int serial,
  }) = _FeedbackCleared;

  const factory VodPlayerEvent.playbackSpeedSelected({
    required double speed,
  }) = _PlaybackSpeedSelected;

  const factory VodPlayerEvent.playbackReady({
    required String slotId,
    required Uri playbackUri,
  }) = _PlaybackReady;

  const factory VodPlayerEvent.playbackFailed({
    required String slotId,
    required Uri playbackUri,
  }) = _PlaybackFailed;

  const factory VodPlayerEvent.playbackPositionChanged({
    required String slotId,
    required Uri playbackUri,
    required Duration position,
    required Duration duration,
  }) = _PlaybackPositionChanged;

  const factory VodPlayerEvent.playbackEnded({
    required String slotId,
    required Uri playbackUri,
    required Duration position,
    required Duration duration,
  }) = _PlaybackEnded;
}
