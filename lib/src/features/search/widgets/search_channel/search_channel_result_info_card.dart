import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../../common/widgets/focused_widget.dart';
import '../../../channel/model/channel.dart';

class SearchChannelResultInfoCard extends StatelessWidget {
  const SearchChannelResultInfoCard({
    super.key,
    required this.autofocus,
    required this.channel,
    required this.onPressed,
  });

  final bool autofocus;
  final Channel channel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlinedButton(
      autofocus: autofocus,
      onPressed: onPressed,
      padding: const EdgeInsets.all(10.0),
      child: (_) => Row(
        children: [
          // Profile Image
          SizedBox(
            width: 30.0,
            child: CircleAvatarProfileImage(
              radius: 15.0,
              profileImageUrl: channel.channelImageUrl,
              useBorder: channel.openLive == true,
            ),
          ),
          const SizedBox(width: 10.0),
          // Channel name
          Expanded(
            flex: 2,
            child: Text(
              channel.channelName,
              style: const TextStyle(
                fontSize: 12.0,
                color: AppColors.greyColor,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
