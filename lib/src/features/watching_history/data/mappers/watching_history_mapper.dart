import '../../domain/entities/watching_history.dart';
import '../dtos/watching_history_dtos.dart';

WatchingHistoryPage watchingHistoryPageFromDto(WatchingHistoryListDto dto) {
  return WatchingHistoryPage(
    items: [for (final item in dto.data) watchingHistoryItemFromDto(item)],
    cursor: _cursorFromDto(dto.page?.next),
    size: dto.size,
  );
}

WatchingHistoryItem watchingHistoryItemFromDto(WatchingHistoryDto dto) {
  return WatchingHistoryItem(
    historyNo: dto.historyNo,
    channelId: dto.channelId,
    videoNo: dto.videoNo,
    timeline: dto.timeline,
    contentType: dto.contentType,
    date: dto.date,
    video: _videoFromDto(dto.videoResponse),
  );
}

WatchingHistoryVideo? _videoFromDto(WatchingHistoryVideoDto? dto) {
  if (dto == null) {
    return null;
  }

  return WatchingHistoryVideo(
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

WatchingHistoryChannel? _channelFromDto(WatchingHistoryChannelDto? dto) {
  if (dto == null) {
    return null;
  }

  return WatchingHistoryChannel(
    channelId: dto.channelId,
    channelName: dto.channelName,
    channelImageUrl: dto.channelImageUrl,
    verifiedMark: dto.verifiedMark,
    activatedChannelBadgeIds: dto.activatedChannelBadgeIds,
    personalData: _personalDataFromDto(dto.personalData),
  );
}

WatchingHistoryPersonalData? _personalDataFromDto(
  WatchingHistoryChannelPersonalDataDto? dto,
) {
  if (dto == null) {
    return null;
  }

  return WatchingHistoryPersonalData(
    following: dto.following?.following ?? false,
    notification: dto.following?.notification ?? false,
    followDate: dto.following?.followDate,
    privateUserBlock: dto.privateUserBlock,
  );
}

WatchingHistoryCursor? _cursorFromDto(WatchingHistoryPageNextDto? dto) {
  if (dto == null || dto.lastTime == null) {
    return null;
  }

  return WatchingHistoryCursor(lastTime: dto.lastTime);
}
