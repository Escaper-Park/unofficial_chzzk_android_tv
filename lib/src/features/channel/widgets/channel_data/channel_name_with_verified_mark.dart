import 'package:flutter/material.dart';

import '../../../../common/constants/assets_path.dart';
import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/optimized_image.dart';
import '../../model/channel.dart';

class ChannelNameWithVerifiedMark extends StatelessWidget {
  /// Partner channel has the verified mark.
  const ChannelNameWithVerifiedMark({
    super.key,
    required this.channel,
    this.fontColor = AppColors.greyColor,
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.w700,
  });

  final Channel channel;

  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return channel.verifiedMark == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IntrinsicWidth(
                child: _channelName(),
              ),
              const SizedBox(width: 3.0),
              OptimizedAssetImage(
                imageWidth: fontSize,
                imagePath: AssetsPath.verifiedMark,
              )
            ],
          )
        : _channelName();
  }

  Widget _channelName() {
    return Text(
      channel.channelName,
      style: TextStyle(
        fontSize: fontSize,
        overflow: TextOverflow.ellipsis,
        color: fontColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
