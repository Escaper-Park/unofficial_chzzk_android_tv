// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_player_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LivePlayerEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LivePlayerEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivePlayerEvent()';
  }
}

/// @nodoc
class $LivePlayerEventCopyWith<$Res> {
  $LivePlayerEventCopyWith(
    LivePlayerEvent _,
    $Res Function(LivePlayerEvent) __,
  );
}

/// Adds pattern-matching-related methods to [LivePlayerEvent].
extension LivePlayerEventPatterns on LivePlayerEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_JumpToRealtimeRequested value)? jumpToRealtimeRequested,
    TResult Function(_ControlsRequested value)? controlsRequested,
    TResult Function(_ControlsClosed value)? controlsClosed,
    TResult Function(_BrowseRequested value)? browseRequested,
    TResult Function(_BrowseClosed value)? browseClosed,
    TResult Function(_BrowseNextSectionRequested value)?
    browseNextSectionRequested,
    TResult Function(_BrowsePreviousSectionRequested value)?
    browsePreviousSectionRequested,
    TResult Function(_BrowseFallbackPressed value)? browseFallbackPressed,
    TResult Function(_BrowseLoadMoreRequested value)? browseLoadMoreRequested,
    TResult Function(_BrowseLiveSelected value)? browseLiveSelected,
    TResult Function(_BrowseReplacementClosed value)? browseReplacementClosed,
    TResult Function(_BrowseReplacementSlotSelected value)?
    browseReplacementSlotSelected,
    TResult Function(_PreferencesChanged value)? preferencesChanged,
    TResult Function(_ViewModeSelected value)? viewModeSelected,
    TResult Function(_MultiviewLayoutModeSelected value)?
    multiviewLayoutModeSelected,
    TResult Function(_ActiveSlotShiftRequested value)? activeSlotShiftRequested,
    TResult Function(_ActiveSlotSelected value)? activeSlotSelected,
    TResult Function(_SlotAudioToggled value)? slotAudioToggled,
    TResult Function(_SlotVolumeChanged value)? slotVolumeChanged,
    TResult Function(_SlotResolutionSelected value)? slotResolutionSelected,
    TResult Function(_SlotCloseConfirmed value)? slotCloseConfirmed,
    TResult Function(_LiveStatusRefreshRequested value)?
    liveStatusRefreshRequested,
    TResult Function(_FollowingToggled value)? followingToggled,
    TResult Function(_GroupAddRequested value)? groupAddRequested,
    TResult Function(_GroupActivated value)? groupActivated,
    TResult Function(_FeedbackCleared value)? feedbackCleared,
    TResult Function(_PlaybackReady value)? playbackReady,
    TResult Function(_PlaybackEnded value)? playbackEnded,
    TResult Function(_PlaybackFailed value)? playbackFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _JumpToRealtimeRequested() when jumpToRealtimeRequested != null:
        return jumpToRealtimeRequested(_that);
      case _ControlsRequested() when controlsRequested != null:
        return controlsRequested(_that);
      case _ControlsClosed() when controlsClosed != null:
        return controlsClosed(_that);
      case _BrowseRequested() when browseRequested != null:
        return browseRequested(_that);
      case _BrowseClosed() when browseClosed != null:
        return browseClosed(_that);
      case _BrowseNextSectionRequested()
          when browseNextSectionRequested != null:
        return browseNextSectionRequested(_that);
      case _BrowsePreviousSectionRequested()
          when browsePreviousSectionRequested != null:
        return browsePreviousSectionRequested(_that);
      case _BrowseFallbackPressed() when browseFallbackPressed != null:
        return browseFallbackPressed(_that);
      case _BrowseLoadMoreRequested() when browseLoadMoreRequested != null:
        return browseLoadMoreRequested(_that);
      case _BrowseLiveSelected() when browseLiveSelected != null:
        return browseLiveSelected(_that);
      case _BrowseReplacementClosed() when browseReplacementClosed != null:
        return browseReplacementClosed(_that);
      case _BrowseReplacementSlotSelected()
          when browseReplacementSlotSelected != null:
        return browseReplacementSlotSelected(_that);
      case _PreferencesChanged() when preferencesChanged != null:
        return preferencesChanged(_that);
      case _ViewModeSelected() when viewModeSelected != null:
        return viewModeSelected(_that);
      case _MultiviewLayoutModeSelected()
          when multiviewLayoutModeSelected != null:
        return multiviewLayoutModeSelected(_that);
      case _ActiveSlotShiftRequested() when activeSlotShiftRequested != null:
        return activeSlotShiftRequested(_that);
      case _ActiveSlotSelected() when activeSlotSelected != null:
        return activeSlotSelected(_that);
      case _SlotAudioToggled() when slotAudioToggled != null:
        return slotAudioToggled(_that);
      case _SlotVolumeChanged() when slotVolumeChanged != null:
        return slotVolumeChanged(_that);
      case _SlotResolutionSelected() when slotResolutionSelected != null:
        return slotResolutionSelected(_that);
      case _SlotCloseConfirmed() when slotCloseConfirmed != null:
        return slotCloseConfirmed(_that);
      case _LiveStatusRefreshRequested()
          when liveStatusRefreshRequested != null:
        return liveStatusRefreshRequested(_that);
      case _FollowingToggled() when followingToggled != null:
        return followingToggled(_that);
      case _GroupAddRequested() when groupAddRequested != null:
        return groupAddRequested(_that);
      case _GroupActivated() when groupActivated != null:
        return groupActivated(_that);
      case _FeedbackCleared() when feedbackCleared != null:
        return feedbackCleared(_that);
      case _PlaybackReady() when playbackReady != null:
        return playbackReady(_that);
      case _PlaybackEnded() when playbackEnded != null:
        return playbackEnded(_that);
      case _PlaybackFailed() when playbackFailed != null:
        return playbackFailed(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_JumpToRealtimeRequested value)
    jumpToRealtimeRequested,
    required TResult Function(_ControlsRequested value) controlsRequested,
    required TResult Function(_ControlsClosed value) controlsClosed,
    required TResult Function(_BrowseRequested value) browseRequested,
    required TResult Function(_BrowseClosed value) browseClosed,
    required TResult Function(_BrowseNextSectionRequested value)
    browseNextSectionRequested,
    required TResult Function(_BrowsePreviousSectionRequested value)
    browsePreviousSectionRequested,
    required TResult Function(_BrowseFallbackPressed value)
    browseFallbackPressed,
    required TResult Function(_BrowseLoadMoreRequested value)
    browseLoadMoreRequested,
    required TResult Function(_BrowseLiveSelected value) browseLiveSelected,
    required TResult Function(_BrowseReplacementClosed value)
    browseReplacementClosed,
    required TResult Function(_BrowseReplacementSlotSelected value)
    browseReplacementSlotSelected,
    required TResult Function(_PreferencesChanged value) preferencesChanged,
    required TResult Function(_ViewModeSelected value) viewModeSelected,
    required TResult Function(_MultiviewLayoutModeSelected value)
    multiviewLayoutModeSelected,
    required TResult Function(_ActiveSlotShiftRequested value)
    activeSlotShiftRequested,
    required TResult Function(_ActiveSlotSelected value) activeSlotSelected,
    required TResult Function(_SlotAudioToggled value) slotAudioToggled,
    required TResult Function(_SlotVolumeChanged value) slotVolumeChanged,
    required TResult Function(_SlotResolutionSelected value)
    slotResolutionSelected,
    required TResult Function(_SlotCloseConfirmed value) slotCloseConfirmed,
    required TResult Function(_LiveStatusRefreshRequested value)
    liveStatusRefreshRequested,
    required TResult Function(_FollowingToggled value) followingToggled,
    required TResult Function(_GroupAddRequested value) groupAddRequested,
    required TResult Function(_GroupActivated value) groupActivated,
    required TResult Function(_FeedbackCleared value) feedbackCleared,
    required TResult Function(_PlaybackReady value) playbackReady,
    required TResult Function(_PlaybackEnded value) playbackEnded,
    required TResult Function(_PlaybackFailed value) playbackFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _RetryRequested():
        return retryRequested(_that);
      case _JumpToRealtimeRequested():
        return jumpToRealtimeRequested(_that);
      case _ControlsRequested():
        return controlsRequested(_that);
      case _ControlsClosed():
        return controlsClosed(_that);
      case _BrowseRequested():
        return browseRequested(_that);
      case _BrowseClosed():
        return browseClosed(_that);
      case _BrowseNextSectionRequested():
        return browseNextSectionRequested(_that);
      case _BrowsePreviousSectionRequested():
        return browsePreviousSectionRequested(_that);
      case _BrowseFallbackPressed():
        return browseFallbackPressed(_that);
      case _BrowseLoadMoreRequested():
        return browseLoadMoreRequested(_that);
      case _BrowseLiveSelected():
        return browseLiveSelected(_that);
      case _BrowseReplacementClosed():
        return browseReplacementClosed(_that);
      case _BrowseReplacementSlotSelected():
        return browseReplacementSlotSelected(_that);
      case _PreferencesChanged():
        return preferencesChanged(_that);
      case _ViewModeSelected():
        return viewModeSelected(_that);
      case _MultiviewLayoutModeSelected():
        return multiviewLayoutModeSelected(_that);
      case _ActiveSlotShiftRequested():
        return activeSlotShiftRequested(_that);
      case _ActiveSlotSelected():
        return activeSlotSelected(_that);
      case _SlotAudioToggled():
        return slotAudioToggled(_that);
      case _SlotVolumeChanged():
        return slotVolumeChanged(_that);
      case _SlotResolutionSelected():
        return slotResolutionSelected(_that);
      case _SlotCloseConfirmed():
        return slotCloseConfirmed(_that);
      case _LiveStatusRefreshRequested():
        return liveStatusRefreshRequested(_that);
      case _FollowingToggled():
        return followingToggled(_that);
      case _GroupAddRequested():
        return groupAddRequested(_that);
      case _GroupActivated():
        return groupActivated(_that);
      case _FeedbackCleared():
        return feedbackCleared(_that);
      case _PlaybackReady():
        return playbackReady(_that);
      case _PlaybackEnded():
        return playbackEnded(_that);
      case _PlaybackFailed():
        return playbackFailed(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_JumpToRealtimeRequested value)? jumpToRealtimeRequested,
    TResult? Function(_ControlsRequested value)? controlsRequested,
    TResult? Function(_ControlsClosed value)? controlsClosed,
    TResult? Function(_BrowseRequested value)? browseRequested,
    TResult? Function(_BrowseClosed value)? browseClosed,
    TResult? Function(_BrowseNextSectionRequested value)?
    browseNextSectionRequested,
    TResult? Function(_BrowsePreviousSectionRequested value)?
    browsePreviousSectionRequested,
    TResult? Function(_BrowseFallbackPressed value)? browseFallbackPressed,
    TResult? Function(_BrowseLoadMoreRequested value)? browseLoadMoreRequested,
    TResult? Function(_BrowseLiveSelected value)? browseLiveSelected,
    TResult? Function(_BrowseReplacementClosed value)? browseReplacementClosed,
    TResult? Function(_BrowseReplacementSlotSelected value)?
    browseReplacementSlotSelected,
    TResult? Function(_PreferencesChanged value)? preferencesChanged,
    TResult? Function(_ViewModeSelected value)? viewModeSelected,
    TResult? Function(_MultiviewLayoutModeSelected value)?
    multiviewLayoutModeSelected,
    TResult? Function(_ActiveSlotShiftRequested value)?
    activeSlotShiftRequested,
    TResult? Function(_ActiveSlotSelected value)? activeSlotSelected,
    TResult? Function(_SlotAudioToggled value)? slotAudioToggled,
    TResult? Function(_SlotVolumeChanged value)? slotVolumeChanged,
    TResult? Function(_SlotResolutionSelected value)? slotResolutionSelected,
    TResult? Function(_SlotCloseConfirmed value)? slotCloseConfirmed,
    TResult? Function(_LiveStatusRefreshRequested value)?
    liveStatusRefreshRequested,
    TResult? Function(_FollowingToggled value)? followingToggled,
    TResult? Function(_GroupAddRequested value)? groupAddRequested,
    TResult? Function(_GroupActivated value)? groupActivated,
    TResult? Function(_FeedbackCleared value)? feedbackCleared,
    TResult? Function(_PlaybackReady value)? playbackReady,
    TResult? Function(_PlaybackEnded value)? playbackEnded,
    TResult? Function(_PlaybackFailed value)? playbackFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _JumpToRealtimeRequested() when jumpToRealtimeRequested != null:
        return jumpToRealtimeRequested(_that);
      case _ControlsRequested() when controlsRequested != null:
        return controlsRequested(_that);
      case _ControlsClosed() when controlsClosed != null:
        return controlsClosed(_that);
      case _BrowseRequested() when browseRequested != null:
        return browseRequested(_that);
      case _BrowseClosed() when browseClosed != null:
        return browseClosed(_that);
      case _BrowseNextSectionRequested()
          when browseNextSectionRequested != null:
        return browseNextSectionRequested(_that);
      case _BrowsePreviousSectionRequested()
          when browsePreviousSectionRequested != null:
        return browsePreviousSectionRequested(_that);
      case _BrowseFallbackPressed() when browseFallbackPressed != null:
        return browseFallbackPressed(_that);
      case _BrowseLoadMoreRequested() when browseLoadMoreRequested != null:
        return browseLoadMoreRequested(_that);
      case _BrowseLiveSelected() when browseLiveSelected != null:
        return browseLiveSelected(_that);
      case _BrowseReplacementClosed() when browseReplacementClosed != null:
        return browseReplacementClosed(_that);
      case _BrowseReplacementSlotSelected()
          when browseReplacementSlotSelected != null:
        return browseReplacementSlotSelected(_that);
      case _PreferencesChanged() when preferencesChanged != null:
        return preferencesChanged(_that);
      case _ViewModeSelected() when viewModeSelected != null:
        return viewModeSelected(_that);
      case _MultiviewLayoutModeSelected()
          when multiviewLayoutModeSelected != null:
        return multiviewLayoutModeSelected(_that);
      case _ActiveSlotShiftRequested() when activeSlotShiftRequested != null:
        return activeSlotShiftRequested(_that);
      case _ActiveSlotSelected() when activeSlotSelected != null:
        return activeSlotSelected(_that);
      case _SlotAudioToggled() when slotAudioToggled != null:
        return slotAudioToggled(_that);
      case _SlotVolumeChanged() when slotVolumeChanged != null:
        return slotVolumeChanged(_that);
      case _SlotResolutionSelected() when slotResolutionSelected != null:
        return slotResolutionSelected(_that);
      case _SlotCloseConfirmed() when slotCloseConfirmed != null:
        return slotCloseConfirmed(_that);
      case _LiveStatusRefreshRequested()
          when liveStatusRefreshRequested != null:
        return liveStatusRefreshRequested(_that);
      case _FollowingToggled() when followingToggled != null:
        return followingToggled(_that);
      case _GroupAddRequested() when groupAddRequested != null:
        return groupAddRequested(_that);
      case _GroupActivated() when groupActivated != null:
        return groupActivated(_that);
      case _FeedbackCleared() when feedbackCleared != null:
        return feedbackCleared(_that);
      case _PlaybackReady() when playbackReady != null:
        return playbackReady(_that);
      case _PlaybackEnded() when playbackEnded != null:
        return playbackEnded(_that);
      case _PlaybackFailed() when playbackFailed != null:
        return playbackFailed(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LivePlayerInitialTarget? initialTarget)? started,
    TResult Function()? retryRequested,
    TResult Function()? jumpToRealtimeRequested,
    TResult Function()? controlsRequested,
    TResult Function()? controlsClosed,
    TResult Function(bool isSignedIn)? browseRequested,
    TResult Function()? browseClosed,
    TResult Function()? browseNextSectionRequested,
    TResult Function()? browsePreviousSectionRequested,
    TResult Function()? browseFallbackPressed,
    TResult Function()? browseLoadMoreRequested,
    TResult Function(Live live)? browseLiveSelected,
    TResult Function()? browseReplacementClosed,
    TResult Function(String slotId)? browseReplacementSlotSelected,
    TResult Function(SettingsPreferences preferences)? preferencesChanged,
    TResult Function(LivePlayerViewMode viewMode)? viewModeSelected,
    TResult Function(LivePlayerMultiviewLayoutMode layoutMode)?
    multiviewLayoutModeSelected,
    TResult Function(int delta)? activeSlotShiftRequested,
    TResult Function(String slotId)? activeSlotSelected,
    TResult Function(String slotId)? slotAudioToggled,
    TResult Function(String slotId, double volume)? slotVolumeChanged,
    TResult Function(String slotId, int resolutionIndex)?
    slotResolutionSelected,
    TResult Function(String slotId)? slotCloseConfirmed,
    TResult Function(String slotId, String channelId)?
    liveStatusRefreshRequested,
    TResult Function()? followingToggled,
    TResult Function(String groupId)? groupAddRequested,
    TResult Function(String groupId)? groupActivated,
    TResult Function(int serial)? feedbackCleared,
    TResult Function(String slotId, Uri playbackUri)? playbackReady,
    TResult Function(String slotId, Uri playbackUri)? playbackEnded,
    TResult Function(String slotId, Uri playbackUri)? playbackFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.initialTarget);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _JumpToRealtimeRequested() when jumpToRealtimeRequested != null:
        return jumpToRealtimeRequested();
      case _ControlsRequested() when controlsRequested != null:
        return controlsRequested();
      case _ControlsClosed() when controlsClosed != null:
        return controlsClosed();
      case _BrowseRequested() when browseRequested != null:
        return browseRequested(_that.isSignedIn);
      case _BrowseClosed() when browseClosed != null:
        return browseClosed();
      case _BrowseNextSectionRequested()
          when browseNextSectionRequested != null:
        return browseNextSectionRequested();
      case _BrowsePreviousSectionRequested()
          when browsePreviousSectionRequested != null:
        return browsePreviousSectionRequested();
      case _BrowseFallbackPressed() when browseFallbackPressed != null:
        return browseFallbackPressed();
      case _BrowseLoadMoreRequested() when browseLoadMoreRequested != null:
        return browseLoadMoreRequested();
      case _BrowseLiveSelected() when browseLiveSelected != null:
        return browseLiveSelected(_that.live);
      case _BrowseReplacementClosed() when browseReplacementClosed != null:
        return browseReplacementClosed();
      case _BrowseReplacementSlotSelected()
          when browseReplacementSlotSelected != null:
        return browseReplacementSlotSelected(_that.slotId);
      case _PreferencesChanged() when preferencesChanged != null:
        return preferencesChanged(_that.preferences);
      case _ViewModeSelected() when viewModeSelected != null:
        return viewModeSelected(_that.viewMode);
      case _MultiviewLayoutModeSelected()
          when multiviewLayoutModeSelected != null:
        return multiviewLayoutModeSelected(_that.layoutMode);
      case _ActiveSlotShiftRequested() when activeSlotShiftRequested != null:
        return activeSlotShiftRequested(_that.delta);
      case _ActiveSlotSelected() when activeSlotSelected != null:
        return activeSlotSelected(_that.slotId);
      case _SlotAudioToggled() when slotAudioToggled != null:
        return slotAudioToggled(_that.slotId);
      case _SlotVolumeChanged() when slotVolumeChanged != null:
        return slotVolumeChanged(_that.slotId, _that.volume);
      case _SlotResolutionSelected() when slotResolutionSelected != null:
        return slotResolutionSelected(_that.slotId, _that.resolutionIndex);
      case _SlotCloseConfirmed() when slotCloseConfirmed != null:
        return slotCloseConfirmed(_that.slotId);
      case _LiveStatusRefreshRequested()
          when liveStatusRefreshRequested != null:
        return liveStatusRefreshRequested(_that.slotId, _that.channelId);
      case _FollowingToggled() when followingToggled != null:
        return followingToggled();
      case _GroupAddRequested() when groupAddRequested != null:
        return groupAddRequested(_that.groupId);
      case _GroupActivated() when groupActivated != null:
        return groupActivated(_that.groupId);
      case _FeedbackCleared() when feedbackCleared != null:
        return feedbackCleared(_that.serial);
      case _PlaybackReady() when playbackReady != null:
        return playbackReady(_that.slotId, _that.playbackUri);
      case _PlaybackEnded() when playbackEnded != null:
        return playbackEnded(_that.slotId, _that.playbackUri);
      case _PlaybackFailed() when playbackFailed != null:
        return playbackFailed(_that.slotId, _that.playbackUri);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LivePlayerInitialTarget? initialTarget) started,
    required TResult Function() retryRequested,
    required TResult Function() jumpToRealtimeRequested,
    required TResult Function() controlsRequested,
    required TResult Function() controlsClosed,
    required TResult Function(bool isSignedIn) browseRequested,
    required TResult Function() browseClosed,
    required TResult Function() browseNextSectionRequested,
    required TResult Function() browsePreviousSectionRequested,
    required TResult Function() browseFallbackPressed,
    required TResult Function() browseLoadMoreRequested,
    required TResult Function(Live live) browseLiveSelected,
    required TResult Function() browseReplacementClosed,
    required TResult Function(String slotId) browseReplacementSlotSelected,
    required TResult Function(SettingsPreferences preferences)
    preferencesChanged,
    required TResult Function(LivePlayerViewMode viewMode) viewModeSelected,
    required TResult Function(LivePlayerMultiviewLayoutMode layoutMode)
    multiviewLayoutModeSelected,
    required TResult Function(int delta) activeSlotShiftRequested,
    required TResult Function(String slotId) activeSlotSelected,
    required TResult Function(String slotId) slotAudioToggled,
    required TResult Function(String slotId, double volume) slotVolumeChanged,
    required TResult Function(String slotId, int resolutionIndex)
    slotResolutionSelected,
    required TResult Function(String slotId) slotCloseConfirmed,
    required TResult Function(String slotId, String channelId)
    liveStatusRefreshRequested,
    required TResult Function() followingToggled,
    required TResult Function(String groupId) groupAddRequested,
    required TResult Function(String groupId) groupActivated,
    required TResult Function(int serial) feedbackCleared,
    required TResult Function(String slotId, Uri playbackUri) playbackReady,
    required TResult Function(String slotId, Uri playbackUri) playbackEnded,
    required TResult Function(String slotId, Uri playbackUri) playbackFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that.initialTarget);
      case _RetryRequested():
        return retryRequested();
      case _JumpToRealtimeRequested():
        return jumpToRealtimeRequested();
      case _ControlsRequested():
        return controlsRequested();
      case _ControlsClosed():
        return controlsClosed();
      case _BrowseRequested():
        return browseRequested(_that.isSignedIn);
      case _BrowseClosed():
        return browseClosed();
      case _BrowseNextSectionRequested():
        return browseNextSectionRequested();
      case _BrowsePreviousSectionRequested():
        return browsePreviousSectionRequested();
      case _BrowseFallbackPressed():
        return browseFallbackPressed();
      case _BrowseLoadMoreRequested():
        return browseLoadMoreRequested();
      case _BrowseLiveSelected():
        return browseLiveSelected(_that.live);
      case _BrowseReplacementClosed():
        return browseReplacementClosed();
      case _BrowseReplacementSlotSelected():
        return browseReplacementSlotSelected(_that.slotId);
      case _PreferencesChanged():
        return preferencesChanged(_that.preferences);
      case _ViewModeSelected():
        return viewModeSelected(_that.viewMode);
      case _MultiviewLayoutModeSelected():
        return multiviewLayoutModeSelected(_that.layoutMode);
      case _ActiveSlotShiftRequested():
        return activeSlotShiftRequested(_that.delta);
      case _ActiveSlotSelected():
        return activeSlotSelected(_that.slotId);
      case _SlotAudioToggled():
        return slotAudioToggled(_that.slotId);
      case _SlotVolumeChanged():
        return slotVolumeChanged(_that.slotId, _that.volume);
      case _SlotResolutionSelected():
        return slotResolutionSelected(_that.slotId, _that.resolutionIndex);
      case _SlotCloseConfirmed():
        return slotCloseConfirmed(_that.slotId);
      case _LiveStatusRefreshRequested():
        return liveStatusRefreshRequested(_that.slotId, _that.channelId);
      case _FollowingToggled():
        return followingToggled();
      case _GroupAddRequested():
        return groupAddRequested(_that.groupId);
      case _GroupActivated():
        return groupActivated(_that.groupId);
      case _FeedbackCleared():
        return feedbackCleared(_that.serial);
      case _PlaybackReady():
        return playbackReady(_that.slotId, _that.playbackUri);
      case _PlaybackEnded():
        return playbackEnded(_that.slotId, _that.playbackUri);
      case _PlaybackFailed():
        return playbackFailed(_that.slotId, _that.playbackUri);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LivePlayerInitialTarget? initialTarget)? started,
    TResult? Function()? retryRequested,
    TResult? Function()? jumpToRealtimeRequested,
    TResult? Function()? controlsRequested,
    TResult? Function()? controlsClosed,
    TResult? Function(bool isSignedIn)? browseRequested,
    TResult? Function()? browseClosed,
    TResult? Function()? browseNextSectionRequested,
    TResult? Function()? browsePreviousSectionRequested,
    TResult? Function()? browseFallbackPressed,
    TResult? Function()? browseLoadMoreRequested,
    TResult? Function(Live live)? browseLiveSelected,
    TResult? Function()? browseReplacementClosed,
    TResult? Function(String slotId)? browseReplacementSlotSelected,
    TResult? Function(SettingsPreferences preferences)? preferencesChanged,
    TResult? Function(LivePlayerViewMode viewMode)? viewModeSelected,
    TResult? Function(LivePlayerMultiviewLayoutMode layoutMode)?
    multiviewLayoutModeSelected,
    TResult? Function(int delta)? activeSlotShiftRequested,
    TResult? Function(String slotId)? activeSlotSelected,
    TResult? Function(String slotId)? slotAudioToggled,
    TResult? Function(String slotId, double volume)? slotVolumeChanged,
    TResult? Function(String slotId, int resolutionIndex)?
    slotResolutionSelected,
    TResult? Function(String slotId)? slotCloseConfirmed,
    TResult? Function(String slotId, String channelId)?
    liveStatusRefreshRequested,
    TResult? Function()? followingToggled,
    TResult? Function(String groupId)? groupAddRequested,
    TResult? Function(String groupId)? groupActivated,
    TResult? Function(int serial)? feedbackCleared,
    TResult? Function(String slotId, Uri playbackUri)? playbackReady,
    TResult? Function(String slotId, Uri playbackUri)? playbackEnded,
    TResult? Function(String slotId, Uri playbackUri)? playbackFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.initialTarget);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _JumpToRealtimeRequested() when jumpToRealtimeRequested != null:
        return jumpToRealtimeRequested();
      case _ControlsRequested() when controlsRequested != null:
        return controlsRequested();
      case _ControlsClosed() when controlsClosed != null:
        return controlsClosed();
      case _BrowseRequested() when browseRequested != null:
        return browseRequested(_that.isSignedIn);
      case _BrowseClosed() when browseClosed != null:
        return browseClosed();
      case _BrowseNextSectionRequested()
          when browseNextSectionRequested != null:
        return browseNextSectionRequested();
      case _BrowsePreviousSectionRequested()
          when browsePreviousSectionRequested != null:
        return browsePreviousSectionRequested();
      case _BrowseFallbackPressed() when browseFallbackPressed != null:
        return browseFallbackPressed();
      case _BrowseLoadMoreRequested() when browseLoadMoreRequested != null:
        return browseLoadMoreRequested();
      case _BrowseLiveSelected() when browseLiveSelected != null:
        return browseLiveSelected(_that.live);
      case _BrowseReplacementClosed() when browseReplacementClosed != null:
        return browseReplacementClosed();
      case _BrowseReplacementSlotSelected()
          when browseReplacementSlotSelected != null:
        return browseReplacementSlotSelected(_that.slotId);
      case _PreferencesChanged() when preferencesChanged != null:
        return preferencesChanged(_that.preferences);
      case _ViewModeSelected() when viewModeSelected != null:
        return viewModeSelected(_that.viewMode);
      case _MultiviewLayoutModeSelected()
          when multiviewLayoutModeSelected != null:
        return multiviewLayoutModeSelected(_that.layoutMode);
      case _ActiveSlotShiftRequested() when activeSlotShiftRequested != null:
        return activeSlotShiftRequested(_that.delta);
      case _ActiveSlotSelected() when activeSlotSelected != null:
        return activeSlotSelected(_that.slotId);
      case _SlotAudioToggled() when slotAudioToggled != null:
        return slotAudioToggled(_that.slotId);
      case _SlotVolumeChanged() when slotVolumeChanged != null:
        return slotVolumeChanged(_that.slotId, _that.volume);
      case _SlotResolutionSelected() when slotResolutionSelected != null:
        return slotResolutionSelected(_that.slotId, _that.resolutionIndex);
      case _SlotCloseConfirmed() when slotCloseConfirmed != null:
        return slotCloseConfirmed(_that.slotId);
      case _LiveStatusRefreshRequested()
          when liveStatusRefreshRequested != null:
        return liveStatusRefreshRequested(_that.slotId, _that.channelId);
      case _FollowingToggled() when followingToggled != null:
        return followingToggled();
      case _GroupAddRequested() when groupAddRequested != null:
        return groupAddRequested(_that.groupId);
      case _GroupActivated() when groupActivated != null:
        return groupActivated(_that.groupId);
      case _FeedbackCleared() when feedbackCleared != null:
        return feedbackCleared(_that.serial);
      case _PlaybackReady() when playbackReady != null:
        return playbackReady(_that.slotId, _that.playbackUri);
      case _PlaybackEnded() when playbackEnded != null:
        return playbackEnded(_that.slotId, _that.playbackUri);
      case _PlaybackFailed() when playbackFailed != null:
        return playbackFailed(_that.slotId, _that.playbackUri);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements LivePlayerEvent {
  const _Started({this.initialTarget});

  final LivePlayerInitialTarget? initialTarget;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Started &&
            (identical(other.initialTarget, initialTarget) ||
                other.initialTarget == initialTarget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialTarget);

  @override
  String toString() {
    return 'LivePlayerEvent.started(initialTarget: $initialTarget)';
  }
}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) =
      __$StartedCopyWithImpl;
  @useResult
  $Res call({LivePlayerInitialTarget? initialTarget});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? initialTarget = freezed}) {
    return _then(
      _Started(
        initialTarget: freezed == initialTarget
            ? _self.initialTarget
            : initialTarget // ignore: cast_nullable_to_non_nullable
                  as LivePlayerInitialTarget?,
      ),
    );
  }
}

/// @nodoc

class _RetryRequested implements LivePlayerEvent {
  const _RetryRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RetryRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivePlayerEvent.retryRequested()';
  }
}

/// @nodoc

class _JumpToRealtimeRequested implements LivePlayerEvent {
  const _JumpToRealtimeRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _JumpToRealtimeRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivePlayerEvent.jumpToRealtimeRequested()';
  }
}

/// @nodoc

class _ControlsRequested implements LivePlayerEvent {
  const _ControlsRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ControlsRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivePlayerEvent.controlsRequested()';
  }
}

/// @nodoc

class _ControlsClosed implements LivePlayerEvent {
  const _ControlsClosed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ControlsClosed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivePlayerEvent.controlsClosed()';
  }
}

/// @nodoc

class _BrowseRequested implements LivePlayerEvent {
  const _BrowseRequested({required this.isSignedIn});

  final bool isSignedIn;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BrowseRequestedCopyWith<_BrowseRequested> get copyWith =>
      __$BrowseRequestedCopyWithImpl<_BrowseRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrowseRequested &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSignedIn);

  @override
  String toString() {
    return 'LivePlayerEvent.browseRequested(isSignedIn: $isSignedIn)';
  }
}

/// @nodoc
abstract mixin class _$BrowseRequestedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$BrowseRequestedCopyWith(
    _BrowseRequested value,
    $Res Function(_BrowseRequested) _then,
  ) = __$BrowseRequestedCopyWithImpl;
  @useResult
  $Res call({bool isSignedIn});
}

/// @nodoc
class __$BrowseRequestedCopyWithImpl<$Res>
    implements _$BrowseRequestedCopyWith<$Res> {
  __$BrowseRequestedCopyWithImpl(this._self, this._then);

  final _BrowseRequested _self;
  final $Res Function(_BrowseRequested) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? isSignedIn = null}) {
    return _then(
      _BrowseRequested(
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _BrowseClosed implements LivePlayerEvent {
  const _BrowseClosed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BrowseClosed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivePlayerEvent.browseClosed()';
  }
}

/// @nodoc

class _BrowseNextSectionRequested implements LivePlayerEvent {
  const _BrowseNextSectionRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrowseNextSectionRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivePlayerEvent.browseNextSectionRequested()';
  }
}

/// @nodoc

class _BrowsePreviousSectionRequested implements LivePlayerEvent {
  const _BrowsePreviousSectionRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrowsePreviousSectionRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivePlayerEvent.browsePreviousSectionRequested()';
  }
}

/// @nodoc

class _BrowseFallbackPressed implements LivePlayerEvent {
  const _BrowseFallbackPressed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BrowseFallbackPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivePlayerEvent.browseFallbackPressed()';
  }
}

/// @nodoc

class _BrowseLoadMoreRequested implements LivePlayerEvent {
  const _BrowseLoadMoreRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BrowseLoadMoreRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivePlayerEvent.browseLoadMoreRequested()';
  }
}

/// @nodoc

class _BrowseLiveSelected implements LivePlayerEvent {
  const _BrowseLiveSelected({required this.live});

  final Live live;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BrowseLiveSelectedCopyWith<_BrowseLiveSelected> get copyWith =>
      __$BrowseLiveSelectedCopyWithImpl<_BrowseLiveSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrowseLiveSelected &&
            (identical(other.live, live) || other.live == live));
  }

  @override
  int get hashCode => Object.hash(runtimeType, live);

  @override
  String toString() {
    return 'LivePlayerEvent.browseLiveSelected(live: $live)';
  }
}

/// @nodoc
abstract mixin class _$BrowseLiveSelectedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$BrowseLiveSelectedCopyWith(
    _BrowseLiveSelected value,
    $Res Function(_BrowseLiveSelected) _then,
  ) = __$BrowseLiveSelectedCopyWithImpl;
  @useResult
  $Res call({Live live});

  $LiveCopyWith<$Res> get live;
}

/// @nodoc
class __$BrowseLiveSelectedCopyWithImpl<$Res>
    implements _$BrowseLiveSelectedCopyWith<$Res> {
  __$BrowseLiveSelectedCopyWithImpl(this._self, this._then);

  final _BrowseLiveSelected _self;
  final $Res Function(_BrowseLiveSelected) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? live = null}) {
    return _then(
      _BrowseLiveSelected(
        live: null == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as Live,
      ),
    );
  }

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveCopyWith<$Res> get live {
    return $LiveCopyWith<$Res>(_self.live, (value) {
      return _then(_self.copyWith(live: value));
    });
  }
}

/// @nodoc

class _BrowseReplacementClosed implements LivePlayerEvent {
  const _BrowseReplacementClosed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BrowseReplacementClosed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivePlayerEvent.browseReplacementClosed()';
  }
}

/// @nodoc

class _BrowseReplacementSlotSelected implements LivePlayerEvent {
  const _BrowseReplacementSlotSelected({required this.slotId});

  final String slotId;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BrowseReplacementSlotSelectedCopyWith<_BrowseReplacementSlotSelected>
  get copyWith =>
      __$BrowseReplacementSlotSelectedCopyWithImpl<
        _BrowseReplacementSlotSelected
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrowseReplacementSlotSelected &&
            (identical(other.slotId, slotId) || other.slotId == slotId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId);

  @override
  String toString() {
    return 'LivePlayerEvent.browseReplacementSlotSelected(slotId: $slotId)';
  }
}

/// @nodoc
abstract mixin class _$BrowseReplacementSlotSelectedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$BrowseReplacementSlotSelectedCopyWith(
    _BrowseReplacementSlotSelected value,
    $Res Function(_BrowseReplacementSlotSelected) _then,
  ) = __$BrowseReplacementSlotSelectedCopyWithImpl;
  @useResult
  $Res call({String slotId});
}

/// @nodoc
class __$BrowseReplacementSlotSelectedCopyWithImpl<$Res>
    implements _$BrowseReplacementSlotSelectedCopyWith<$Res> {
  __$BrowseReplacementSlotSelectedCopyWithImpl(this._self, this._then);

  final _BrowseReplacementSlotSelected _self;
  final $Res Function(_BrowseReplacementSlotSelected) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? slotId = null}) {
    return _then(
      _BrowseReplacementSlotSelected(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _PreferencesChanged implements LivePlayerEvent {
  const _PreferencesChanged({required this.preferences});

  final SettingsPreferences preferences;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PreferencesChangedCopyWith<_PreferencesChanged> get copyWith =>
      __$PreferencesChangedCopyWithImpl<_PreferencesChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PreferencesChanged &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preferences);

  @override
  String toString() {
    return 'LivePlayerEvent.preferencesChanged(preferences: $preferences)';
  }
}

/// @nodoc
abstract mixin class _$PreferencesChangedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$PreferencesChangedCopyWith(
    _PreferencesChanged value,
    $Res Function(_PreferencesChanged) _then,
  ) = __$PreferencesChangedCopyWithImpl;
  @useResult
  $Res call({SettingsPreferences preferences});

  $SettingsPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class __$PreferencesChangedCopyWithImpl<$Res>
    implements _$PreferencesChangedCopyWith<$Res> {
  __$PreferencesChangedCopyWithImpl(this._self, this._then);

  final _PreferencesChanged _self;
  final $Res Function(_PreferencesChanged) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? preferences = null}) {
    return _then(
      _PreferencesChanged(
        preferences: null == preferences
            ? _self.preferences
            : preferences // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferences,
      ),
    );
  }

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingsPreferencesCopyWith<$Res> get preferences {
    return $SettingsPreferencesCopyWith<$Res>(_self.preferences, (value) {
      return _then(_self.copyWith(preferences: value));
    });
  }
}

/// @nodoc

class _ViewModeSelected implements LivePlayerEvent {
  const _ViewModeSelected({required this.viewMode});

  final LivePlayerViewMode viewMode;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ViewModeSelectedCopyWith<_ViewModeSelected> get copyWith =>
      __$ViewModeSelectedCopyWithImpl<_ViewModeSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewModeSelected &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewMode);

  @override
  String toString() {
    return 'LivePlayerEvent.viewModeSelected(viewMode: $viewMode)';
  }
}

/// @nodoc
abstract mixin class _$ViewModeSelectedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$ViewModeSelectedCopyWith(
    _ViewModeSelected value,
    $Res Function(_ViewModeSelected) _then,
  ) = __$ViewModeSelectedCopyWithImpl;
  @useResult
  $Res call({LivePlayerViewMode viewMode});
}

/// @nodoc
class __$ViewModeSelectedCopyWithImpl<$Res>
    implements _$ViewModeSelectedCopyWith<$Res> {
  __$ViewModeSelectedCopyWithImpl(this._self, this._then);

  final _ViewModeSelected _self;
  final $Res Function(_ViewModeSelected) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? viewMode = null}) {
    return _then(
      _ViewModeSelected(
        viewMode: null == viewMode
            ? _self.viewMode
            : viewMode // ignore: cast_nullable_to_non_nullable
                  as LivePlayerViewMode,
      ),
    );
  }
}

/// @nodoc

class _MultiviewLayoutModeSelected implements LivePlayerEvent {
  const _MultiviewLayoutModeSelected({required this.layoutMode});

  final LivePlayerMultiviewLayoutMode layoutMode;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MultiviewLayoutModeSelectedCopyWith<_MultiviewLayoutModeSelected>
  get copyWith =>
      __$MultiviewLayoutModeSelectedCopyWithImpl<_MultiviewLayoutModeSelected>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MultiviewLayoutModeSelected &&
            (identical(other.layoutMode, layoutMode) ||
                other.layoutMode == layoutMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, layoutMode);

  @override
  String toString() {
    return 'LivePlayerEvent.multiviewLayoutModeSelected(layoutMode: $layoutMode)';
  }
}

/// @nodoc
abstract mixin class _$MultiviewLayoutModeSelectedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$MultiviewLayoutModeSelectedCopyWith(
    _MultiviewLayoutModeSelected value,
    $Res Function(_MultiviewLayoutModeSelected) _then,
  ) = __$MultiviewLayoutModeSelectedCopyWithImpl;
  @useResult
  $Res call({LivePlayerMultiviewLayoutMode layoutMode});
}

/// @nodoc
class __$MultiviewLayoutModeSelectedCopyWithImpl<$Res>
    implements _$MultiviewLayoutModeSelectedCopyWith<$Res> {
  __$MultiviewLayoutModeSelectedCopyWithImpl(this._self, this._then);

  final _MultiviewLayoutModeSelected _self;
  final $Res Function(_MultiviewLayoutModeSelected) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? layoutMode = null}) {
    return _then(
      _MultiviewLayoutModeSelected(
        layoutMode: null == layoutMode
            ? _self.layoutMode
            : layoutMode // ignore: cast_nullable_to_non_nullable
                  as LivePlayerMultiviewLayoutMode,
      ),
    );
  }
}

/// @nodoc

class _ActiveSlotShiftRequested implements LivePlayerEvent {
  const _ActiveSlotShiftRequested({required this.delta});

  final int delta;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActiveSlotShiftRequestedCopyWith<_ActiveSlotShiftRequested> get copyWith =>
      __$ActiveSlotShiftRequestedCopyWithImpl<_ActiveSlotShiftRequested>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActiveSlotShiftRequested &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, delta);

  @override
  String toString() {
    return 'LivePlayerEvent.activeSlotShiftRequested(delta: $delta)';
  }
}

/// @nodoc
abstract mixin class _$ActiveSlotShiftRequestedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$ActiveSlotShiftRequestedCopyWith(
    _ActiveSlotShiftRequested value,
    $Res Function(_ActiveSlotShiftRequested) _then,
  ) = __$ActiveSlotShiftRequestedCopyWithImpl;
  @useResult
  $Res call({int delta});
}

/// @nodoc
class __$ActiveSlotShiftRequestedCopyWithImpl<$Res>
    implements _$ActiveSlotShiftRequestedCopyWith<$Res> {
  __$ActiveSlotShiftRequestedCopyWithImpl(this._self, this._then);

  final _ActiveSlotShiftRequested _self;
  final $Res Function(_ActiveSlotShiftRequested) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? delta = null}) {
    return _then(
      _ActiveSlotShiftRequested(
        delta: null == delta
            ? _self.delta
            : delta // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _ActiveSlotSelected implements LivePlayerEvent {
  const _ActiveSlotSelected({required this.slotId});

  final String slotId;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActiveSlotSelectedCopyWith<_ActiveSlotSelected> get copyWith =>
      __$ActiveSlotSelectedCopyWithImpl<_ActiveSlotSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActiveSlotSelected &&
            (identical(other.slotId, slotId) || other.slotId == slotId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId);

  @override
  String toString() {
    return 'LivePlayerEvent.activeSlotSelected(slotId: $slotId)';
  }
}

/// @nodoc
abstract mixin class _$ActiveSlotSelectedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$ActiveSlotSelectedCopyWith(
    _ActiveSlotSelected value,
    $Res Function(_ActiveSlotSelected) _then,
  ) = __$ActiveSlotSelectedCopyWithImpl;
  @useResult
  $Res call({String slotId});
}

/// @nodoc
class __$ActiveSlotSelectedCopyWithImpl<$Res>
    implements _$ActiveSlotSelectedCopyWith<$Res> {
  __$ActiveSlotSelectedCopyWithImpl(this._self, this._then);

  final _ActiveSlotSelected _self;
  final $Res Function(_ActiveSlotSelected) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? slotId = null}) {
    return _then(
      _ActiveSlotSelected(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _SlotAudioToggled implements LivePlayerEvent {
  const _SlotAudioToggled({required this.slotId});

  final String slotId;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SlotAudioToggledCopyWith<_SlotAudioToggled> get copyWith =>
      __$SlotAudioToggledCopyWithImpl<_SlotAudioToggled>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SlotAudioToggled &&
            (identical(other.slotId, slotId) || other.slotId == slotId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId);

  @override
  String toString() {
    return 'LivePlayerEvent.slotAudioToggled(slotId: $slotId)';
  }
}

/// @nodoc
abstract mixin class _$SlotAudioToggledCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$SlotAudioToggledCopyWith(
    _SlotAudioToggled value,
    $Res Function(_SlotAudioToggled) _then,
  ) = __$SlotAudioToggledCopyWithImpl;
  @useResult
  $Res call({String slotId});
}

/// @nodoc
class __$SlotAudioToggledCopyWithImpl<$Res>
    implements _$SlotAudioToggledCopyWith<$Res> {
  __$SlotAudioToggledCopyWithImpl(this._self, this._then);

  final _SlotAudioToggled _self;
  final $Res Function(_SlotAudioToggled) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? slotId = null}) {
    return _then(
      _SlotAudioToggled(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _SlotVolumeChanged implements LivePlayerEvent {
  const _SlotVolumeChanged({required this.slotId, required this.volume});

  final String slotId;
  final double volume;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SlotVolumeChangedCopyWith<_SlotVolumeChanged> get copyWith =>
      __$SlotVolumeChangedCopyWithImpl<_SlotVolumeChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SlotVolumeChanged &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId, volume);

  @override
  String toString() {
    return 'LivePlayerEvent.slotVolumeChanged(slotId: $slotId, volume: $volume)';
  }
}

/// @nodoc
abstract mixin class _$SlotVolumeChangedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$SlotVolumeChangedCopyWith(
    _SlotVolumeChanged value,
    $Res Function(_SlotVolumeChanged) _then,
  ) = __$SlotVolumeChangedCopyWithImpl;
  @useResult
  $Res call({String slotId, double volume});
}

/// @nodoc
class __$SlotVolumeChangedCopyWithImpl<$Res>
    implements _$SlotVolumeChangedCopyWith<$Res> {
  __$SlotVolumeChangedCopyWithImpl(this._self, this._then);

  final _SlotVolumeChanged _self;
  final $Res Function(_SlotVolumeChanged) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? slotId = null, Object? volume = null}) {
    return _then(
      _SlotVolumeChanged(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        volume: null == volume
            ? _self.volume
            : volume // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _SlotResolutionSelected implements LivePlayerEvent {
  const _SlotResolutionSelected({
    required this.slotId,
    required this.resolutionIndex,
  });

  final String slotId;
  final int resolutionIndex;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SlotResolutionSelectedCopyWith<_SlotResolutionSelected> get copyWith =>
      __$SlotResolutionSelectedCopyWithImpl<_SlotResolutionSelected>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SlotResolutionSelected &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.resolutionIndex, resolutionIndex) ||
                other.resolutionIndex == resolutionIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId, resolutionIndex);

  @override
  String toString() {
    return 'LivePlayerEvent.slotResolutionSelected(slotId: $slotId, resolutionIndex: $resolutionIndex)';
  }
}

/// @nodoc
abstract mixin class _$SlotResolutionSelectedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$SlotResolutionSelectedCopyWith(
    _SlotResolutionSelected value,
    $Res Function(_SlotResolutionSelected) _then,
  ) = __$SlotResolutionSelectedCopyWithImpl;
  @useResult
  $Res call({String slotId, int resolutionIndex});
}

/// @nodoc
class __$SlotResolutionSelectedCopyWithImpl<$Res>
    implements _$SlotResolutionSelectedCopyWith<$Res> {
  __$SlotResolutionSelectedCopyWithImpl(this._self, this._then);

  final _SlotResolutionSelected _self;
  final $Res Function(_SlotResolutionSelected) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? slotId = null, Object? resolutionIndex = null}) {
    return _then(
      _SlotResolutionSelected(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        resolutionIndex: null == resolutionIndex
            ? _self.resolutionIndex
            : resolutionIndex // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _SlotCloseConfirmed implements LivePlayerEvent {
  const _SlotCloseConfirmed({required this.slotId});

  final String slotId;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SlotCloseConfirmedCopyWith<_SlotCloseConfirmed> get copyWith =>
      __$SlotCloseConfirmedCopyWithImpl<_SlotCloseConfirmed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SlotCloseConfirmed &&
            (identical(other.slotId, slotId) || other.slotId == slotId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId);

  @override
  String toString() {
    return 'LivePlayerEvent.slotCloseConfirmed(slotId: $slotId)';
  }
}

/// @nodoc
abstract mixin class _$SlotCloseConfirmedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$SlotCloseConfirmedCopyWith(
    _SlotCloseConfirmed value,
    $Res Function(_SlotCloseConfirmed) _then,
  ) = __$SlotCloseConfirmedCopyWithImpl;
  @useResult
  $Res call({String slotId});
}

/// @nodoc
class __$SlotCloseConfirmedCopyWithImpl<$Res>
    implements _$SlotCloseConfirmedCopyWith<$Res> {
  __$SlotCloseConfirmedCopyWithImpl(this._self, this._then);

  final _SlotCloseConfirmed _self;
  final $Res Function(_SlotCloseConfirmed) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? slotId = null}) {
    return _then(
      _SlotCloseConfirmed(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _LiveStatusRefreshRequested implements LivePlayerEvent {
  const _LiveStatusRefreshRequested({
    required this.slotId,
    required this.channelId,
  });

  final String slotId;
  final String channelId;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveStatusRefreshRequestedCopyWith<_LiveStatusRefreshRequested>
  get copyWith =>
      __$LiveStatusRefreshRequestedCopyWithImpl<_LiveStatusRefreshRequested>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveStatusRefreshRequested &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId, channelId);

  @override
  String toString() {
    return 'LivePlayerEvent.liveStatusRefreshRequested(slotId: $slotId, channelId: $channelId)';
  }
}

/// @nodoc
abstract mixin class _$LiveStatusRefreshRequestedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$LiveStatusRefreshRequestedCopyWith(
    _LiveStatusRefreshRequested value,
    $Res Function(_LiveStatusRefreshRequested) _then,
  ) = __$LiveStatusRefreshRequestedCopyWithImpl;
  @useResult
  $Res call({String slotId, String channelId});
}

/// @nodoc
class __$LiveStatusRefreshRequestedCopyWithImpl<$Res>
    implements _$LiveStatusRefreshRequestedCopyWith<$Res> {
  __$LiveStatusRefreshRequestedCopyWithImpl(this._self, this._then);

  final _LiveStatusRefreshRequested _self;
  final $Res Function(_LiveStatusRefreshRequested) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? slotId = null, Object? channelId = null}) {
    return _then(
      _LiveStatusRefreshRequested(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _FollowingToggled implements LivePlayerEvent {
  const _FollowingToggled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FollowingToggled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivePlayerEvent.followingToggled()';
  }
}

/// @nodoc

class _GroupAddRequested implements LivePlayerEvent {
  const _GroupAddRequested({required this.groupId});

  final String groupId;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupAddRequestedCopyWith<_GroupAddRequested> get copyWith =>
      __$GroupAddRequestedCopyWithImpl<_GroupAddRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupAddRequested &&
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId);

  @override
  String toString() {
    return 'LivePlayerEvent.groupAddRequested(groupId: $groupId)';
  }
}

/// @nodoc
abstract mixin class _$GroupAddRequestedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$GroupAddRequestedCopyWith(
    _GroupAddRequested value,
    $Res Function(_GroupAddRequested) _then,
  ) = __$GroupAddRequestedCopyWithImpl;
  @useResult
  $Res call({String groupId});
}

/// @nodoc
class __$GroupAddRequestedCopyWithImpl<$Res>
    implements _$GroupAddRequestedCopyWith<$Res> {
  __$GroupAddRequestedCopyWithImpl(this._self, this._then);

  final _GroupAddRequested _self;
  final $Res Function(_GroupAddRequested) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? groupId = null}) {
    return _then(
      _GroupAddRequested(
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _GroupActivated implements LivePlayerEvent {
  const _GroupActivated({required this.groupId});

  final String groupId;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupActivatedCopyWith<_GroupActivated> get copyWith =>
      __$GroupActivatedCopyWithImpl<_GroupActivated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupActivated &&
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId);

  @override
  String toString() {
    return 'LivePlayerEvent.groupActivated(groupId: $groupId)';
  }
}

/// @nodoc
abstract mixin class _$GroupActivatedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$GroupActivatedCopyWith(
    _GroupActivated value,
    $Res Function(_GroupActivated) _then,
  ) = __$GroupActivatedCopyWithImpl;
  @useResult
  $Res call({String groupId});
}

/// @nodoc
class __$GroupActivatedCopyWithImpl<$Res>
    implements _$GroupActivatedCopyWith<$Res> {
  __$GroupActivatedCopyWithImpl(this._self, this._then);

  final _GroupActivated _self;
  final $Res Function(_GroupActivated) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? groupId = null}) {
    return _then(
      _GroupActivated(
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _FeedbackCleared implements LivePlayerEvent {
  const _FeedbackCleared({required this.serial});

  final int serial;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeedbackClearedCopyWith<_FeedbackCleared> get copyWith =>
      __$FeedbackClearedCopyWithImpl<_FeedbackCleared>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeedbackCleared &&
            (identical(other.serial, serial) || other.serial == serial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serial);

  @override
  String toString() {
    return 'LivePlayerEvent.feedbackCleared(serial: $serial)';
  }
}

/// @nodoc
abstract mixin class _$FeedbackClearedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$FeedbackClearedCopyWith(
    _FeedbackCleared value,
    $Res Function(_FeedbackCleared) _then,
  ) = __$FeedbackClearedCopyWithImpl;
  @useResult
  $Res call({int serial});
}

/// @nodoc
class __$FeedbackClearedCopyWithImpl<$Res>
    implements _$FeedbackClearedCopyWith<$Res> {
  __$FeedbackClearedCopyWithImpl(this._self, this._then);

  final _FeedbackCleared _self;
  final $Res Function(_FeedbackCleared) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? serial = null}) {
    return _then(
      _FeedbackCleared(
        serial: null == serial
            ? _self.serial
            : serial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _PlaybackReady implements LivePlayerEvent {
  const _PlaybackReady({required this.slotId, required this.playbackUri});

  final String slotId;
  final Uri playbackUri;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaybackReadyCopyWith<_PlaybackReady> get copyWith =>
      __$PlaybackReadyCopyWithImpl<_PlaybackReady>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaybackReady &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.playbackUri, playbackUri) ||
                other.playbackUri == playbackUri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId, playbackUri);

  @override
  String toString() {
    return 'LivePlayerEvent.playbackReady(slotId: $slotId, playbackUri: $playbackUri)';
  }
}

/// @nodoc
abstract mixin class _$PlaybackReadyCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$PlaybackReadyCopyWith(
    _PlaybackReady value,
    $Res Function(_PlaybackReady) _then,
  ) = __$PlaybackReadyCopyWithImpl;
  @useResult
  $Res call({String slotId, Uri playbackUri});
}

/// @nodoc
class __$PlaybackReadyCopyWithImpl<$Res>
    implements _$PlaybackReadyCopyWith<$Res> {
  __$PlaybackReadyCopyWithImpl(this._self, this._then);

  final _PlaybackReady _self;
  final $Res Function(_PlaybackReady) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? slotId = null, Object? playbackUri = null}) {
    return _then(
      _PlaybackReady(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        playbackUri: null == playbackUri
            ? _self.playbackUri
            : playbackUri // ignore: cast_nullable_to_non_nullable
                  as Uri,
      ),
    );
  }
}

/// @nodoc

class _PlaybackEnded implements LivePlayerEvent {
  const _PlaybackEnded({required this.slotId, required this.playbackUri});

  final String slotId;
  final Uri playbackUri;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaybackEndedCopyWith<_PlaybackEnded> get copyWith =>
      __$PlaybackEndedCopyWithImpl<_PlaybackEnded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaybackEnded &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.playbackUri, playbackUri) ||
                other.playbackUri == playbackUri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId, playbackUri);

  @override
  String toString() {
    return 'LivePlayerEvent.playbackEnded(slotId: $slotId, playbackUri: $playbackUri)';
  }
}

/// @nodoc
abstract mixin class _$PlaybackEndedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$PlaybackEndedCopyWith(
    _PlaybackEnded value,
    $Res Function(_PlaybackEnded) _then,
  ) = __$PlaybackEndedCopyWithImpl;
  @useResult
  $Res call({String slotId, Uri playbackUri});
}

/// @nodoc
class __$PlaybackEndedCopyWithImpl<$Res>
    implements _$PlaybackEndedCopyWith<$Res> {
  __$PlaybackEndedCopyWithImpl(this._self, this._then);

  final _PlaybackEnded _self;
  final $Res Function(_PlaybackEnded) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? slotId = null, Object? playbackUri = null}) {
    return _then(
      _PlaybackEnded(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        playbackUri: null == playbackUri
            ? _self.playbackUri
            : playbackUri // ignore: cast_nullable_to_non_nullable
                  as Uri,
      ),
    );
  }
}

/// @nodoc

class _PlaybackFailed implements LivePlayerEvent {
  const _PlaybackFailed({required this.slotId, required this.playbackUri});

  final String slotId;
  final Uri playbackUri;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaybackFailedCopyWith<_PlaybackFailed> get copyWith =>
      __$PlaybackFailedCopyWithImpl<_PlaybackFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaybackFailed &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.playbackUri, playbackUri) ||
                other.playbackUri == playbackUri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId, playbackUri);

  @override
  String toString() {
    return 'LivePlayerEvent.playbackFailed(slotId: $slotId, playbackUri: $playbackUri)';
  }
}

/// @nodoc
abstract mixin class _$PlaybackFailedCopyWith<$Res>
    implements $LivePlayerEventCopyWith<$Res> {
  factory _$PlaybackFailedCopyWith(
    _PlaybackFailed value,
    $Res Function(_PlaybackFailed) _then,
  ) = __$PlaybackFailedCopyWithImpl;
  @useResult
  $Res call({String slotId, Uri playbackUri});
}

/// @nodoc
class __$PlaybackFailedCopyWithImpl<$Res>
    implements _$PlaybackFailedCopyWith<$Res> {
  __$PlaybackFailedCopyWithImpl(this._self, this._then);

  final _PlaybackFailed _self;
  final $Res Function(_PlaybackFailed) _then;

  /// Create a copy of LivePlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? slotId = null, Object? playbackUri = null}) {
    return _then(
      _PlaybackFailed(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        playbackUri: null == playbackUri
            ? _self.playbackUri
            : playbackUri // ignore: cast_nullable_to_non_nullable
                  as Uri,
      ),
    );
  }
}

/// @nodoc
mixin _$LivePlayerSlotState {
  String get slotId;
  LivePlayerSlotStatus get status;
  String? get channelId;
  int? get liveId;
  String? get fallbackTitle;
  String? get fallbackThumbnailImageUrl;
  LiveDetail? get detail;
  LiveStatus? get liveStatus;
  Uri? get playbackUri;
  List<int> get availableResolutionIndexes;
  int? get playbackLatencyIndex;
  int? get playbackResolutionIndex;
  PlayerVideoViewType get videoViewType;
  LivePlayerFailureReason? get failureReason;

  /// Create a copy of LivePlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LivePlayerSlotStateCopyWith<LivePlayerSlotState> get copyWith =>
      _$LivePlayerSlotStateCopyWithImpl<LivePlayerSlotState>(
        this as LivePlayerSlotState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LivePlayerSlotState &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.fallbackTitle, fallbackTitle) ||
                other.fallbackTitle == fallbackTitle) &&
            (identical(
                  other.fallbackThumbnailImageUrl,
                  fallbackThumbnailImageUrl,
                ) ||
                other.fallbackThumbnailImageUrl == fallbackThumbnailImageUrl) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.liveStatus, liveStatus) ||
                other.liveStatus == liveStatus) &&
            (identical(other.playbackUri, playbackUri) ||
                other.playbackUri == playbackUri) &&
            const DeepCollectionEquality().equals(
              other.availableResolutionIndexes,
              availableResolutionIndexes,
            ) &&
            (identical(other.playbackLatencyIndex, playbackLatencyIndex) ||
                other.playbackLatencyIndex == playbackLatencyIndex) &&
            (identical(
                  other.playbackResolutionIndex,
                  playbackResolutionIndex,
                ) ||
                other.playbackResolutionIndex == playbackResolutionIndex) &&
            (identical(other.videoViewType, videoViewType) ||
                other.videoViewType == videoViewType) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    slotId,
    status,
    channelId,
    liveId,
    fallbackTitle,
    fallbackThumbnailImageUrl,
    detail,
    liveStatus,
    playbackUri,
    const DeepCollectionEquality().hash(availableResolutionIndexes),
    playbackLatencyIndex,
    playbackResolutionIndex,
    videoViewType,
    failureReason,
  );

  @override
  String toString() {
    return 'LivePlayerSlotState(slotId: $slotId, status: $status, channelId: $channelId, liveId: $liveId, fallbackTitle: $fallbackTitle, fallbackThumbnailImageUrl: $fallbackThumbnailImageUrl, detail: $detail, liveStatus: $liveStatus, playbackUri: $playbackUri, availableResolutionIndexes: $availableResolutionIndexes, playbackLatencyIndex: $playbackLatencyIndex, playbackResolutionIndex: $playbackResolutionIndex, videoViewType: $videoViewType, failureReason: $failureReason)';
  }
}

/// @nodoc
abstract mixin class $LivePlayerSlotStateCopyWith<$Res> {
  factory $LivePlayerSlotStateCopyWith(
    LivePlayerSlotState value,
    $Res Function(LivePlayerSlotState) _then,
  ) = _$LivePlayerSlotStateCopyWithImpl;
  @useResult
  $Res call({
    String slotId,
    LivePlayerSlotStatus status,
    String? channelId,
    int? liveId,
    String? fallbackTitle,
    String? fallbackThumbnailImageUrl,
    LiveDetail? detail,
    LiveStatus? liveStatus,
    Uri? playbackUri,
    List<int> availableResolutionIndexes,
    int? playbackLatencyIndex,
    int? playbackResolutionIndex,
    PlayerVideoViewType videoViewType,
    LivePlayerFailureReason? failureReason,
  });

  $LiveDetailCopyWith<$Res>? get detail;
  $LiveStatusCopyWith<$Res>? get liveStatus;
}

/// @nodoc
class _$LivePlayerSlotStateCopyWithImpl<$Res>
    implements $LivePlayerSlotStateCopyWith<$Res> {
  _$LivePlayerSlotStateCopyWithImpl(this._self, this._then);

  final LivePlayerSlotState _self;
  final $Res Function(LivePlayerSlotState) _then;

  /// Create a copy of LivePlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slotId = null,
    Object? status = null,
    Object? channelId = freezed,
    Object? liveId = freezed,
    Object? fallbackTitle = freezed,
    Object? fallbackThumbnailImageUrl = freezed,
    Object? detail = freezed,
    Object? liveStatus = freezed,
    Object? playbackUri = freezed,
    Object? availableResolutionIndexes = null,
    Object? playbackLatencyIndex = freezed,
    Object? playbackResolutionIndex = freezed,
    Object? videoViewType = null,
    Object? failureReason = freezed,
  }) {
    return _then(
      _self.copyWith(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as LivePlayerSlotStatus,
        channelId: freezed == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveId: freezed == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int?,
        fallbackTitle: freezed == fallbackTitle
            ? _self.fallbackTitle
            : fallbackTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        fallbackThumbnailImageUrl: freezed == fallbackThumbnailImageUrl
            ? _self.fallbackThumbnailImageUrl
            : fallbackThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        detail: freezed == detail
            ? _self.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as LiveDetail?,
        liveStatus: freezed == liveStatus
            ? _self.liveStatus
            : liveStatus // ignore: cast_nullable_to_non_nullable
                  as LiveStatus?,
        playbackUri: freezed == playbackUri
            ? _self.playbackUri
            : playbackUri // ignore: cast_nullable_to_non_nullable
                  as Uri?,
        availableResolutionIndexes: null == availableResolutionIndexes
            ? _self.availableResolutionIndexes
            : availableResolutionIndexes // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        playbackLatencyIndex: freezed == playbackLatencyIndex
            ? _self.playbackLatencyIndex
            : playbackLatencyIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        playbackResolutionIndex: freezed == playbackResolutionIndex
            ? _self.playbackResolutionIndex
            : playbackResolutionIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        videoViewType: null == videoViewType
            ? _self.videoViewType
            : videoViewType // ignore: cast_nullable_to_non_nullable
                  as PlayerVideoViewType,
        failureReason: freezed == failureReason
            ? _self.failureReason
            : failureReason // ignore: cast_nullable_to_non_nullable
                  as LivePlayerFailureReason?,
      ),
    );
  }

  /// Create a copy of LivePlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
      return null;
    }

    return $LiveDetailCopyWith<$Res>(_self.detail!, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }

  /// Create a copy of LivePlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveStatusCopyWith<$Res>? get liveStatus {
    if (_self.liveStatus == null) {
      return null;
    }

    return $LiveStatusCopyWith<$Res>(_self.liveStatus!, (value) {
      return _then(_self.copyWith(liveStatus: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LivePlayerSlotState].
extension LivePlayerSlotStatePatterns on LivePlayerSlotState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LivePlayerSlotState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LivePlayerSlotState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LivePlayerSlotState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePlayerSlotState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LivePlayerSlotState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePlayerSlotState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String slotId,
      LivePlayerSlotStatus status,
      String? channelId,
      int? liveId,
      String? fallbackTitle,
      String? fallbackThumbnailImageUrl,
      LiveDetail? detail,
      LiveStatus? liveStatus,
      Uri? playbackUri,
      List<int> availableResolutionIndexes,
      int? playbackLatencyIndex,
      int? playbackResolutionIndex,
      PlayerVideoViewType videoViewType,
      LivePlayerFailureReason? failureReason,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LivePlayerSlotState() when $default != null:
        return $default(
          _that.slotId,
          _that.status,
          _that.channelId,
          _that.liveId,
          _that.fallbackTitle,
          _that.fallbackThumbnailImageUrl,
          _that.detail,
          _that.liveStatus,
          _that.playbackUri,
          _that.availableResolutionIndexes,
          _that.playbackLatencyIndex,
          _that.playbackResolutionIndex,
          _that.videoViewType,
          _that.failureReason,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String slotId,
      LivePlayerSlotStatus status,
      String? channelId,
      int? liveId,
      String? fallbackTitle,
      String? fallbackThumbnailImageUrl,
      LiveDetail? detail,
      LiveStatus? liveStatus,
      Uri? playbackUri,
      List<int> availableResolutionIndexes,
      int? playbackLatencyIndex,
      int? playbackResolutionIndex,
      PlayerVideoViewType videoViewType,
      LivePlayerFailureReason? failureReason,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePlayerSlotState():
        return $default(
          _that.slotId,
          _that.status,
          _that.channelId,
          _that.liveId,
          _that.fallbackTitle,
          _that.fallbackThumbnailImageUrl,
          _that.detail,
          _that.liveStatus,
          _that.playbackUri,
          _that.availableResolutionIndexes,
          _that.playbackLatencyIndex,
          _that.playbackResolutionIndex,
          _that.videoViewType,
          _that.failureReason,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String slotId,
      LivePlayerSlotStatus status,
      String? channelId,
      int? liveId,
      String? fallbackTitle,
      String? fallbackThumbnailImageUrl,
      LiveDetail? detail,
      LiveStatus? liveStatus,
      Uri? playbackUri,
      List<int> availableResolutionIndexes,
      int? playbackLatencyIndex,
      int? playbackResolutionIndex,
      PlayerVideoViewType videoViewType,
      LivePlayerFailureReason? failureReason,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePlayerSlotState() when $default != null:
        return $default(
          _that.slotId,
          _that.status,
          _that.channelId,
          _that.liveId,
          _that.fallbackTitle,
          _that.fallbackThumbnailImageUrl,
          _that.detail,
          _that.liveStatus,
          _that.playbackUri,
          _that.availableResolutionIndexes,
          _that.playbackLatencyIndex,
          _that.playbackResolutionIndex,
          _that.videoViewType,
          _that.failureReason,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LivePlayerSlotState extends LivePlayerSlotState {
  const _LivePlayerSlotState({
    required this.slotId,
    this.status = LivePlayerSlotStatus.empty,
    this.channelId,
    this.liveId,
    this.fallbackTitle,
    this.fallbackThumbnailImageUrl,
    this.detail,
    this.liveStatus,
    this.playbackUri,
    final List<int> availableResolutionIndexes =
        LivePlaybackResolutionOptions.allIndexes,
    this.playbackLatencyIndex,
    this.playbackResolutionIndex,
    this.videoViewType = PlayerVideoViewType.textureView,
    this.failureReason,
  }) : _availableResolutionIndexes = availableResolutionIndexes,
       super._();

  @override
  final String slotId;
  @override
  @JsonKey()
  final LivePlayerSlotStatus status;
  @override
  final String? channelId;
  @override
  final int? liveId;
  @override
  final String? fallbackTitle;
  @override
  final String? fallbackThumbnailImageUrl;
  @override
  final LiveDetail? detail;
  @override
  final LiveStatus? liveStatus;
  @override
  final Uri? playbackUri;
  final List<int> _availableResolutionIndexes;
  @override
  @JsonKey()
  List<int> get availableResolutionIndexes {
    if (_availableResolutionIndexes is EqualUnmodifiableListView)
      return _availableResolutionIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableResolutionIndexes);
  }

  @override
  final int? playbackLatencyIndex;
  @override
  final int? playbackResolutionIndex;
  @override
  @JsonKey()
  final PlayerVideoViewType videoViewType;
  @override
  final LivePlayerFailureReason? failureReason;

  /// Create a copy of LivePlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LivePlayerSlotStateCopyWith<_LivePlayerSlotState> get copyWith =>
      __$LivePlayerSlotStateCopyWithImpl<_LivePlayerSlotState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LivePlayerSlotState &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.fallbackTitle, fallbackTitle) ||
                other.fallbackTitle == fallbackTitle) &&
            (identical(
                  other.fallbackThumbnailImageUrl,
                  fallbackThumbnailImageUrl,
                ) ||
                other.fallbackThumbnailImageUrl == fallbackThumbnailImageUrl) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.liveStatus, liveStatus) ||
                other.liveStatus == liveStatus) &&
            (identical(other.playbackUri, playbackUri) ||
                other.playbackUri == playbackUri) &&
            const DeepCollectionEquality().equals(
              other._availableResolutionIndexes,
              _availableResolutionIndexes,
            ) &&
            (identical(other.playbackLatencyIndex, playbackLatencyIndex) ||
                other.playbackLatencyIndex == playbackLatencyIndex) &&
            (identical(
                  other.playbackResolutionIndex,
                  playbackResolutionIndex,
                ) ||
                other.playbackResolutionIndex == playbackResolutionIndex) &&
            (identical(other.videoViewType, videoViewType) ||
                other.videoViewType == videoViewType) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    slotId,
    status,
    channelId,
    liveId,
    fallbackTitle,
    fallbackThumbnailImageUrl,
    detail,
    liveStatus,
    playbackUri,
    const DeepCollectionEquality().hash(_availableResolutionIndexes),
    playbackLatencyIndex,
    playbackResolutionIndex,
    videoViewType,
    failureReason,
  );

  @override
  String toString() {
    return 'LivePlayerSlotState(slotId: $slotId, status: $status, channelId: $channelId, liveId: $liveId, fallbackTitle: $fallbackTitle, fallbackThumbnailImageUrl: $fallbackThumbnailImageUrl, detail: $detail, liveStatus: $liveStatus, playbackUri: $playbackUri, availableResolutionIndexes: $availableResolutionIndexes, playbackLatencyIndex: $playbackLatencyIndex, playbackResolutionIndex: $playbackResolutionIndex, videoViewType: $videoViewType, failureReason: $failureReason)';
  }
}

/// @nodoc
abstract mixin class _$LivePlayerSlotStateCopyWith<$Res>
    implements $LivePlayerSlotStateCopyWith<$Res> {
  factory _$LivePlayerSlotStateCopyWith(
    _LivePlayerSlotState value,
    $Res Function(_LivePlayerSlotState) _then,
  ) = __$LivePlayerSlotStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    String slotId,
    LivePlayerSlotStatus status,
    String? channelId,
    int? liveId,
    String? fallbackTitle,
    String? fallbackThumbnailImageUrl,
    LiveDetail? detail,
    LiveStatus? liveStatus,
    Uri? playbackUri,
    List<int> availableResolutionIndexes,
    int? playbackLatencyIndex,
    int? playbackResolutionIndex,
    PlayerVideoViewType videoViewType,
    LivePlayerFailureReason? failureReason,
  });

  @override
  $LiveDetailCopyWith<$Res>? get detail;
  @override
  $LiveStatusCopyWith<$Res>? get liveStatus;
}

/// @nodoc
class __$LivePlayerSlotStateCopyWithImpl<$Res>
    implements _$LivePlayerSlotStateCopyWith<$Res> {
  __$LivePlayerSlotStateCopyWithImpl(this._self, this._then);

  final _LivePlayerSlotState _self;
  final $Res Function(_LivePlayerSlotState) _then;

  /// Create a copy of LivePlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? slotId = null,
    Object? status = null,
    Object? channelId = freezed,
    Object? liveId = freezed,
    Object? fallbackTitle = freezed,
    Object? fallbackThumbnailImageUrl = freezed,
    Object? detail = freezed,
    Object? liveStatus = freezed,
    Object? playbackUri = freezed,
    Object? availableResolutionIndexes = null,
    Object? playbackLatencyIndex = freezed,
    Object? playbackResolutionIndex = freezed,
    Object? videoViewType = null,
    Object? failureReason = freezed,
  }) {
    return _then(
      _LivePlayerSlotState(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as LivePlayerSlotStatus,
        channelId: freezed == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveId: freezed == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int?,
        fallbackTitle: freezed == fallbackTitle
            ? _self.fallbackTitle
            : fallbackTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        fallbackThumbnailImageUrl: freezed == fallbackThumbnailImageUrl
            ? _self.fallbackThumbnailImageUrl
            : fallbackThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        detail: freezed == detail
            ? _self.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as LiveDetail?,
        liveStatus: freezed == liveStatus
            ? _self.liveStatus
            : liveStatus // ignore: cast_nullable_to_non_nullable
                  as LiveStatus?,
        playbackUri: freezed == playbackUri
            ? _self.playbackUri
            : playbackUri // ignore: cast_nullable_to_non_nullable
                  as Uri?,
        availableResolutionIndexes: null == availableResolutionIndexes
            ? _self._availableResolutionIndexes
            : availableResolutionIndexes // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        playbackLatencyIndex: freezed == playbackLatencyIndex
            ? _self.playbackLatencyIndex
            : playbackLatencyIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        playbackResolutionIndex: freezed == playbackResolutionIndex
            ? _self.playbackResolutionIndex
            : playbackResolutionIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        videoViewType: null == videoViewType
            ? _self.videoViewType
            : videoViewType // ignore: cast_nullable_to_non_nullable
                  as PlayerVideoViewType,
        failureReason: freezed == failureReason
            ? _self.failureReason
            : failureReason // ignore: cast_nullable_to_non_nullable
                  as LivePlayerFailureReason?,
      ),
    );
  }

  /// Create a copy of LivePlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
      return null;
    }

    return $LiveDetailCopyWith<$Res>(_self.detail!, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }

  /// Create a copy of LivePlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveStatusCopyWith<$Res>? get liveStatus {
    if (_self.liveStatus == null) {
      return null;
    }

    return $LiveStatusCopyWith<$Res>(_self.liveStatus!, (value) {
      return _then(_self.copyWith(liveStatus: value));
    });
  }
}

/// @nodoc
mixin _$LivePlayerState {
  LivePlayerViewMode get viewMode;
  LivePlayerMultiviewLayoutMode get multiviewLayoutMode;
  LivePlayerOverlayMode get overlayMode;
  String get activeSlotId;
  String get primarySlotId;
  List<LivePlayerSlotState> get slots;
  Set<String> get audibleSlotIds;
  Map<String, double> get slotVolumeById;
  int get activeSlotHighlightSerial;
  SettingsPreferences get settingsPreferences;
  GroupCollection get groupCollection;
  ChannelMyInfo? get channelMyInfo;
  bool get isSignedIn;
  LivePlayerBrowseSection get browseSection;
  LivePlayerBrowseLoadStatus get browseStatus;
  List<Live> get browseItems;
  LiveCursor? get browseLiveCursor;
  CategoryLiveCursor? get browseCategoryCursor;
  bool get browseHasMore;
  bool get browseLoadingMore;
  LivePlayerBrowseFallbackAction get browseFallbackAction;
  Live? get pendingReplacementLive;
  LivePlayerFeedbackType? get feedbackType;
  int get feedbackSerial;

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LivePlayerStateCopyWith<LivePlayerState> get copyWith =>
      _$LivePlayerStateCopyWithImpl<LivePlayerState>(
        this as LivePlayerState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LivePlayerState &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.multiviewLayoutMode, multiviewLayoutMode) ||
                other.multiviewLayoutMode == multiviewLayoutMode) &&
            (identical(other.overlayMode, overlayMode) ||
                other.overlayMode == overlayMode) &&
            (identical(other.activeSlotId, activeSlotId) ||
                other.activeSlotId == activeSlotId) &&
            (identical(other.primarySlotId, primarySlotId) ||
                other.primarySlotId == primarySlotId) &&
            const DeepCollectionEquality().equals(other.slots, slots) &&
            const DeepCollectionEquality().equals(
              other.audibleSlotIds,
              audibleSlotIds,
            ) &&
            const DeepCollectionEquality().equals(
              other.slotVolumeById,
              slotVolumeById,
            ) &&
            (identical(
                  other.activeSlotHighlightSerial,
                  activeSlotHighlightSerial,
                ) ||
                other.activeSlotHighlightSerial == activeSlotHighlightSerial) &&
            (identical(other.settingsPreferences, settingsPreferences) ||
                other.settingsPreferences == settingsPreferences) &&
            (identical(other.groupCollection, groupCollection) ||
                other.groupCollection == groupCollection) &&
            (identical(other.channelMyInfo, channelMyInfo) ||
                other.channelMyInfo == channelMyInfo) &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.browseSection, browseSection) ||
                other.browseSection == browseSection) &&
            (identical(other.browseStatus, browseStatus) ||
                other.browseStatus == browseStatus) &&
            const DeepCollectionEquality().equals(
              other.browseItems,
              browseItems,
            ) &&
            (identical(other.browseLiveCursor, browseLiveCursor) ||
                other.browseLiveCursor == browseLiveCursor) &&
            (identical(other.browseCategoryCursor, browseCategoryCursor) ||
                other.browseCategoryCursor == browseCategoryCursor) &&
            (identical(other.browseHasMore, browseHasMore) ||
                other.browseHasMore == browseHasMore) &&
            (identical(other.browseLoadingMore, browseLoadingMore) ||
                other.browseLoadingMore == browseLoadingMore) &&
            (identical(other.browseFallbackAction, browseFallbackAction) ||
                other.browseFallbackAction == browseFallbackAction) &&
            (identical(other.pendingReplacementLive, pendingReplacementLive) ||
                other.pendingReplacementLive == pendingReplacementLive) &&
            (identical(other.feedbackType, feedbackType) ||
                other.feedbackType == feedbackType) &&
            (identical(other.feedbackSerial, feedbackSerial) ||
                other.feedbackSerial == feedbackSerial));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    viewMode,
    multiviewLayoutMode,
    overlayMode,
    activeSlotId,
    primarySlotId,
    const DeepCollectionEquality().hash(slots),
    const DeepCollectionEquality().hash(audibleSlotIds),
    const DeepCollectionEquality().hash(slotVolumeById),
    activeSlotHighlightSerial,
    settingsPreferences,
    groupCollection,
    channelMyInfo,
    isSignedIn,
    browseSection,
    browseStatus,
    const DeepCollectionEquality().hash(browseItems),
    browseLiveCursor,
    browseCategoryCursor,
    browseHasMore,
    browseLoadingMore,
    browseFallbackAction,
    pendingReplacementLive,
    feedbackType,
    feedbackSerial,
  ]);

  @override
  String toString() {
    return 'LivePlayerState(viewMode: $viewMode, multiviewLayoutMode: $multiviewLayoutMode, overlayMode: $overlayMode, activeSlotId: $activeSlotId, primarySlotId: $primarySlotId, slots: $slots, audibleSlotIds: $audibleSlotIds, slotVolumeById: $slotVolumeById, activeSlotHighlightSerial: $activeSlotHighlightSerial, settingsPreferences: $settingsPreferences, groupCollection: $groupCollection, channelMyInfo: $channelMyInfo, isSignedIn: $isSignedIn, browseSection: $browseSection, browseStatus: $browseStatus, browseItems: $browseItems, browseLiveCursor: $browseLiveCursor, browseCategoryCursor: $browseCategoryCursor, browseHasMore: $browseHasMore, browseLoadingMore: $browseLoadingMore, browseFallbackAction: $browseFallbackAction, pendingReplacementLive: $pendingReplacementLive, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class $LivePlayerStateCopyWith<$Res> {
  factory $LivePlayerStateCopyWith(
    LivePlayerState value,
    $Res Function(LivePlayerState) _then,
  ) = _$LivePlayerStateCopyWithImpl;
  @useResult
  $Res call({
    LivePlayerViewMode viewMode,
    LivePlayerMultiviewLayoutMode multiviewLayoutMode,
    LivePlayerOverlayMode overlayMode,
    String activeSlotId,
    String primarySlotId,
    List<LivePlayerSlotState> slots,
    Set<String> audibleSlotIds,
    Map<String, double> slotVolumeById,
    int activeSlotHighlightSerial,
    SettingsPreferences settingsPreferences,
    GroupCollection groupCollection,
    ChannelMyInfo? channelMyInfo,
    bool isSignedIn,
    LivePlayerBrowseSection browseSection,
    LivePlayerBrowseLoadStatus browseStatus,
    List<Live> browseItems,
    LiveCursor? browseLiveCursor,
    CategoryLiveCursor? browseCategoryCursor,
    bool browseHasMore,
    bool browseLoadingMore,
    LivePlayerBrowseFallbackAction browseFallbackAction,
    Live? pendingReplacementLive,
    LivePlayerFeedbackType? feedbackType,
    int feedbackSerial,
  });

  $SettingsPreferencesCopyWith<$Res> get settingsPreferences;
  $GroupCollectionCopyWith<$Res> get groupCollection;
  $ChannelMyInfoCopyWith<$Res>? get channelMyInfo;
  $LiveCursorCopyWith<$Res>? get browseLiveCursor;
  $CategoryLiveCursorCopyWith<$Res>? get browseCategoryCursor;
  $LiveCopyWith<$Res>? get pendingReplacementLive;
}

/// @nodoc
class _$LivePlayerStateCopyWithImpl<$Res>
    implements $LivePlayerStateCopyWith<$Res> {
  _$LivePlayerStateCopyWithImpl(this._self, this._then);

  final LivePlayerState _self;
  final $Res Function(LivePlayerState) _then;

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewMode = null,
    Object? multiviewLayoutMode = null,
    Object? overlayMode = null,
    Object? activeSlotId = null,
    Object? primarySlotId = null,
    Object? slots = null,
    Object? audibleSlotIds = null,
    Object? slotVolumeById = null,
    Object? activeSlotHighlightSerial = null,
    Object? settingsPreferences = null,
    Object? groupCollection = null,
    Object? channelMyInfo = freezed,
    Object? isSignedIn = null,
    Object? browseSection = null,
    Object? browseStatus = null,
    Object? browseItems = null,
    Object? browseLiveCursor = freezed,
    Object? browseCategoryCursor = freezed,
    Object? browseHasMore = null,
    Object? browseLoadingMore = null,
    Object? browseFallbackAction = null,
    Object? pendingReplacementLive = freezed,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _self.copyWith(
        viewMode: null == viewMode
            ? _self.viewMode
            : viewMode // ignore: cast_nullable_to_non_nullable
                  as LivePlayerViewMode,
        multiviewLayoutMode: null == multiviewLayoutMode
            ? _self.multiviewLayoutMode
            : multiviewLayoutMode // ignore: cast_nullable_to_non_nullable
                  as LivePlayerMultiviewLayoutMode,
        overlayMode: null == overlayMode
            ? _self.overlayMode
            : overlayMode // ignore: cast_nullable_to_non_nullable
                  as LivePlayerOverlayMode,
        activeSlotId: null == activeSlotId
            ? _self.activeSlotId
            : activeSlotId // ignore: cast_nullable_to_non_nullable
                  as String,
        primarySlotId: null == primarySlotId
            ? _self.primarySlotId
            : primarySlotId // ignore: cast_nullable_to_non_nullable
                  as String,
        slots: null == slots
            ? _self.slots
            : slots // ignore: cast_nullable_to_non_nullable
                  as List<LivePlayerSlotState>,
        audibleSlotIds: null == audibleSlotIds
            ? _self.audibleSlotIds
            : audibleSlotIds // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        slotVolumeById: null == slotVolumeById
            ? _self.slotVolumeById
            : slotVolumeById // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        activeSlotHighlightSerial: null == activeSlotHighlightSerial
            ? _self.activeSlotHighlightSerial
            : activeSlotHighlightSerial // ignore: cast_nullable_to_non_nullable
                  as int,
        settingsPreferences: null == settingsPreferences
            ? _self.settingsPreferences
            : settingsPreferences // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferences,
        groupCollection: null == groupCollection
            ? _self.groupCollection
            : groupCollection // ignore: cast_nullable_to_non_nullable
                  as GroupCollection,
        channelMyInfo: freezed == channelMyInfo
            ? _self.channelMyInfo
            : channelMyInfo // ignore: cast_nullable_to_non_nullable
                  as ChannelMyInfo?,
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        browseSection: null == browseSection
            ? _self.browseSection
            : browseSection // ignore: cast_nullable_to_non_nullable
                  as LivePlayerBrowseSection,
        browseStatus: null == browseStatus
            ? _self.browseStatus
            : browseStatus // ignore: cast_nullable_to_non_nullable
                  as LivePlayerBrowseLoadStatus,
        browseItems: null == browseItems
            ? _self.browseItems
            : browseItems // ignore: cast_nullable_to_non_nullable
                  as List<Live>,
        browseLiveCursor: freezed == browseLiveCursor
            ? _self.browseLiveCursor
            : browseLiveCursor // ignore: cast_nullable_to_non_nullable
                  as LiveCursor?,
        browseCategoryCursor: freezed == browseCategoryCursor
            ? _self.browseCategoryCursor
            : browseCategoryCursor // ignore: cast_nullable_to_non_nullable
                  as CategoryLiveCursor?,
        browseHasMore: null == browseHasMore
            ? _self.browseHasMore
            : browseHasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        browseLoadingMore: null == browseLoadingMore
            ? _self.browseLoadingMore
            : browseLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        browseFallbackAction: null == browseFallbackAction
            ? _self.browseFallbackAction
            : browseFallbackAction // ignore: cast_nullable_to_non_nullable
                  as LivePlayerBrowseFallbackAction,
        pendingReplacementLive: freezed == pendingReplacementLive
            ? _self.pendingReplacementLive
            : pendingReplacementLive // ignore: cast_nullable_to_non_nullable
                  as Live?,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as LivePlayerFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingsPreferencesCopyWith<$Res> get settingsPreferences {
    return $SettingsPreferencesCopyWith<$Res>(_self.settingsPreferences, (
      value,
    ) {
      return _then(_self.copyWith(settingsPreferences: value));
    });
  }

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupCollectionCopyWith<$Res> get groupCollection {
    return $GroupCollectionCopyWith<$Res>(_self.groupCollection, (value) {
      return _then(_self.copyWith(groupCollection: value));
    });
  }

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelMyInfoCopyWith<$Res>? get channelMyInfo {
    if (_self.channelMyInfo == null) {
      return null;
    }

    return $ChannelMyInfoCopyWith<$Res>(_self.channelMyInfo!, (value) {
      return _then(_self.copyWith(channelMyInfo: value));
    });
  }

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveCursorCopyWith<$Res>? get browseLiveCursor {
    if (_self.browseLiveCursor == null) {
      return null;
    }

    return $LiveCursorCopyWith<$Res>(_self.browseLiveCursor!, (value) {
      return _then(_self.copyWith(browseLiveCursor: value));
    });
  }

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryLiveCursorCopyWith<$Res>? get browseCategoryCursor {
    if (_self.browseCategoryCursor == null) {
      return null;
    }

    return $CategoryLiveCursorCopyWith<$Res>(_self.browseCategoryCursor!, (
      value,
    ) {
      return _then(_self.copyWith(browseCategoryCursor: value));
    });
  }

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveCopyWith<$Res>? get pendingReplacementLive {
    if (_self.pendingReplacementLive == null) {
      return null;
    }

    return $LiveCopyWith<$Res>(_self.pendingReplacementLive!, (value) {
      return _then(_self.copyWith(pendingReplacementLive: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LivePlayerState].
extension LivePlayerStatePatterns on LivePlayerState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LivePlayerState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LivePlayerState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LivePlayerState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePlayerState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LivePlayerState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePlayerState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      LivePlayerViewMode viewMode,
      LivePlayerMultiviewLayoutMode multiviewLayoutMode,
      LivePlayerOverlayMode overlayMode,
      String activeSlotId,
      String primarySlotId,
      List<LivePlayerSlotState> slots,
      Set<String> audibleSlotIds,
      Map<String, double> slotVolumeById,
      int activeSlotHighlightSerial,
      SettingsPreferences settingsPreferences,
      GroupCollection groupCollection,
      ChannelMyInfo? channelMyInfo,
      bool isSignedIn,
      LivePlayerBrowseSection browseSection,
      LivePlayerBrowseLoadStatus browseStatus,
      List<Live> browseItems,
      LiveCursor? browseLiveCursor,
      CategoryLiveCursor? browseCategoryCursor,
      bool browseHasMore,
      bool browseLoadingMore,
      LivePlayerBrowseFallbackAction browseFallbackAction,
      Live? pendingReplacementLive,
      LivePlayerFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LivePlayerState() when $default != null:
        return $default(
          _that.viewMode,
          _that.multiviewLayoutMode,
          _that.overlayMode,
          _that.activeSlotId,
          _that.primarySlotId,
          _that.slots,
          _that.audibleSlotIds,
          _that.slotVolumeById,
          _that.activeSlotHighlightSerial,
          _that.settingsPreferences,
          _that.groupCollection,
          _that.channelMyInfo,
          _that.isSignedIn,
          _that.browseSection,
          _that.browseStatus,
          _that.browseItems,
          _that.browseLiveCursor,
          _that.browseCategoryCursor,
          _that.browseHasMore,
          _that.browseLoadingMore,
          _that.browseFallbackAction,
          _that.pendingReplacementLive,
          _that.feedbackType,
          _that.feedbackSerial,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      LivePlayerViewMode viewMode,
      LivePlayerMultiviewLayoutMode multiviewLayoutMode,
      LivePlayerOverlayMode overlayMode,
      String activeSlotId,
      String primarySlotId,
      List<LivePlayerSlotState> slots,
      Set<String> audibleSlotIds,
      Map<String, double> slotVolumeById,
      int activeSlotHighlightSerial,
      SettingsPreferences settingsPreferences,
      GroupCollection groupCollection,
      ChannelMyInfo? channelMyInfo,
      bool isSignedIn,
      LivePlayerBrowseSection browseSection,
      LivePlayerBrowseLoadStatus browseStatus,
      List<Live> browseItems,
      LiveCursor? browseLiveCursor,
      CategoryLiveCursor? browseCategoryCursor,
      bool browseHasMore,
      bool browseLoadingMore,
      LivePlayerBrowseFallbackAction browseFallbackAction,
      Live? pendingReplacementLive,
      LivePlayerFeedbackType? feedbackType,
      int feedbackSerial,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePlayerState():
        return $default(
          _that.viewMode,
          _that.multiviewLayoutMode,
          _that.overlayMode,
          _that.activeSlotId,
          _that.primarySlotId,
          _that.slots,
          _that.audibleSlotIds,
          _that.slotVolumeById,
          _that.activeSlotHighlightSerial,
          _that.settingsPreferences,
          _that.groupCollection,
          _that.channelMyInfo,
          _that.isSignedIn,
          _that.browseSection,
          _that.browseStatus,
          _that.browseItems,
          _that.browseLiveCursor,
          _that.browseCategoryCursor,
          _that.browseHasMore,
          _that.browseLoadingMore,
          _that.browseFallbackAction,
          _that.pendingReplacementLive,
          _that.feedbackType,
          _that.feedbackSerial,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      LivePlayerViewMode viewMode,
      LivePlayerMultiviewLayoutMode multiviewLayoutMode,
      LivePlayerOverlayMode overlayMode,
      String activeSlotId,
      String primarySlotId,
      List<LivePlayerSlotState> slots,
      Set<String> audibleSlotIds,
      Map<String, double> slotVolumeById,
      int activeSlotHighlightSerial,
      SettingsPreferences settingsPreferences,
      GroupCollection groupCollection,
      ChannelMyInfo? channelMyInfo,
      bool isSignedIn,
      LivePlayerBrowseSection browseSection,
      LivePlayerBrowseLoadStatus browseStatus,
      List<Live> browseItems,
      LiveCursor? browseLiveCursor,
      CategoryLiveCursor? browseCategoryCursor,
      bool browseHasMore,
      bool browseLoadingMore,
      LivePlayerBrowseFallbackAction browseFallbackAction,
      Live? pendingReplacementLive,
      LivePlayerFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePlayerState() when $default != null:
        return $default(
          _that.viewMode,
          _that.multiviewLayoutMode,
          _that.overlayMode,
          _that.activeSlotId,
          _that.primarySlotId,
          _that.slots,
          _that.audibleSlotIds,
          _that.slotVolumeById,
          _that.activeSlotHighlightSerial,
          _that.settingsPreferences,
          _that.groupCollection,
          _that.channelMyInfo,
          _that.isSignedIn,
          _that.browseSection,
          _that.browseStatus,
          _that.browseItems,
          _that.browseLiveCursor,
          _that.browseCategoryCursor,
          _that.browseHasMore,
          _that.browseLoadingMore,
          _that.browseFallbackAction,
          _that.pendingReplacementLive,
          _that.feedbackType,
          _that.feedbackSerial,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LivePlayerState extends LivePlayerState {
  const _LivePlayerState({
    required this.viewMode,
    this.multiviewLayoutMode = LivePlayerMultiviewLayoutMode.pbp,
    this.overlayMode = LivePlayerOverlayMode.none,
    required this.activeSlotId,
    required this.primarySlotId,
    required final List<LivePlayerSlotState> slots,
    final Set<String> audibleSlotIds = const <String>{},
    final Map<String, double> slotVolumeById = const <String, double>{},
    this.activeSlotHighlightSerial = 0,
    this.settingsPreferences = defaultSettingsPreferences,
    this.groupCollection = defaultGroupCollection,
    this.channelMyInfo,
    this.isSignedIn = false,
    this.browseSection = LivePlayerBrowseSection.popular,
    this.browseStatus = LivePlayerBrowseLoadStatus.initial,
    final List<Live> browseItems = const <Live>[],
    this.browseLiveCursor,
    this.browseCategoryCursor,
    this.browseHasMore = false,
    this.browseLoadingMore = false,
    this.browseFallbackAction = LivePlayerBrowseFallbackAction.none,
    this.pendingReplacementLive,
    this.feedbackType,
    this.feedbackSerial = 0,
  }) : _slots = slots,
       _audibleSlotIds = audibleSlotIds,
       _slotVolumeById = slotVolumeById,
       _browseItems = browseItems,
       super._();

  @override
  final LivePlayerViewMode viewMode;
  @override
  @JsonKey()
  final LivePlayerMultiviewLayoutMode multiviewLayoutMode;
  @override
  @JsonKey()
  final LivePlayerOverlayMode overlayMode;
  @override
  final String activeSlotId;
  @override
  final String primarySlotId;
  final List<LivePlayerSlotState> _slots;
  @override
  List<LivePlayerSlotState> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  final Set<String> _audibleSlotIds;
  @override
  @JsonKey()
  Set<String> get audibleSlotIds {
    if (_audibleSlotIds is EqualUnmodifiableSetView) return _audibleSlotIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_audibleSlotIds);
  }

  final Map<String, double> _slotVolumeById;
  @override
  @JsonKey()
  Map<String, double> get slotVolumeById {
    if (_slotVolumeById is EqualUnmodifiableMapView) return _slotVolumeById;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_slotVolumeById);
  }

  @override
  @JsonKey()
  final int activeSlotHighlightSerial;
  @override
  @JsonKey()
  final SettingsPreferences settingsPreferences;
  @override
  @JsonKey()
  final GroupCollection groupCollection;
  @override
  final ChannelMyInfo? channelMyInfo;
  @override
  @JsonKey()
  final bool isSignedIn;
  @override
  @JsonKey()
  final LivePlayerBrowseSection browseSection;
  @override
  @JsonKey()
  final LivePlayerBrowseLoadStatus browseStatus;
  final List<Live> _browseItems;
  @override
  @JsonKey()
  List<Live> get browseItems {
    if (_browseItems is EqualUnmodifiableListView) return _browseItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_browseItems);
  }

  @override
  final LiveCursor? browseLiveCursor;
  @override
  final CategoryLiveCursor? browseCategoryCursor;
  @override
  @JsonKey()
  final bool browseHasMore;
  @override
  @JsonKey()
  final bool browseLoadingMore;
  @override
  @JsonKey()
  final LivePlayerBrowseFallbackAction browseFallbackAction;
  @override
  final Live? pendingReplacementLive;
  @override
  final LivePlayerFeedbackType? feedbackType;
  @override
  @JsonKey()
  final int feedbackSerial;

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LivePlayerStateCopyWith<_LivePlayerState> get copyWith =>
      __$LivePlayerStateCopyWithImpl<_LivePlayerState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LivePlayerState &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.multiviewLayoutMode, multiviewLayoutMode) ||
                other.multiviewLayoutMode == multiviewLayoutMode) &&
            (identical(other.overlayMode, overlayMode) ||
                other.overlayMode == overlayMode) &&
            (identical(other.activeSlotId, activeSlotId) ||
                other.activeSlotId == activeSlotId) &&
            (identical(other.primarySlotId, primarySlotId) ||
                other.primarySlotId == primarySlotId) &&
            const DeepCollectionEquality().equals(other._slots, _slots) &&
            const DeepCollectionEquality().equals(
              other._audibleSlotIds,
              _audibleSlotIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._slotVolumeById,
              _slotVolumeById,
            ) &&
            (identical(
                  other.activeSlotHighlightSerial,
                  activeSlotHighlightSerial,
                ) ||
                other.activeSlotHighlightSerial == activeSlotHighlightSerial) &&
            (identical(other.settingsPreferences, settingsPreferences) ||
                other.settingsPreferences == settingsPreferences) &&
            (identical(other.groupCollection, groupCollection) ||
                other.groupCollection == groupCollection) &&
            (identical(other.channelMyInfo, channelMyInfo) ||
                other.channelMyInfo == channelMyInfo) &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.browseSection, browseSection) ||
                other.browseSection == browseSection) &&
            (identical(other.browseStatus, browseStatus) ||
                other.browseStatus == browseStatus) &&
            const DeepCollectionEquality().equals(
              other._browseItems,
              _browseItems,
            ) &&
            (identical(other.browseLiveCursor, browseLiveCursor) ||
                other.browseLiveCursor == browseLiveCursor) &&
            (identical(other.browseCategoryCursor, browseCategoryCursor) ||
                other.browseCategoryCursor == browseCategoryCursor) &&
            (identical(other.browseHasMore, browseHasMore) ||
                other.browseHasMore == browseHasMore) &&
            (identical(other.browseLoadingMore, browseLoadingMore) ||
                other.browseLoadingMore == browseLoadingMore) &&
            (identical(other.browseFallbackAction, browseFallbackAction) ||
                other.browseFallbackAction == browseFallbackAction) &&
            (identical(other.pendingReplacementLive, pendingReplacementLive) ||
                other.pendingReplacementLive == pendingReplacementLive) &&
            (identical(other.feedbackType, feedbackType) ||
                other.feedbackType == feedbackType) &&
            (identical(other.feedbackSerial, feedbackSerial) ||
                other.feedbackSerial == feedbackSerial));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    viewMode,
    multiviewLayoutMode,
    overlayMode,
    activeSlotId,
    primarySlotId,
    const DeepCollectionEquality().hash(_slots),
    const DeepCollectionEquality().hash(_audibleSlotIds),
    const DeepCollectionEquality().hash(_slotVolumeById),
    activeSlotHighlightSerial,
    settingsPreferences,
    groupCollection,
    channelMyInfo,
    isSignedIn,
    browseSection,
    browseStatus,
    const DeepCollectionEquality().hash(_browseItems),
    browseLiveCursor,
    browseCategoryCursor,
    browseHasMore,
    browseLoadingMore,
    browseFallbackAction,
    pendingReplacementLive,
    feedbackType,
    feedbackSerial,
  ]);

  @override
  String toString() {
    return 'LivePlayerState(viewMode: $viewMode, multiviewLayoutMode: $multiviewLayoutMode, overlayMode: $overlayMode, activeSlotId: $activeSlotId, primarySlotId: $primarySlotId, slots: $slots, audibleSlotIds: $audibleSlotIds, slotVolumeById: $slotVolumeById, activeSlotHighlightSerial: $activeSlotHighlightSerial, settingsPreferences: $settingsPreferences, groupCollection: $groupCollection, channelMyInfo: $channelMyInfo, isSignedIn: $isSignedIn, browseSection: $browseSection, browseStatus: $browseStatus, browseItems: $browseItems, browseLiveCursor: $browseLiveCursor, browseCategoryCursor: $browseCategoryCursor, browseHasMore: $browseHasMore, browseLoadingMore: $browseLoadingMore, browseFallbackAction: $browseFallbackAction, pendingReplacementLive: $pendingReplacementLive, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class _$LivePlayerStateCopyWith<$Res>
    implements $LivePlayerStateCopyWith<$Res> {
  factory _$LivePlayerStateCopyWith(
    _LivePlayerState value,
    $Res Function(_LivePlayerState) _then,
  ) = __$LivePlayerStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    LivePlayerViewMode viewMode,
    LivePlayerMultiviewLayoutMode multiviewLayoutMode,
    LivePlayerOverlayMode overlayMode,
    String activeSlotId,
    String primarySlotId,
    List<LivePlayerSlotState> slots,
    Set<String> audibleSlotIds,
    Map<String, double> slotVolumeById,
    int activeSlotHighlightSerial,
    SettingsPreferences settingsPreferences,
    GroupCollection groupCollection,
    ChannelMyInfo? channelMyInfo,
    bool isSignedIn,
    LivePlayerBrowseSection browseSection,
    LivePlayerBrowseLoadStatus browseStatus,
    List<Live> browseItems,
    LiveCursor? browseLiveCursor,
    CategoryLiveCursor? browseCategoryCursor,
    bool browseHasMore,
    bool browseLoadingMore,
    LivePlayerBrowseFallbackAction browseFallbackAction,
    Live? pendingReplacementLive,
    LivePlayerFeedbackType? feedbackType,
    int feedbackSerial,
  });

  @override
  $SettingsPreferencesCopyWith<$Res> get settingsPreferences;
  @override
  $GroupCollectionCopyWith<$Res> get groupCollection;
  @override
  $ChannelMyInfoCopyWith<$Res>? get channelMyInfo;
  @override
  $LiveCursorCopyWith<$Res>? get browseLiveCursor;
  @override
  $CategoryLiveCursorCopyWith<$Res>? get browseCategoryCursor;
  @override
  $LiveCopyWith<$Res>? get pendingReplacementLive;
}

/// @nodoc
class __$LivePlayerStateCopyWithImpl<$Res>
    implements _$LivePlayerStateCopyWith<$Res> {
  __$LivePlayerStateCopyWithImpl(this._self, this._then);

  final _LivePlayerState _self;
  final $Res Function(_LivePlayerState) _then;

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? viewMode = null,
    Object? multiviewLayoutMode = null,
    Object? overlayMode = null,
    Object? activeSlotId = null,
    Object? primarySlotId = null,
    Object? slots = null,
    Object? audibleSlotIds = null,
    Object? slotVolumeById = null,
    Object? activeSlotHighlightSerial = null,
    Object? settingsPreferences = null,
    Object? groupCollection = null,
    Object? channelMyInfo = freezed,
    Object? isSignedIn = null,
    Object? browseSection = null,
    Object? browseStatus = null,
    Object? browseItems = null,
    Object? browseLiveCursor = freezed,
    Object? browseCategoryCursor = freezed,
    Object? browseHasMore = null,
    Object? browseLoadingMore = null,
    Object? browseFallbackAction = null,
    Object? pendingReplacementLive = freezed,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _LivePlayerState(
        viewMode: null == viewMode
            ? _self.viewMode
            : viewMode // ignore: cast_nullable_to_non_nullable
                  as LivePlayerViewMode,
        multiviewLayoutMode: null == multiviewLayoutMode
            ? _self.multiviewLayoutMode
            : multiviewLayoutMode // ignore: cast_nullable_to_non_nullable
                  as LivePlayerMultiviewLayoutMode,
        overlayMode: null == overlayMode
            ? _self.overlayMode
            : overlayMode // ignore: cast_nullable_to_non_nullable
                  as LivePlayerOverlayMode,
        activeSlotId: null == activeSlotId
            ? _self.activeSlotId
            : activeSlotId // ignore: cast_nullable_to_non_nullable
                  as String,
        primarySlotId: null == primarySlotId
            ? _self.primarySlotId
            : primarySlotId // ignore: cast_nullable_to_non_nullable
                  as String,
        slots: null == slots
            ? _self._slots
            : slots // ignore: cast_nullable_to_non_nullable
                  as List<LivePlayerSlotState>,
        audibleSlotIds: null == audibleSlotIds
            ? _self._audibleSlotIds
            : audibleSlotIds // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        slotVolumeById: null == slotVolumeById
            ? _self._slotVolumeById
            : slotVolumeById // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        activeSlotHighlightSerial: null == activeSlotHighlightSerial
            ? _self.activeSlotHighlightSerial
            : activeSlotHighlightSerial // ignore: cast_nullable_to_non_nullable
                  as int,
        settingsPreferences: null == settingsPreferences
            ? _self.settingsPreferences
            : settingsPreferences // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferences,
        groupCollection: null == groupCollection
            ? _self.groupCollection
            : groupCollection // ignore: cast_nullable_to_non_nullable
                  as GroupCollection,
        channelMyInfo: freezed == channelMyInfo
            ? _self.channelMyInfo
            : channelMyInfo // ignore: cast_nullable_to_non_nullable
                  as ChannelMyInfo?,
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        browseSection: null == browseSection
            ? _self.browseSection
            : browseSection // ignore: cast_nullable_to_non_nullable
                  as LivePlayerBrowseSection,
        browseStatus: null == browseStatus
            ? _self.browseStatus
            : browseStatus // ignore: cast_nullable_to_non_nullable
                  as LivePlayerBrowseLoadStatus,
        browseItems: null == browseItems
            ? _self._browseItems
            : browseItems // ignore: cast_nullable_to_non_nullable
                  as List<Live>,
        browseLiveCursor: freezed == browseLiveCursor
            ? _self.browseLiveCursor
            : browseLiveCursor // ignore: cast_nullable_to_non_nullable
                  as LiveCursor?,
        browseCategoryCursor: freezed == browseCategoryCursor
            ? _self.browseCategoryCursor
            : browseCategoryCursor // ignore: cast_nullable_to_non_nullable
                  as CategoryLiveCursor?,
        browseHasMore: null == browseHasMore
            ? _self.browseHasMore
            : browseHasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        browseLoadingMore: null == browseLoadingMore
            ? _self.browseLoadingMore
            : browseLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        browseFallbackAction: null == browseFallbackAction
            ? _self.browseFallbackAction
            : browseFallbackAction // ignore: cast_nullable_to_non_nullable
                  as LivePlayerBrowseFallbackAction,
        pendingReplacementLive: freezed == pendingReplacementLive
            ? _self.pendingReplacementLive
            : pendingReplacementLive // ignore: cast_nullable_to_non_nullable
                  as Live?,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as LivePlayerFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingsPreferencesCopyWith<$Res> get settingsPreferences {
    return $SettingsPreferencesCopyWith<$Res>(_self.settingsPreferences, (
      value,
    ) {
      return _then(_self.copyWith(settingsPreferences: value));
    });
  }

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupCollectionCopyWith<$Res> get groupCollection {
    return $GroupCollectionCopyWith<$Res>(_self.groupCollection, (value) {
      return _then(_self.copyWith(groupCollection: value));
    });
  }

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelMyInfoCopyWith<$Res>? get channelMyInfo {
    if (_self.channelMyInfo == null) {
      return null;
    }

    return $ChannelMyInfoCopyWith<$Res>(_self.channelMyInfo!, (value) {
      return _then(_self.copyWith(channelMyInfo: value));
    });
  }

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveCursorCopyWith<$Res>? get browseLiveCursor {
    if (_self.browseLiveCursor == null) {
      return null;
    }

    return $LiveCursorCopyWith<$Res>(_self.browseLiveCursor!, (value) {
      return _then(_self.copyWith(browseLiveCursor: value));
    });
  }

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryLiveCursorCopyWith<$Res>? get browseCategoryCursor {
    if (_self.browseCategoryCursor == null) {
      return null;
    }

    return $CategoryLiveCursorCopyWith<$Res>(_self.browseCategoryCursor!, (
      value,
    ) {
      return _then(_self.copyWith(browseCategoryCursor: value));
    });
  }

  /// Create a copy of LivePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveCopyWith<$Res>? get pendingReplacementLive {
    if (_self.pendingReplacementLive == null) {
      return null;
    }

    return $LiveCopyWith<$Res>(_self.pendingReplacementLive!, (value) {
      return _then(_self.copyWith(pendingReplacementLive: value));
    });
  }
}
