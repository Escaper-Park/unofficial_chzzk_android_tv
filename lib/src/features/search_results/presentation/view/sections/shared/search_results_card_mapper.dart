import '../../../../../live/domain/entities/live_feed.dart';
import '../../../../../vod/domain/entities/vod_feed.dart';
import '../../../../domain/entities/search_results.dart';

Live searchResultLiveCardItem(SearchLiveResult item) {
  final live = item.live!;
  final channel = item.channel;

  return Live(
    liveId: live.liveId,
    title: live.title,
    thumbnailImageUrl: live.thumbnailImageUrl,
    defaultThumbnailImageUrl: live.defaultThumbnailImageUrl,
    concurrentUserCount: live.concurrentUserCount,
    openDate: live.openDate,
    adult: live.adult,
    tags: live.tags,
    categoryValue: live.categoryValue,
    channel: channel == null
        ? null
        : LiveChannel(
            channelId: channel.channelId,
            channelName: channel.channelName,
            channelImageUrl: channel.channelImageUrl,
            verifiedMark: channel.verifiedMark,
          ),
    watchPartyTag: live.watchPartyTag,
    watchPartyType: live.watchPartyType,
  );
}

Vod searchResultVideoCardItem(SearchVideoResult item) {
  final video = item.video!;
  final channel = item.channel;

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
    blindType: video.blindType,
    watchTimeline: video.watchTimeline,
    channel: channel == null
        ? null
        : VodChannel(
            channelId: channel.channelId,
            channelName: channel.channelName,
            channelImageUrl: channel.channelImageUrl,
            verifiedMark: channel.verifiedMark,
          ),
  );
}
