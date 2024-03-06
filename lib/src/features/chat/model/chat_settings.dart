import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_settings.freezed.dart';
part 'chat_settings.g.dart';

@freezed
class ChatSettings with _$ChatSettings {
  factory ChatSettings({
    required int fontSize,

    /// Ratio to maxHeight
    required int chatContainerHeight,

    /// Ratio to maxWidth,
    required int chatContainerWidth,

    /// Opacity = 1-chatContainerTransparency
    required int chatContainerTransparency,

    /// Chat Position
    required int chatPosition,

    /// Chat container interval
    required int chatContainerVerticalInterval,
  }) = _ChatSettings;

  factory ChatSettings.fromJson(Map<String, dynamic> json) =>
      _$ChatSettingsFromJson(json);
}

class ChatPosition {
  final IconData iconData;
  final bool isFlipX;
  final bool isFlipY;
  final Alignment alignment;

  ChatPosition({
    required this.iconData,
    required this.isFlipX,
    required this.isFlipY,
    required this.alignment,
  });
}

class ChatPositionData {
  // Icon, isFlipX, isFlipY, Alignment
  static final List<ChatPosition> chatPositionsData = [
    ChatPosition(
      iconData: Icons.arrow_outward_rounded,
      isFlipX: true,
      isFlipY: false,
      alignment: Alignment.topLeft,
    ),
    ChatPosition(
      iconData: Icons.arrow_upward_rounded,
      isFlipX: false,
      isFlipY: false,
      alignment: Alignment.topCenter,
    ),
    ChatPosition(
      iconData: Icons.arrow_outward_rounded,
      isFlipX: false,
      isFlipY: false,
      alignment: Alignment.topRight,
    ),
    ChatPosition(
      iconData: Icons.arrow_forward_rounded,
      isFlipX: false,
      isFlipY: false,
      alignment: Alignment.centerRight,
    ),
    ChatPosition(
      iconData: Icons.arrow_outward_rounded,
      isFlipX: false,
      isFlipY: true,
      alignment: Alignment.bottomRight,
    ),
    ChatPosition(
      iconData: Icons.arrow_downward_rounded,
      isFlipX: false,
      isFlipY: false,
      alignment: Alignment.bottomCenter,
    ),
    ChatPosition(
      iconData: Icons.arrow_outward_rounded,
      isFlipX: true,
      isFlipY: true,
      alignment: Alignment.bottomLeft,
    ),
    ChatPosition(
      iconData: Icons.arrow_back_rounded,
      isFlipX: false,
      isFlipY: false,
      alignment: Alignment.centerLeft,
    ),
  ];
}
