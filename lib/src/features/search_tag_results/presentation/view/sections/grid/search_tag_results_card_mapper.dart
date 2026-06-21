import '../../../../../live/domain/entities/live_feed.dart';
import '../../../../../vod/domain/entities/vod_feed.dart';
import '../../../../domain/entities/search_tag_feed.dart';

Live searchTagLiveCardItem(SearchTagLive item) {
  return Live(
    liveId: item.liveId,
    title: item.title,
    thumbnailImageUrl: item.thumbnailImageUrl,
    defaultThumbnailImageUrl: item.defaultThumbnailImageUrl,
    concurrentUserCount: item.concurrentUserCount,
    openDate: item.openDate,
    adult: item.adult,
    tags: item.tags,
    categoryValue: item.categoryValue,
    channel: item.channel == null
        ? null
        : LiveChannel(
            channelId: item.channel!.channelId,
            channelName: item.channel!.channelName,
            channelImageUrl: item.channel!.channelImageUrl,
            verifiedMark: item.channel!.verifiedMark,
          ),
    blindType: item.blindType,
    watchPartyTag: item.watchPartyTag,
    watchPartyType: item.watchPartyType,
  );
}

Vod searchTagVideoCardItem(SearchTagVideo item) {
  return Vod(
    videoNo: item.videoNo,
    videoId: item.videoId,
    title: item.title,
    videoType: item.videoType,
    publishDate: item.publishDate,
    thumbnailImageUrl: item.thumbnailImageUrl,
    duration: item.duration,
    readCount: item.readCount,
    publishDateAt: item.publishDateAt,
    categoryValue: item.categoryValue,
    adult: item.adult,
    livePv: item.livePv,
    tags: item.tags,
    channel: item.channel == null
        ? null
        : VodChannel(
            channelId: item.channel!.channelId,
            channelName: item.channel!.channelName,
            channelImageUrl: item.channel!.channelImageUrl,
            verifiedMark: item.channel!.verifiedMark,
          ),
    blindType: item.blindType,
    watchTimeline: item.watchTimeline,
  );
}
