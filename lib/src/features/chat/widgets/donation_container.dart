import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../settings/model/chat_settings.dart';
import '../model/base_chat.dart';
import 'chat_container_base.dart';

class DonationContainer extends StatelessWidget {
  const DonationContainer({
    super.key,
    required this.chat,
    required this.chatSettings,
  });

  final BaseChat chat;
  final ChatSettings chatSettings;

  @override
  Widget build(BuildContext context) {
    final int payAmount = chat.extras?.payAmount ?? 0;
    final String nickname =
        chat.extras!.isAnonymous == true ? '익명의 후원자' : chat.extras!.nickname!;

    Color backgroundColor;
    if (payAmount < 10000) {
      backgroundColor = AppColors.donationContainer1000;
    } else if (payAmount < 100000) {
      backgroundColor = AppColors.donationContainer10000;
    } else if (payAmount < 500000) {
      backgroundColor = AppColors.donationContainer100000;
    } else if (payAmount < 1000000) {
      backgroundColor = AppColors.donationContainer500000;
    } else {
      backgroundColor = AppColors.donationContainer1000000;
    }

    return ChatContainerBase(
      chat: chat,
      chatSettings: chatSettings,
      nickname: nickname,
      nicknameColor: AppColors.donationNicknameWhite,
      chatTime: null,
      backgroundColor: backgroundColor,
      isDonation: true,
    );
  }
}
