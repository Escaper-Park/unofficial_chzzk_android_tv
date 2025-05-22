import 'package:flutter/material.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/widgets/ui/custom_badge.dart';
import '../../../../common/widgets/ui/ui_widgets.dart'
    show CircleAvatarProfileImage;
import '../../model/channel.dart';

class ChannelProfileImageWithLiveBadge extends StatelessWidget {
  /// Profile image with a live badge.
  const ChannelProfileImageWithLiveBadge({super.key, required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    const double damping = 5.0;

    return SizedBox(
      width: Dimensions.channelProfileImageRadius * 2,
      height: Dimensions.channelProfileImageRadius * 2 + damping,
      child: channel.openLive == true
          ? Stack(
              children: [
                _profileImage(),
                _liveBadge(),
              ],
            )
          : _profileImage(),
    );
  }

  Widget _liveBadge() {
    return CustomBadge(
      alignment: Alignment.bottomCenter,
      elements: [TextElement(text: 'LIVE')],
    );
  }

  Widget _profileImage() {
    return CircleAvatarProfileImage(
      radius: Dimensions.channelProfileImageRadius,
      useBorder: channel.openLive ?? false,
      profileImageUrl: channel.channelImageUrl,
    );
  }
}
