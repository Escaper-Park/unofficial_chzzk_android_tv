import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../common/circle_avatar_profile.dart';
import '../../../common/rounded_container.dart';
import '../../live/model/live.dart';

class LiveContainer extends StatelessWidget {
  const LiveContainer({
    super.key,
    required this.liveDetail,
  });

  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = liveDetail.defaultThumbnailImageUrl == null
        ? liveDetail.liveImageUrl
        : liveDetail.defaultThumbnailImageUrl!;

    return RoundedContainer(
      backgroundColor: Colors.black45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail with badges
          Expanded(
            child: Stack(
              children: [
                _liveThumbnail(thumbnailUrl),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 5.0),
                      _liveBadge(
                        'LIVE',
                        const Color.fromARGB(255, 243, 26, 11),
                      ),
                      const SizedBox(width: 3.0),
                      _liveBadge(
                        '${liveDetail.concurrentUserCount}명 시청',
                        Colors.black87,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: _liveInfo(),
          ),
        ],
      ),
    );
  }

  Widget _liveThumbnail(String? thumbnailUrl) {
    if (thumbnailUrl == null || thumbnailUrl.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            liveDetail.adult ? '19금 연령제한' : '이미지가 없습니다',
            style: const TextStyle(
              fontSize: 11.0,
            ),
          ),
        ),
      );
    } else {
      final imageUrl =
          thumbnailUrl.replaceAll('image_{type}.jpg', 'image_480.jpg');

      return CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          );
        },
        placeholder: (context, url) => const SizedBox.shrink(),
      );
    }
  }

  Widget _liveBadge(String text, Color backgroundColor) {
    return RoundedContainer(
      backgroundColor: backgroundColor.withOpacity(0.9),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(5.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 9.0,
        ),
      ),
    );
  }

  // Streamer profile, live title
  Widget _liveInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              CircleAvatarProfile(
                radius: 12.0,
                profileImgUrl: liveDetail.channel.channelImageUrl,
              ),
              const SizedBox(width: 5.0),
              Text(
                liveDetail.channel.channelName,
                style: const TextStyle(fontSize: 12.0),
              ),
              const SizedBox(width: 5.0),
              Expanded(
                child: Text(
                  liveDetail.liveCategoryValue ?? '?',
                  style: const TextStyle(
                    fontSize: 10.0,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white70,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5.0),
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            bottom: 5.0,
          ),
          child: Text(
            liveDetail.liveTitle,
            style: const TextStyle(
              fontSize: 9.0,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
