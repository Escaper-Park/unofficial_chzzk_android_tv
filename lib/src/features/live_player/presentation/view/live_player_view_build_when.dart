part of 'live_player_view.dart';

bool _livePlayerPlaybackBuildWhen(
  LivePlayerState previous,
  LivePlayerState current,
) {
  if (previous.viewMode != current.viewMode ||
      previous.multiviewLayoutMode != current.multiviewLayoutMode ||
      previous.activeSlotId != current.activeSlotId ||
      previous.primarySlotId != current.primarySlotId ||
      !setEquals(previous.audibleSlotIds, current.audibleSlotIds) ||
      !mapEquals(previous.slotVolumeById, current.slotVolumeById) ||
      previous.activeSlotHighlightSerial != current.activeSlotHighlightSerial) {
    return true;
  }

  if (_livePlayerPlaybackPreferencesChanged(
    previous.settingsPreferences,
    current.settingsPreferences,
  )) {
    return true;
  }

  if (_livePlayerHasChatLayer(previous) != _livePlayerHasChatLayer(current)) {
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
      previous.playbackUri == current.playbackUri &&
      previous.expectedVideoWidth == current.expectedVideoWidth &&
      previous.expectedVideoHeight == current.expectedVideoHeight;
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

  return switch (current.overlayMode) {
    LivePlayerOverlayMode.controls => _livePlayerControlsOverlayBuildWhen(
      previous,
      current,
    ),
    LivePlayerOverlayMode.browse => _livePlayerBrowseOverlayBuildWhen(
      previous,
      current,
    ),
    LivePlayerOverlayMode.none => false,
  };
}

bool _livePlayerControlsOverlayBuildWhen(
  LivePlayerState previous,
  LivePlayerState current,
) {
  return previous.viewMode != current.viewMode ||
      previous.multiviewLayoutMode != current.multiviewLayoutMode ||
      previous.activeSlotId != current.activeSlotId ||
      previous.primarySlotId != current.primarySlotId ||
      !_sameControlsOverlaySlots(previous.slots, current.slots) ||
      !setEquals(previous.audibleSlotIds, current.audibleSlotIds) ||
      !mapEquals(previous.slotVolumeById, current.slotVolumeById) ||
      previous.settingsPreferences != current.settingsPreferences ||
      previous.groupCollection != current.groupCollection ||
      previous.channelMyInfo != current.channelMyInfo ||
      previous.isSignedIn != current.isSignedIn;
}

bool _livePlayerBrowseOverlayBuildWhen(
  LivePlayerState previous,
  LivePlayerState current,
) {
  if (previous.browseSection != current.browseSection ||
      previous.browseStatus != current.browseStatus ||
      previous.browseItems != current.browseItems ||
      previous.browseLiveCursor != current.browseLiveCursor ||
      previous.browseCategoryCursor != current.browseCategoryCursor ||
      previous.browseHasMore != current.browseHasMore ||
      previous.browseLoadingMore != current.browseLoadingMore ||
      previous.browseFallbackAction != current.browseFallbackAction ||
      previous.pendingReplacementLive != current.pendingReplacementLive) {
    return true;
  }

  if (current.pendingReplacementLive == null &&
      previous.pendingReplacementLive == null) {
    return false;
  }

  return previous.activeSlotId != current.activeSlotId ||
      !_sameReplacementOverlaySlots(previous.slots, current.slots);
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

bool _sameControlsOverlaySlots(
  List<LivePlayerSlotState> previous,
  List<LivePlayerSlotState> current,
) {
  if (previous.length != current.length) {
    return false;
  }

  for (var index = 0; index < previous.length; index += 1) {
    if (!_sameControlsOverlaySlot(previous[index], current[index])) {
      return false;
    }
  }

  return true;
}

bool _sameControlsOverlaySlot(
  LivePlayerSlotState previous,
  LivePlayerSlotState current,
) {
  return previous.slotId == current.slotId &&
      previous.status == current.status &&
      previous.channelId == current.channelId &&
      previous.liveId == current.liveId &&
      previous.chatChannelId == current.chatChannelId &&
      previous.title == current.title &&
      previous.channelName == current.channelName &&
      previous.channelVerified == current.channelVerified &&
      listEquals(
        previous.availableResolutionIndexes,
        current.availableResolutionIndexes,
      ) &&
      previous.playbackResolutionIndex == current.playbackResolutionIndex;
}

bool _sameReplacementOverlaySlots(
  List<LivePlayerSlotState> previous,
  List<LivePlayerSlotState> current,
) {
  if (previous.length != current.length) {
    return false;
  }

  for (var index = 0; index < previous.length; index += 1) {
    if (!_sameReplacementOverlaySlot(previous[index], current[index])) {
      return false;
    }
  }

  return true;
}

bool _sameReplacementOverlaySlot(
  LivePlayerSlotState previous,
  LivePlayerSlotState current,
) {
  return previous.slotId == current.slotId &&
      previous.channelId == current.channelId &&
      previous.channelName == current.channelName &&
      previous.channelVerified == current.channelVerified;
}
