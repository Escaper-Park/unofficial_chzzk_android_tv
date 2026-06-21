part of 'live_player_view.dart';

bool _livePlayerViewBuildWhen(
  LivePlayerState previous,
  LivePlayerState current,
) {
  return !_isInactiveMultiviewSlotOnlyUpdate(previous, current);
}

bool _isInactiveMultiviewSlotOnlyUpdate(
  LivePlayerState previous,
  LivePlayerState current,
) {
  if (!previous.isMultiview || !current.isMultiview) {
    return false;
  }
  if (previous.overlayMode != LivePlayerOverlayMode.none ||
      current.overlayMode != LivePlayerOverlayMode.none) {
    return false;
  }
  if (previous.viewMode != current.viewMode ||
      previous.multiviewLayoutMode != current.multiviewLayoutMode ||
      previous.activeSlotId != current.activeSlotId ||
      previous.primarySlotId != current.primarySlotId ||
      previous.activeSlotHighlightSerial != current.activeSlotHighlightSerial ||
      previous.settingsPreferences != current.settingsPreferences ||
      previous.feedbackType != current.feedbackType ||
      previous.feedbackSerial != current.feedbackSerial) {
    return false;
  }
  if (previous.activeSlot != current.activeSlot) {
    return false;
  }
  if (_hasPlayableLiveSlot(previous) != _hasPlayableLiveSlot(current)) {
    return false;
  }

  return _sameSlotIdOrder(previous.slots, current.slots);
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
