import 'package:flutter/material.dart';

import '../../../common/circle_avatar_profile.dart';
import '../model/following.dart';

class FollowingInfoCard extends StatelessWidget {
  const FollowingInfoCard({
    super.key,
    required this.following,
    required this.callback,
  });

  final Following following;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: MaterialButton(
        height: 50.0,
        onPressed: callback,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profileAvatar(),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Text(
                following.channel.channelName,
                style: const TextStyle(
                  fontSize: 12.0,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileAvatar() {
    return CircleAvatarProfile(
      hasBorder: following.streamer.openLive,
      profileImgUrl: following.channel.channelImageUrl,
    );
  }
}
