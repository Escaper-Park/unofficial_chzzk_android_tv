import 'package:flutter/material.dart';

import '../../../common/constants/assets_path.dart' show AssetsPath;
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/optimized_image.dart'
    show OptimizedAssetImage;
import '../model/channel.dart';

class ChannelNameWithVerifiedMark extends StatelessWidget {
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
    final bool isPartner = channel.verifiedMark == true;

    return isPartner
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // name
              IntrinsicWidth(child: _channelName()),
              const SizedBox(width: 3.0),
              // partner mark
              _partnerMark(),
            ],
          )
        : _channelName();
  }

  Widget _partnerMark() {
    return OptimizedAssetImage(
      imageWidth: fontSize,
      imagePath: AssetsPath.verifiedMark,
    );
  }

  Widget _channelName() {
    return Text(
      channel.channelName,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
