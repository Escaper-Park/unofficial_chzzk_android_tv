part of 'live_player_multiview_playback_layout.dart';

Map<String, Rect> _pbpSlotRects(
  Size size,
  List<LivePlayerSlotState> slots, {
  required ChatSettings chatSettings,
  required bool useSideChat,
}) {
  if (slots.isEmpty) {
    return const {};
  }

  if (slots.length == 1) {
    return {slots.single.slotId: Offset.zero & size};
  }

  if (slots.length == 2) {
    if (useSideChat) {
      return _pbpTwoSlotSideChatRects(size, slots, chatSettings);
    }

    final slotWidth = size.width / 2;

    return {
      slots[0].slotId: Rect.fromLTWH(0, 0, slotWidth, size.height),
      slots[1].slotId: Rect.fromLTWH(
        slotWidth,
        0,
        slotWidth,
        size.height,
      ),
    };
  }

  final slotWidth = size.width / 2;
  final slotHeight = size.height / 2;

  return {
    for (var index = 0; index < slots.length && index < 4; index += 1)
      slots[index].slotId: Rect.fromLTWH(
        (index % 2) * slotWidth,
        (index ~/ 2) * slotHeight,
        slotWidth,
        slotHeight,
      ),
  };
}

Map<String, Rect> _pbpTwoSlotSideChatRects(
  Size size,
  List<LivePlayerSlotState> slots,
  ChatSettings chatSettings,
) {
  final sideWidth = _singleSideChatWidth(size, chatSettings);
  final playbackLeft = _singleSideChatOnLeft(chatSettings) ? sideWidth : 0.0;
  final playbackWidth = math.max(0.0, size.width - sideWidth);
  final slotHeight = size.height / 2;

  return {
    slots[0].slotId: Rect.fromLTWH(
      playbackLeft,
      0,
      playbackWidth,
      slotHeight,
    ),
    slots[1].slotId: Rect.fromLTWH(
      playbackLeft,
      slotHeight,
      playbackWidth,
      size.height - slotHeight,
    ),
  };
}
