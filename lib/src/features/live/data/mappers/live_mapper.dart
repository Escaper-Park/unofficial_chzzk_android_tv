import '../../domain/entities/live_detail.dart';
import '../../domain/entities/live_feed.dart';
import '../../domain/entities/live_status.dart';
import '../dtos/live_dtos.dart';

LivePage livePageFromDto(LiveListDto dto) {
  return LivePage(
    items: [
      for (final item in dto.data) liveFromDto(item),
    ],
    cursor: _liveCursorFromDto(dto.page?.next),
    size: dto.size,
  );
}

Live liveFromDto(LiveDto dto) {
  return Live(
    liveId: dto.liveId,
    title: dto.liveTitle,
    thumbnailImageUrl: dto.liveImageUrl,
    defaultThumbnailImageUrl: dto.defaultThumbnailImageUrl,
    concurrentUserCount: dto.concurrentUserCount,
    openDate: dto.openDate,
    adult: dto.adult,
    tags: dto.tags,
    categoryValue: dto.liveCategoryValue,
    channel: liveChannelFromDto(dto.channel),
    blindType: dto.blindType,
    watchPartyTag: dto.watchPartyTag,
    watchPartyType: dto.watchPartyType,
    membershipBenefitType: dto.membershipBenefitType,
  );
}

LiveStatus liveStatusFromDto(LiveStatusDto dto) {
  return LiveStatus(
    title: dto.liveTitle,
    status: dto.status,
    concurrentUserCount: dto.concurrentUserCount,
    adult: dto.adult,
    openDate: dto.openDate,
    chatChannelId: dto.chatChannelId,
    tags: dto.tags,
    categoryValue: dto.liveCategoryValue,
    categoryType: dto.categoryType,
    categoryId: dto.liveCategory,
    userAdultStatus: dto.userAdultStatus,
    blindType: dto.blindType,
    watchPartyTag: dto.watchPartyTag,
    watchPartyType: dto.watchPartyType,
    channelId: dto.channelId,
    krOnlyViewing: dto.krOnlyViewing,
    timeMachineActive: dto.timeMachineActive,
    membershipBenefitType: dto.membershipBenefitType,
    liveTokenList: dto.liveTokenList,
    liveTokens: dto.liveTokenList ?? const <String>[],
  );
}

LiveDetail liveDetailFromDto(LiveDetailDto dto) {
  return LiveDetail(
    liveId: dto.liveId,
    title: dto.liveTitle,
    status: dto.status,
    thumbnailImageUrl: dto.liveImageUrl,
    defaultThumbnailImageUrl: dto.defaultThumbnailImageUrl,
    concurrentUserCount: dto.concurrentUserCount,
    openDate: dto.openDate,
    adult: dto.adult,
    tags: dto.tags,
    chatChannelId: dto.chatChannelId,
    categoryValue: dto.liveCategoryValue,
    categoryType: dto.categoryType,
    categoryId: dto.liveCategory,
    livePlaybackJson: dto.livePlaybackJson,
    channel: liveChannelFromDto(dto.channel),
    userAdultStatus: dto.userAdultStatus,
    blindType: dto.blindType,
    watchPartyTag: dto.watchPartyTag,
    watchPartyType: dto.watchPartyType,
    timeMachineActive: dto.timeMachineActive,
    timeMachinePlayback: dto.timeMachinePlayback,
    membershipBenefitType: dto.membershipBenefitType,
  );
}

LiveChannel? liveChannelFromDto(LiveChannelDto? dto) {
  if (dto == null) {
    return null;
  }

  return LiveChannel(
    channelId: dto.channelId,
    channelName: dto.channelName,
    channelImageUrl: dto.channelImageUrl,
    verifiedMark: dto.verifiedMark,
  );
}

LiveCursor? _liveCursorFromDto(LivePageNextDto? dto) {
  if (dto == null || dto.liveId == null) {
    return null;
  }

  return LiveCursor(
    concurrentUserCount: dto.concurrentUserCount,
    liveId: dto.liveId,
  );
}
