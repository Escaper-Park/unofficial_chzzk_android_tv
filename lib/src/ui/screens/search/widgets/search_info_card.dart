import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';
import '../../../../model/channel/channel.dart';
import '../../../common/circle_avatar_profile_image.dart';
import '../../../common/custom_outline_button.dart';

class SearchInfoCard extends StatelessWidget {
  const SearchInfoCard({
    super.key,
    required this.channel,
    required this.onPressed,
  });

  final Channel channel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomOutlineButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Profile Image
            CircleAvatarProfileImage(
              profileImageUrl: channel.channelImageUrl,
              hasBorder: channel.openLive ?? false,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                channel.channelName,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: AppColors.greyColor,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
