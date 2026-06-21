import '../../../channel/domain/entities/channel_detail.dart';
import '../../../channel/domain/entities/channel_video.dart';
import '../entities/vod_feed.dart';

List<Vod> vodsFromChannelVideos(
  List<ChannelVideo> videos,
  ChannelDetail profile,
) {
  return [
    for (final video in videos) vodFromChannelVideo(video, profile),
  ];
}

Vod vodFromChannelVideo(ChannelVideo video, ChannelDetail profile) {
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
    channel: VodChannel(
      channelId: profile.channelId,
      channelName: profile.channelName,
      channelImageUrl: profile.channelImageUrl,
      verifiedMark: profile.verifiedMark,
    ),
    blindType: video.blindType,
    watchTimeline: video.watchTimeline,
  );
}
