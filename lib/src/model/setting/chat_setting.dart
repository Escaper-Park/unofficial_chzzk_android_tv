import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_setting.freezed.dart';

class ChatPositionData {
  // Icon, isFlipX, isFlipY
  static const List<(IconData, bool, bool, Alignment)> dataList = [
    (Icons.arrow_outward_rounded, true, false, Alignment.topLeft),
    (Icons.arrow_upward_rounded, false, false, Alignment.topCenter),
    (Icons.arrow_outward_rounded, false, false, Alignment.topRight),
    (Icons.arrow_forward_rounded, false, false, Alignment.centerRight),
    (Icons.arrow_outward_rounded, false, true, Alignment.bottomRight),
    (Icons.arrow_downward_rounded, false, false, Alignment.bottomCenter),
    (Icons.arrow_outward_rounded, true, true, Alignment.bottomLeft),
    (Icons.arrow_back_rounded, false, false, Alignment.centerLeft),
  ];
}

@freezed
class ChatSetting with _$ChatSetting {
  factory ChatSetting({
    required int fontSize,

    /// Ratio to maxHeight
    required int chatContainerHeight,

    /// Ratio to maxWidth,
    required int chatContainerWidth,

    /// Opacity = 1-chatContainerTransparency
    required int chatContainerTransparency,

    /// Chat Position
    required int chatPosition,
  }) = _ChatSetting;
}
