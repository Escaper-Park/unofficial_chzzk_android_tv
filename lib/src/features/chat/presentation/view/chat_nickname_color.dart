import 'package:flutter/material.dart';

import 'player_chat_panel_design.dart';

Color chatNicknameColorFor({
  required String? userIdHash,
  required String? nickname,
}) {
  final seed = _nicknameColorSeed(userIdHash) ?? _nicknameColorSeed(nickname);
  if (seed == null) {
    return PlayerChatPanelDesign.nicknameColors.first;
  }

  return PlayerChatPanelDesign.nicknameColors[_hashString(seed) %
      PlayerChatPanelDesign.nicknameColors.length];
}

String? _nicknameColorSeed(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed;
}

int _hashString(String value) {
  var hash = 0;
  for (final rune in value.runes) {
    hash = (hash * 31 + rune) & 0x7fffffff;
  }

  return hash;
}
