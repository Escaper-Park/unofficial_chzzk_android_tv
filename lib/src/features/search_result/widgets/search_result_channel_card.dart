import 'package:flutter/material.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/ui_widgets.dart'
    show CircleAvatarProfileImage, FocusedOutlinedButton, RoundedContainer;
import '../../channel/model/channel.dart';
import '../../channel/widgets/channel_widgets.dart'
    show ChannelNameWithVerifiedMark;

class SearchResultChannelCard extends StatelessWidget {
  const SearchResultChannelCard({
    super.key,
    this.autofocus = false,
    required this.focusNode,
    required this.channel,
    required this.onPressedChannelCard,
  });

  final bool autofocus;
  final FocusNode focusNode;
  final Channel channel;
  final void Function(Channel channel) onPressedChannelCard;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: Dimensions.searchResultChannelCardWidth,
      height: Dimensions.searchResultChannelCardHeight,
      child: FocusedOutlinedButton(
        autofocus: autofocus,
        focusNode: focusNode,
        padding: const EdgeInsets.all(10.0),
        backgroundColor: AppColors.greyContainerColor,
        onPressed: () => onPressedChannelCard(channel),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatarProfileImage(
              radius: Dimensions.infoCardProfileImageRadius,
              profileImageUrl: channel.channelImageUrl,
              useBorder: channel.openLive == true,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChannelNameWithVerifiedMark(channel: channel),
                  Text(
                    '팔로워 ${(channel.followerCount ?? 0).commaFormat()}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: AppColors.greyColor,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
