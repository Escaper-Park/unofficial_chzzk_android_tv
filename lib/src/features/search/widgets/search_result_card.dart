import 'package:flutter/material.dart';

import '../../../common/circle_avatar_profile.dart';
import '../../channel/model/channel.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({
    super.key,
    required this.channel,
    required this.callback,
  });

  final Channel channel;
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
                channel.channelName,
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
      hasBorder: channel.openLive,
      profileImgUrl: channel.channelImageUrl,
    );
  }
}
