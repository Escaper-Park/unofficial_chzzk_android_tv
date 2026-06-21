import '../../domain/entities/search_tag_feed.dart';
import '../dtos/search_tag_results_dtos.dart';

SearchTagLivePage searchTagLivePageFromDto(SearchTagLiveListDto dto) {
  return SearchTagLivePage(
    items: [for (final item in dto.data) searchTagLiveFromDto(item)],
    cursor: _liveCursorFromDto(dto.page?.next),
    size: dto.size,
  );
}

SearchTagVideoPage searchTagVideoPageFromDto(SearchTagVideoListDto dto) {
  return SearchTagVideoPage(
    items: [for (final item in dto.data) searchTagVideoFromDto(item)],
    cursor: _videoCursorFromDto(dto.page?.next),
    size: dto.size,
  );
}

SearchTagLive searchTagLiveFromDto(SearchTagLiveDto dto) {
  return SearchTagLive(
    liveId: dto.liveId,
    title: dto.liveTitle,
    thumbnailImageUrl: dto.liveImageUrl,
    defaultThumbnailImageUrl: dto.defaultThumbnailImageUrl,
    concurrentUserCount: dto.concurrentUserCount,
    openDate: dto.openDate,
    adult: dto.adult,
    tags: dto.tags,
    categoryValue: dto.liveCategoryValue,
    channel: _channelFromDto(dto.channel),
    blindType: dto.blindType,
    watchPartyTag: dto.watchPartyTag,
    watchPartyType: dto.watchPartyType,
  );
}

SearchTagVideo searchTagVideoFromDto(SearchTagVideoDto dto) {
  return SearchTagVideo(
    videoNo: dto.videoNo,
    videoId: dto.videoId,
    title: dto.videoTitle,
    videoType: dto.videoType,
    publishDate: dto.publishDate,
    thumbnailImageUrl: dto.thumbnailImageUrl,
    duration: dto.duration,
    readCount: dto.readCount,
    publishDateAt: dto.publishDateAt,
    categoryValue: dto.videoCategoryValue,
    adult: dto.adult,
    livePv: dto.livePv,
    tags: dto.tags,
    channel: _channelFromDto(dto.channel),
    blindType: dto.blindType,
    watchTimeline: dto.watchTimeline,
  );
}

SearchTagChannel? _channelFromDto(SearchTagChannelDto? dto) {
  if (dto == null) {
    return null;
  }

  return SearchTagChannel(
    channelId: dto.channelId,
    channelName: dto.channelName,
    channelImageUrl: dto.channelImageUrl,
    verifiedMark: dto.verifiedMark,
  );
}

SearchTagLiveCursor? _liveCursorFromDto(SearchTagLivePageNextDto? dto) {
  if (dto == null || (dto.concurrentUserCount == null && dto.liveId == null)) {
    return null;
  }

  return SearchTagLiveCursor(
    concurrentUserCount: dto.concurrentUserCount,
    liveId: dto.liveId,
  );
}

SearchTagVideoCursor? _videoCursorFromDto(SearchTagVideoPageNextDto? dto) {
  if (dto == null || dto.start == null) {
    return null;
  }

  return SearchTagVideoCursor(start: dto.start);
}
