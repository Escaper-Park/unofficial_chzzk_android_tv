import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../common/widgets/focused_outline_button.dart';
import '../../channel/model/channel.dart';

class SearchResultInfoCard extends StatelessWidget {
  const SearchResultInfoCard({
    super.key,
    required this.channel,
    required this.onPressed,
    required this.autofocus,
  });

  final Channel channel;
  final VoidCallback onPressed;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlineButton(
      autofocus: autofocus,
      onPressed: onPressed,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          // Profile Image
          SizedBox(
            width: 30.0,
            child: CircleAvatarProfileImage(
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
