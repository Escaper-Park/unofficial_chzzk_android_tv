import 'package:flutter/material.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/widgets/channel_widgets.dart';

import '../../../common/constants/dimensions.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/ui_widgets.dart'
    show CircleAvatarProfileImage, FocusedOutlinedButton;
import '../../channel/model/channel.dart';
import '../../channel/widgets/channel_widgets.dart'
    show ChannelNameWithVerifiedMark;
import '../model/following.dart';

part 'following_channel_info_card/following_channel_info_card_body.dart';
part 'following_channel_info_card/following_channel_profile_image.dart';
part 'following_channel_info_card/following_channel_name.dart';
part 'following_channel_info_card/following_channel_live_status.dart';

class FollowingChannelInfoCard extends StatelessWidget {
  /// A ListView tile with the following channel's info and status.
  const FollowingChannelInfoCard({
    super.key,
    required this.autofocus,
    required this.following,
    required this.onPressed,
  });

  final bool autofocus;
  final Following following;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bool openLive = following.streamer.openLive;
    final Channel channel = following.channel;

    return _FollowingChannelInfoCardBody(
      autofocus: autofocus,
      openLive: openLive,
      onPressed: onPressed,
      profileImage: _FollowingChannelProfileImage(
        openLive: openLive,
        profileImageUrl: channel.channelImageUrl,
      ),
      channelName: _FollowingChannelName(channel: channel),
      liveStatus: _FollowingChannelLiveStatus(
        concurrentUserCount: following.liveInfo.concurrentUserCount,
      ),
    );
  }
}
