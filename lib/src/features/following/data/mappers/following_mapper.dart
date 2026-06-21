import '../../domain/entities/following_feed.dart';
import '../dtos/following_dtos.dart';

FollowingChannelPage followingChannelPageFromDto(
  FollowingChannelListDto dto,
) {
  return FollowingChannelPage(
    items: [
      for (final item in dto.followingList) followingChannelFromDto(item),
    ],
    totalCount: dto.totalCount,
    totalPages: dto.totalPage,
  );
}

FollowingLivePage followingLivePageFromDto(FollowingLiveListDto dto) {
  return FollowingLivePage(
    items: [
      for (final item in dto.followingList) followingChannelFromDto(item),
    ],
    totalCount: dto.totalCount,
    totalLiveCount: dto.totalLiveCount,
    totalPages: dto.totalPage,
  );
}

FollowingChannel followingChannelFromDto(FollowingChannelDto dto) {
  final channel = dto.channel;
  final liveInfo = _liveInfoFromDto(dto.liveInfo);

  return FollowingChannel(
    channelId: channel?.channelId ?? dto.channelId,
    channelName: channel?.channelName ?? '',
    channelImageUrl: channel?.channelImageUrl,
    verifiedMark: channel?.verifiedMark ?? false,
    activatedChannelBadgeIds: channel?.activatedChannelBadgeIds ?? const [],
    personalData: _personalDataFromDto(channel?.personalData),
    liveInfo: liveInfo,
    openLive: dto.streamer?.openLive ?? liveInfo != null,
  );
}

FollowingLiveInfo? _liveInfoFromDto(FollowingLiveInfoDto? dto) {
  if (dto == null) {
    return null;
  }

  return FollowingLiveInfo(
    liveId: dto.liveId,
    title: dto.liveTitle,
    thumbnailImageUrl: dto.liveImageUrl,
    defaultThumbnailImageUrl: dto.defaultThumbnailImageUrl,
    concurrentUserCount: dto.concurrentUserCount,
    adult: dto.adult,
    tags: dto.tags,
    categoryValue: dto.liveCategoryValue,
    blindType: dto.blindType,
    watchPartyTag: dto.watchPartyTag,
    watchPartyType: dto.watchPartyType,
  );
}

FollowingPersonalData? _personalDataFromDto(
  FollowingChannelPersonalDataDto? dto,
) {
  if (dto == null) {
    return null;
  }

  return FollowingPersonalData(
    following: dto.following?.following ?? false,
    notification: dto.following?.notification ?? false,
    followDate: dto.following?.followDate,
    privateUserBlock: dto.privateUserBlock,
  );
}
