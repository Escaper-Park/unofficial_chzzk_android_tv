import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/rounded_container.dart';
import '../../../channel/model/channel.dart';

class CategoryVodChannelInfo extends StatelessWidget {
  const CategoryVodChannelInfo({super.key, required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.topRight,
        child: RoundedContainer(
          padding: const EdgeInsets.all(5.0),
          backgroundColor: AppColors.greyContainerColor,
          child: Text(
            channel.channelName,
            style: const TextStyle(
              fontSize: 11.0,
              color: AppColors.chzzkColor,
            ),
          ),
        ),
      ),
    );
  }
}
