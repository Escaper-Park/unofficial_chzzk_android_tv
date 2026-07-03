part of 'live_player_view.dart';

bool _livePlayerPlaybackBuildWhen(
  LivePlayerState previous,
  LivePlayerState current,
) {
  if (previous.viewMode != current.viewMode ||
      previous.multiviewLayoutMode != current.multiviewLayoutMode ||
      previous.activeSlotId != current.activeSlotId ||
      previous.primarySlotId != current.primarySlotId ||
      previous.audibleSlotIds != current.audibleSlotIds ||
      previous.slotVolumeById != current.slotVolumeById ||
      previous.activeSlotHighlightSerial != current.activeSlotHighlightSerial) {
    return true;
  }

  if (_livePlayerPlaybackPreferencesChanged(
    previous.settingsPreferences,
    current.settingsPreferences,
  )) {
    return true;
  }

  if (!_sameActiveSlotPlaybackInput(previous.activeSlot, current.activeSlot)) {
    return true;
  }

  if (_hasPlayableLiveSlot(previous) != _hasPlayableLiveSlot(current)) {
    return true;
  }

  return !_sameSlotIdOrder(previous.slots, current.slots);
}

bool _livePlayerPlaybackPreferencesChanged(
  SettingsPreferences previous,
  SettingsPreferences current,
) {
  final previousLive = previous.liveSettings;
  final currentLive = current.liveSettings;

  return previous.chatSettings != current.chatSettings ||
      previousLive.chatWindowIndex != currentLive.chatWindowIndex ||
      previousLive.multiviewChatWindowIndex !=
          currentLive.multiviewChatWindowIndex ||
      previousLive.multiviewChatPositionX !=
          currentLive.multiviewChatPositionX ||
      previousLive.multiviewChatPositionY !=
          currentLive.multiviewChatPositionY ||
      previousLive.multiviewPipLayoutIndex !=
          currentLive.multiviewPipLayoutIndex ||
      previousLive.multiviewPipPositionX != currentLive.multiviewPipPositionX ||
      previousLive.multiviewPipPositionY != currentLive.multiviewPipPositionY ||
      previousLive.multiviewPipSize != currentLive.multiviewPipSize;
}

bool _sameActiveSlotPlaybackInput(
  LivePlayerSlotState previous,
  LivePlayerSlotState current,
) {
  return previous.slotId == current.slotId &&
      previous.status == current.status &&
      previous.channelId == current.channelId &&
      previous.chatChannelId == current.chatChannelId &&
      previous.playbackUri == current.playbackUri;
}

bool _livePlayerOverlayBuildWhen(
  LivePlayerState previous,
  LivePlayerState current,
) {
  if (previous.overlayMode != current.overlayMode) {
    return true;
  }

  if (current.overlayMode == LivePlayerOverlayMode.none) {
    return false;
  }

  return previous.viewMode != current.viewMode ||
      previous.multiviewLayoutMode != current.multiviewLayoutMode ||
      previous.activeSlotId != current.activeSlotId ||
      previous.primarySlotId != current.primarySlotId ||
      previous.slots != current.slots ||
      previous.audibleSlotIds != current.audibleSlotIds ||
      previous.slotVolumeById != current.slotVolumeById ||
      previous.activeSlotHighlightSerial != current.activeSlotHighlightSerial ||
      previous.settingsPreferences != current.settingsPreferences ||
      previous.groupCollection != current.groupCollection ||
      previous.channelMyInfo != current.channelMyInfo ||
      previous.isSignedIn != current.isSignedIn ||
      previous.browseSection != current.browseSection ||
      previous.browseStatus != current.browseStatus ||
      previous.browseItems != current.browseItems ||
      previous.browseLiveCursor != current.browseLiveCursor ||
      previous.browseCategoryCursor != current.browseCategoryCursor ||
      previous.browseHasMore != current.browseHasMore ||
      previous.browseLoadingMore != current.browseLoadingMore ||
      previous.browseFallbackAction != current.browseFallbackAction ||
      previous.pendingReplacementLive != current.pendingReplacementLive;
}

bool _sameSlotIdOrder(
  List<LivePlayerSlotState> previous,
  List<LivePlayerSlotState> current,
) {
  if (previous.length != current.length) {
    return false;
  }

  for (var index = 0; index < previous.length; index += 1) {
    if (previous[index].slotId != current[index].slotId) {
      return false;
    }
  }

  return true;
}
