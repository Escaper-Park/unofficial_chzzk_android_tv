import '../../../watching_history/domain/entities/watching_history.dart';
import '../entities/vod_feed.dart';

Vod? vodFromWatchingHistoryItem(WatchingHistoryItem item) {
  final video = item.video;
  if (video == null) {
    return null;
  }

  return Vod(
    videoNo: video.videoNo,
    videoId: video.videoId,
    title: video.title,
    videoType: video.videoType,
    publishDate: video.publishDate,
    thumbnailImageUrl: video.thumbnailImageUrl,
    duration: video.duration,
    readCount: video.readCount,
    publishDateAt: video.publishDateAt,
    categoryValue: video.categoryValue,
    adult: video.adult,
    livePv: video.livePv,
    tags: video.tags,
    channel: video.channel == null
        ? null
        : VodChannel(
            channelId: video.channel!.channelId,
            channelName: video.channel!.channelName,
            channelImageUrl: video.channel!.channelImageUrl,
            verifiedMark: video.channel!.verifiedMark,
          ),
    blindType: video.blindType,
    watchTimeline: item.timeline,
  );
}
