import 'package:flutter/material.dart';

class ChatPosition {
  final IconData iconData;
  final bool isFlipX;
  final bool isFlipY;
  final int posX;
  final int posY;

  ChatPosition({
    required this.iconData,
    required this.isFlipX,
    required this.isFlipY,
    required this.posX,
    required this.posY,
  });
}

class ChatSettingsData {
  static final List<ChatPosition> chatPositionData = [
    ChatPosition(
      iconData: Icons.arrow_outward_rounded,
      isFlipX: true,
      isFlipY: false,
      posX: 0,
      posY: 0,
    ),
    ChatPosition(
      iconData: Icons.arrow_upward_rounded,
      isFlipX: false,
      isFlipY: false,
      posX: 50,
      posY: 0,
    ),
    ChatPosition(
      iconData: Icons.arrow_outward_rounded,
      isFlipX: false,
      isFlipY: false,
      posX: 100,
      posY: 0,
    ),
    ChatPosition(
      iconData: Icons.arrow_back_rounded,
      isFlipX: false,
      isFlipY: false,
      posX: 0,
      posY: 50,
    ),
    ChatPosition(
      iconData: Icons.add_rounded,
      isFlipX: false,
      isFlipY: false,
      posX: 50,
      posY: 50,
    ),
    ChatPosition(
      iconData: Icons.arrow_forward_rounded,
      isFlipX: false,
      isFlipY: false,
      posX: 100,
      posY: 50,
    ),
    ChatPosition(
      iconData: Icons.arrow_outward_rounded,
      isFlipX: true,
      isFlipY: true,
      posX: 0,
      posY: 100,
    ),
    ChatPosition(
      iconData: Icons.arrow_downward_rounded,
      isFlipX: false,
      isFlipY: false,
      posX: 50,
      posY: 100,
    ),
    ChatPosition(
      iconData: Icons.arrow_outward_rounded,
      isFlipX: false,
      isFlipY: true,
      posX: 100,
      posY: 100,
    ),
  ];

  /// 0, 1, 2
  /// 3, 4, 5
  /// 6, 7, 8
  static int getPositionIndex(int posX, int posY) {
    int column = posX ~/ 34;
    int row = posY ~/ 34;
    return row * 3 + column;
  }
}
