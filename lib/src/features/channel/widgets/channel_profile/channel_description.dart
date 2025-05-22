import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart' show AppColors;

class ChannelDescription extends StatelessWidget {
  const ChannelDescription({
    super.key,
    required this.channelDescription,
  });

  final String channelDescription;

  @override
  Widget build(BuildContext context) {
    final newlineRemovedChannelDescription =
        channelDescription.replaceAll('\n', ' ');

    return Text(
      newlineRemovedChannelDescription,
      style: const TextStyle(
        fontSize: 13.0,
        color: AppColors.greyColor,
        overflow: TextOverflow.clip,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
