import '../../domain/entities/search_results.dart';
import '../dtos/search_results_dtos.dart';

SearchChannelResultsPage searchChannelResultsPageFromDto(
  SearchChannelListDto dto,
) {
  return SearchChannelResultsPage(
    items: [
      for (final item in dto.data) searchChannelResultFromDto(item),
    ],
    cursor: _cursorFromDto(dto.page?.next),
    size: dto.size,
    totalCount: dto.totalCount,
    totalPages: dto.totalPages,
  );
}

SearchVideoResultsPage searchVideoResultsPageFromDto(
  SearchVideoListDto dto,
) {
  return SearchVideoResultsPage(
    items: [
      for (final item in dto.data) searchVideoResultFromDto(item),
    ],
    cursor: _cursorFromDto(dto.page?.next),
    size: dto.size,
    totalCount: dto.totalCount,
    totalPages: dto.totalPages,
  );
}

SearchLiveResultsPage searchLiveResultsPageFromDto(SearchLiveListDto dto) {
  return SearchLiveResultsPage(
    items: [
      for (final item in dto.data) searchLiveResultFromDto(item),
    ],
    cursor: _cursorFromDto(dto.page?.next),
    size: dto.size,
    totalCount: dto.totalCount,
    totalPages: dto.totalPages,
  );
}

SearchChannelResult searchChannelResultFromDto(
  SearchChannelResultDto dto,
) {
  return SearchChannelResult(
    channel: searchChannelFromDto(dto.channel),
    content: _channelContentFromDto(dto.content),
  );
}

SearchVideoResult searchVideoResultFromDto(SearchVideoResultDto dto) {
  return SearchVideoResult(
    channel: searchChannelFromDto(dto.channel),
    video: searchVideoFromDto(dto.video),
  );
}

SearchLiveResult searchLiveResultFromDto(SearchLiveResultDto dto) {
  return SearchLiveResult(
    channel: searchChannelFromDto(dto.channel),
    live: searchLiveFromDto(dto.live),
  );
}

SearchChannel? searchChannelFromDto(SearchChannelDto? dto) {
  if (dto == null) {
    return null;
  }

  return SearchChannel(
    channelId: dto.channelId,
    channelName: dto.channelName,
    channelImageUrl: dto.channelImageUrl,
    verifiedMark: dto.verifiedMark,
    followerCount: dto.followerCount,
    description: dto.channelDescription,
    openLive: dto.openLive,
  );
}

SearchLive? searchLiveFromDto(SearchLiveDto? dto) {
  if (dto == null) {
    return null;
  }

  return SearchLive(
    liveId: dto.liveId,
    title: dto.liveTitle,
    thumbnailImageUrl: dto.liveImageUrl,
    defaultThumbnailImageUrl: dto.defaultThumbnailImageUrl,
    concurrentUserCount: dto.concurrentUserCount,
    openDate: dto.openDate,
    adult: dto.adult,
    tags: dto.tags,
    chatChannelId: dto.chatChannelId,
    categoryValue: dto.liveCategoryValue,
    watchPartyTag: dto.watchPartyTag,
    watchPartyType: dto.watchPartyType,
    channelId: dto.channelId,
  );
}

SearchVideo? searchVideoFromDto(SearchVideoDto? dto) {
  if (dto == null) {
    return null;
  }

  return SearchVideo(
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
    blindType: dto.blindType,
    watchTimeline: dto.watchTimeline,
  );
}

SearchChannelContent? _channelContentFromDto(
  SearchChannelContentDto? dto,
) {
  if (dto == null) {
    return null;
  }

  return SearchChannelContent(
    live: searchLiveFromDto(dto.live),
    videos: [
      for (final item in dto.videos) searchVideoFromDto(item)!,
    ],
  );
}

SearchCursor? _cursorFromDto(SearchPageNextDto? dto) {
  if (dto == null || dto.offset == null) {
    return null;
  }

  return SearchCursor(offset: dto.offset);
}
