part of 'chat_settings_preferences.dart';

IconData? _overlayChatQuickPositionIcon(int value) {
  return switch (value) {
    0 => Icons.north_west,
    1 => Icons.north,
    2 => Icons.north_east,
    3 => Icons.west,
    4 => Icons.circle,
    5 => Icons.east,
    6 => Icons.south_west,
    7 => Icons.south,
    8 => Icons.south_east,
    _ => null,
  };
}

Alignment _overlayChatQuickPositionIconAlignment(int value) {
  return switch (value) {
    0 => Alignment.topLeft,
    1 => Alignment.topCenter,
    2 => Alignment.topRight,
    3 => Alignment.centerLeft,
    4 => Alignment.center,
    5 => Alignment.centerRight,
    6 => Alignment.bottomLeft,
    7 => Alignment.bottomCenter,
    8 => Alignment.bottomRight,
    _ => Alignment.center,
  };
}

IconData? _sideChatPositionIcon(int value) {
  return switch (value) {
    0 => Icons.west,
    1 => Icons.east,
    _ => null,
  };
}

Alignment _sideChatPositionIconAlignment(int value) {
  return value == 0 ? Alignment.centerLeft : Alignment.centerRight;
}

ChatSettings _withOverlayChatPosition(
  ChatSettings settings, {
  int? x,
  int? y,
}) {
  final nextX = x ?? settings.overlayChatPositionX;
  final nextY = y ?? settings.overlayChatPositionY;
  return settings.copyWith(
    overlayChatPositionX: nextX,
    overlayChatPositionY: nextY,
    overlayChatQuickPositionIndex: _nearestOverlayChatPositionPresetIndex(
      x: nextX,
      y: nextY,
    ),
  );
}

ChatSettings _withOverlayChatQuickPositionIndex(
  ChatSettings settings,
  int value,
) {
  final index = value.clamp(0, _overlayChatPositionPresets.length - 1).toInt();
  final preset = _overlayChatPositionPresets[index];
  return settings.copyWith(
    overlayChatQuickPositionIndex: index,
    overlayChatPositionX: preset.x,
    overlayChatPositionY: preset.y,
  );
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
