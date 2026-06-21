import '../../../chat/domain/entities/chat.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../bloc/live_player_bloc.dart';

bool canUseSingleViewLiveChatShortcut(LivePlayerState state) {
  return state.overlayMode == LivePlayerOverlayMode.none &&
      state.viewMode == LivePlayerViewMode.single &&
      LiveChatSessionRequest.tryCreate(
            channelId: state.activeSlot.channelId,
            chatChannelId: state.activeSlot.chatChannelId,
          ) !=
          null;
}

int visibleLiveChatWindowIndex(int index) {
  return index == liveChatWindowHiddenIndex
      ? liveChatWindowOverlayIndex
      : index;
}

ChatSettings cycledLiveOverlayChatPosition(
  ChatSettings settings, {
  required bool forward,
}) {
  final nextIndex = _nextOverlayChatPositionPresetIndex(
    currentX: settings.overlayChatPositionX,
    currentY: settings.overlayChatPositionY,
    forward: forward,
  );
  final preset = _overlayChatPositionPresets[nextIndex];
  return settings.copyWith(
    overlayChatQuickPositionIndex: nextIndex,
    overlayChatPositionX: preset.x,
    overlayChatPositionY: preset.y,
  );
}

int _nextOverlayChatPositionPresetIndex({
  required int currentX,
  required int currentY,
  required bool forward,
}) {
  final currentIndex = _nearestOverlayChatPositionPresetIndex(
    x: currentX,
    y: currentY,
  );
  final delta = forward ? 1 : -1;
  final nextIndex = (currentIndex + delta) % _overlayChatPositionPresets.length;
  return nextIndex < 0
      ? nextIndex + _overlayChatPositionPresets.length
      : nextIndex;
}

int _nearestOverlayChatPositionPresetIndex({
  required int x,
  required int y,
}) {
  var nearestIndex = 0;
  var nearestDistance = 1 << 30;

  for (var index = 0; index < _overlayChatPositionPresets.length; index += 1) {
    final preset = _overlayChatPositionPresets[index];
    final distance = _squaredDistance(
      x1: x,
      y1: y,
      x2: preset.x,
      y2: preset.y,
    );
    if (distance < nearestDistance) {
      nearestIndex = index;
      nearestDistance = distance;
    }
  }

  return nearestIndex;
}

int _squaredDistance({
  required int x1,
  required int y1,
  required int x2,
  required int y2,
}) {
  final dx = x1 - x2;
  final dy = y1 - y2;
  return dx * dx + dy * dy;
}

const liveChatWindowHiddenIndex = 0;
const liveChatWindowOverlayIndex = 1;
const liveChatWindowSidePanelIndex = 2;
const liveSideChatLeftPositionIndex = 0;
const liveSideChatRightPositionIndex = 1;
const liveSideChatLeftPositionX = 0;
const liveSideChatRightPositionX = 100;

const _overlayChatPositionPresets = <({int x, int y})>[
  (x: 0, y: 0),
  (x: 50, y: 0),
  (x: 100, y: 0),
  (x: 0, y: 50),
  (x: 50, y: 50),
  (x: 100, y: 50),
  (x: 0, y: 100),
  (x: 50, y: 100),
  (x: 100, y: 100),
];
