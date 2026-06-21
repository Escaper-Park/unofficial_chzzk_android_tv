part of 'live_player_multiview_playback_layout.dart';

Map<String, Rect> _focusSlotRects(
  Size size, {
  required LivePlayerSlotState activeSlot,
  required bool reserveChat,
  required bool chatOnLeft,
  required List<LivePlayerSlotState> subSlots,
}) {
  final topHeight = size.height * 2 / 3;
  final bottomHeight = size.height - topHeight;
  final columnWidth = size.width / 3;
  final chatWidth = reserveChat ? columnWidth : 0.0;
  final mainLeft = chatOnLeft ? chatWidth : 0.0;
  final mainWidth = size.width - chatWidth;

  return {
    activeSlot.slotId: Rect.fromLTWH(mainLeft, 0, mainWidth, topHeight),
    for (var index = 0; index < subSlots.length && index < 3; index += 1)
      subSlots[index].slotId: Rect.fromLTWH(
        _focusSubSlotLeft(
          size: size,
          index: index,
          columnWidth: columnWidth,
          reserveChat: reserveChat,
          chatOnLeft: chatOnLeft,
        ),
        topHeight,
        columnWidth,
        bottomHeight,
      ),
  };
}

Rect _focusChatRect(
  Size size, {
  required bool chatOnLeft,
  required bool fullHeight,
}) {
  final topHeight = size.height * 2 / 3;
  final chatWidth = size.width / 3;

  return Rect.fromLTWH(
    chatOnLeft ? 0 : size.width - chatWidth,
    0,
    chatWidth,
    fullHeight ? size.height : topHeight,
  );
}

double _focusSubSlotLeft({
  required Size size,
  required int index,
  required double columnWidth,
  required bool reserveChat,
  required bool chatOnLeft,
}) {
  if (reserveChat && chatOnLeft) {
    return size.width - columnWidth * (index + 1);
  }

  return columnWidth * index;
}
