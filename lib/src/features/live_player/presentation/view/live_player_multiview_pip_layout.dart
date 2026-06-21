part of 'live_player_multiview_playback_layout.dart';

Map<String, Rect> _pipSlotRects(
  Size size,
  LivePlayerState state,
) {
  final activeSlot = state.activeSlot;
  final pipSlots = [
    for (final slot in state.slots)
      if (slot.slotId != activeSlot.slotId) slot,
  ];
  final pipRects = _pipRects(
    size,
    pipSlots.length,
    state.settingsPreferences.liveSettings,
  );

  return {
    activeSlot.slotId: Offset.zero & size,
    for (var index = 0; index < pipSlots.length; index += 1)
      pipSlots[index].slotId: pipRects[index],
  };
}
