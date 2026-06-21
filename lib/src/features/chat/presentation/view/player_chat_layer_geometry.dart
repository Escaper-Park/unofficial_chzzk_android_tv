import 'dart:math' as math;

import 'package:flutter/rendering.dart';

import '../../../settings/domain/entities/chat_settings.dart';

Rect playerChatOverlayChatRect({
  required BoxConstraints constraints,
  required ChatSettings chatSettings,
}) {
  return _overlayRect(
    constraints: constraints,
    widthPercent: chatSettings.overlayChatPanelWidth,
    heightPercent: chatSettings.overlayChatPanelHeight,
    positionX: chatSettings.overlayChatPositionX,
    positionY: chatSettings.overlayChatPositionY,
  );
}

Rect playerChatOverlayBadgeCollectorRect({
  required BoxConstraints constraints,
  required ChatSettings chatSettings,
}) {
  return _overlayRect(
    constraints: constraints,
    widthPercent: chatSettings.overlayChatPanelWidth,
    heightPercent: chatSettings.badgeCollectorPanelHeight,
    positionX: chatSettings.overlayBadgeCollectorPositionX,
    positionY: chatSettings.overlayBadgeCollectorPositionY,
  );
}

PlayerChatWithBadgeOverlayLayout playerChatWithBadgeOverlayLayout({
  required BoxConstraints constraints,
  required ChatSettings chatSettings,
}) {
  final viewportWidth = _finiteExtent(constraints.maxWidth);
  final viewportHeight = _finiteExtent(constraints.maxHeight);
  final width = math.min(
    viewportWidth,
    viewportWidth * _settingsRatio(chatSettings.overlayChatPanelWidth),
  );
  final heights = _withChatHeights(
    maxHeight: viewportHeight,
    chatSettings: chatSettings,
  );
  final left =
      math.max(0.0, viewportWidth - width) *
      _settingsRatio(chatSettings.overlayChatPositionX);
  final top =
      math.max(0.0, viewportHeight - heights.totalHeight) *
      _settingsRatio(chatSettings.overlayChatPositionY);

  return PlayerChatWithBadgeOverlayLayout(
    rect: Rect.fromLTWH(left, top, width, heights.totalHeight),
    chatHeight: heights.chatHeight,
    collectorHeight: heights.collectorHeight,
    gap: heights.gap,
  );
}

double playerChatCollectorHeight({
  required double maxHeight,
  required ChatSettings chatSettings,
}) {
  return math.min(
    _finiteExtent(maxHeight),
    _finiteExtent(maxHeight) *
        _settingsRatio(chatSettings.badgeCollectorPanelHeight),
  );
}

bool showsPlayerChatBadgeCollector(ChatSettings settings) {
  return settings.useBadgeCollector != 0 &&
      settings.badgeCollectorPanelHeight > 0;
}

Rect _overlayRect({
  required BoxConstraints constraints,
  required int widthPercent,
  required int heightPercent,
  required int positionX,
  required int positionY,
}) {
  final viewportWidth = _finiteExtent(constraints.maxWidth);
  final viewportHeight = _finiteExtent(constraints.maxHeight);
  final width = math.min(
    viewportWidth,
    viewportWidth * _settingsRatio(widthPercent),
  );
  final height = math.min(
    viewportHeight,
    viewportHeight * _settingsRatio(heightPercent),
  );
  final left = math.max(0.0, viewportWidth - width) * _settingsRatio(positionX);
  final top =
      math.max(0.0, viewportHeight - height) * _settingsRatio(positionY);

  return Rect.fromLTWH(left, top, width, height);
}

_PlayerChatWithBadgeHeights _withChatHeights({
  required double maxHeight,
  required ChatSettings chatSettings,
}) {
  final height = _finiteExtent(maxHeight);
  final chatHeight =
      height * _settingsRatio(chatSettings.overlayChatPanelHeight);
  final collectorHeight =
      height * _settingsRatio(chatSettings.badgeCollectorPanelHeight);
  final totalHeight = chatHeight + collectorHeight;
  if (totalHeight > height) {
    return _PlayerChatWithBadgeHeights(
      chatHeight: math.max(0.0, height - collectorHeight),
      collectorHeight: math.min(height, collectorHeight),
      gap: 0,
    );
  }

  final availableGap = math.max(0.0, height - totalHeight);
  return _PlayerChatWithBadgeHeights(
    chatHeight: chatHeight,
    collectorHeight: collectorHeight,
    gap: math.min(_chatBadgeCollectorGap, availableGap),
  );
}

double _settingsRatio(int value) {
  return value.clamp(0, 100).toDouble() / 100;
}

double _finiteExtent(double value) {
  return value.isFinite && value > 0 ? value : 0;
}

const _chatBadgeCollectorGap = 4.0;

final class PlayerChatWithBadgeOverlayLayout {
  const PlayerChatWithBadgeOverlayLayout({
    required this.rect,
    required this.chatHeight,
    required this.collectorHeight,
    required this.gap,
  });

  final Rect rect;
  final double chatHeight;
  final double collectorHeight;
  final double gap;
}

final class _PlayerChatWithBadgeHeights {
  const _PlayerChatWithBadgeHeights({
    required this.chatHeight,
    required this.collectorHeight,
    required this.gap,
  });

  final double chatHeight;
  final double collectorHeight;
  final double gap;

  double get totalHeight => chatHeight + collectorHeight + gap;
}
