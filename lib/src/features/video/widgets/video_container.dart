import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/rounded_container.dart';
import '../model/video.dart';

class VideoContainer extends StatelessWidget {
  const VideoContainer({super.key, required this.video});

  final BaseVideo video;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                _videoThumbnail(video.thumbnailImageUrl),
                Align(
                  alignment: Alignment.topRight,
                  child: _convertedDuration(video.duration),
                ),
              ],
            ),
          ),
          _videoInfo(
            video.videoTitle,
            video.readCount,
            video.publishDateAt,
          ),
        ],
      ),
    );
  }

  Widget _convertedDuration(int duration) {
    final int hours = (duration / 3600).floor();
    final int mins = ((duration / 3600 - hours) * 60).floor();
    final int remainingSecs =
        ((((duration / 3600 - hours) * 60) - mins) * 60).floor();

    String paddedHours = hours.toString().padLeft(2, '0');
    String paddedMinutes = mins.toString().padLeft(2, '0');
    String paddedSeconds = remainingSecs.toString().padLeft(2, '0');

    return RoundedContainer(
      margin: const EdgeInsets.all(5.0),
      backgroundColor: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text('$paddedHours:$paddedMinutes:$paddedSeconds'),
      ),
    );
  }

  Widget _videoThumbnail(String? thumbnailUrl) {
    if (thumbnailUrl == null || thumbnailUrl.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            video.adult ? '19금 연령제한' : '이미지가 없습니다',
            style: const TextStyle(
              fontSize: 11.0,
            ),
          ),
        ),
      );
    } else {
      return CachedNetworkImage(
        imageUrl: thumbnailUrl,
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

  Widget _videoInfo(
    String videoTitle,
    int readCount,
    int publishDateAt,
  ) {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final timeDiff = currentTime - publishDateAt;

    final int hours = (timeDiff / (1000 * 60 * 60)).floor();

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            videoTitle,
            style: const TextStyle(
              fontSize: 13.0,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 3.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '조회수: $readCount회',
                style: const TextStyle(
                  fontSize: 11.0,
                ),
              ),
              const SizedBox(width: 5.0),
              Text(
                '$hours시간 전',
                style: const TextStyle(
                  fontSize: 11.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
