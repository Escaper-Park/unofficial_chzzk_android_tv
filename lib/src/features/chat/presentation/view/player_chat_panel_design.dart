import 'package:flutter/material.dart';

abstract final class PlayerChatPanelDesign {
  static const verifiedMarkAsset = 'assets/images/verified_mark.png';
  static const cheeseAsset = 'assets/images/cheese.png';

  static const panelColor = Color.fromRGBO(0, 0, 0, 1);
  static const panelBorderColor = Color.fromRGBO(255, 255, 255, 0.10);
  static const bubbleColor = Color.fromRGBO(0, 0, 0, 1);
  static const blindMessageColor = Color.fromRGBO(157, 165, 182, 1);
  static const textColor = Color.fromRGBO(201, 206, 220, 1);
  static const metaTextColor = Color.fromRGBO(255, 255, 255, 0.70);

  static const panelRadius = 8.0;
  static const bubbleRadius = 8.0;
  static const panelPadding = EdgeInsets.all(10);
  static const panelContainerPadding = EdgeInsets.symmetric(vertical: 8);
  static const messagePadding = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 8,
  );
  static const messageTextPadding = EdgeInsets.symmetric(horizontal: 10);
  static const metaContentGap = 4.0;
  static const metaItemGap = 3.0;
  static const iconSize = 16.0;
  static const cheeseIconSize = 15.0;
  static const emojiMinSize = 20.0;
  static const donationAmountGap = 4.0;
  static const donationAmountPadding = EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 3,
  );

  static const titleTextStyle = TextStyle(
    color: textColor,
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  static const messageTextStyle = TextStyle(
    color: textColor,
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static const metaTextStyle = TextStyle(
    color: metaTextColor,
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  static const nicknameColors = <Color>[
    Color.fromRGBO(90, 144, 192, 1),
    Color.fromRGBO(94, 125, 204, 1),
    Color.fromRGBO(125, 191, 178, 1),
    Color.fromRGBO(132, 193, 148, 1),
    Color.fromRGBO(144, 95, 170, 1),
    Color.fromRGBO(159, 206, 142, 1),
    Color.fromRGBO(173, 210, 222, 1),
    Color.fromRGBO(186, 130, 190, 1),
    Color.fromRGBO(204, 229, 125, 1),
    Color.fromRGBO(220, 94, 154, 1),
    Color.fromRGBO(230, 129, 153, 1),
    Color.fromRGBO(234, 163, 95, 1),
  ];

  static const _fontFamily = 'KCC-Hanbit';
}
