import 'package:flutter/material.dart';

final class PlayerChatDonationStyle {
  const PlayerChatDonationStyle({
    required this.backgroundColor,
    required this.amountBackgroundColor,
    required this.contentColor,
  });

  final Color backgroundColor;
  final Color amountBackgroundColor;
  final Color contentColor;

  static PlayerChatDonationStyle forAmount(int? amount) {
    final value = amount ?? 0;
    if (value >= 1000000) {
      return _oneMillion;
    }
    if (value >= 500000) {
      return _fiveHundredThousand;
    }
    if (value >= 100000) {
      return _oneHundredThousand;
    }
    if (value >= 10000) {
      return _tenThousand;
    }
    if (value > 0) {
      return _oneThousand;
    }

    return _hiddenAmount;
  }

  static const _contentColor = Colors.white;
  static const _hiddenAmount = PlayerChatDonationStyle(
    backgroundColor: Color(0xFF5D6572),
    amountBackgroundColor: Color(0xFF4B5360),
    contentColor: _contentColor,
  );
  static const _oneThousand = PlayerChatDonationStyle(
    backgroundColor: Color(0xFF574FA8),
    amountBackgroundColor: Color(0xFF4A438F),
    contentColor: _contentColor,
  );
  static const _tenThousand = PlayerChatDonationStyle(
    backgroundColor: Color(0xFF2D7B8B),
    amountBackgroundColor: Color(0xFF1F5661),
    contentColor: _contentColor,
  );
  static const _oneHundredThousand = PlayerChatDonationStyle(
    backgroundColor: Color(0xFF23815A),
    amountBackgroundColor: Color(0xFF185A3F),
    contentColor: _contentColor,
  );
  static const _fiveHundredThousand = PlayerChatDonationStyle(
    backgroundColor: Color(0xFFD18E3C),
    amountBackgroundColor: Color(0xFF92632A),
    contentColor: _contentColor,
  );
  static const _oneMillion = PlayerChatDonationStyle(
    backgroundColor: Color(0xFFC54952),
    amountBackgroundColor: Color(0xFF8A3339),
    contentColor: _contentColor,
  );
}
