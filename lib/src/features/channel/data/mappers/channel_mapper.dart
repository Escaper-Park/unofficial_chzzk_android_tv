import '../../domain/entities/channel_detail.dart';
import '../../domain/entities/channel_my_info.dart';
import '../../domain/entities/channel_video.dart';
import '../dtos/channel_dtos.dart';

ChannelDetail channelDetailFromDto(ChannelDetailDto dto) {
  return ChannelDetail(
    channelId: dto.channelId,
    channelName: dto.channelName,
    channelImageUrl: dto.channelImageUrl,
    verifiedMark: dto.verifiedMark,
    followerCount: dto.followerCount,
    description: dto.channelDescription,
    activatedChannelBadgeIds: dto.activatedChannelBadgeIds,
    openLive: dto.openLive,
    personalData: _personalDataFromDto(dto.personalData),
  );
}

ChannelMyInfo channelMyInfoFromDto(ChannelMyInfoDto dto) {
  return ChannelMyInfo(
    channelId: dto.channelId,
    following: _personalFollowingFromDto(dto.following),
    cheatKey: dto.cheatKey,
    naverMembership: dto.naverMembership,
  );
}

ChannelVideoPage channelVideoPageFromDto(ChannelVideoListDto dto) {
  return ChannelVideoPage(
    items: [
      for (final item in dto.data) channelVideoFromDto(item),
    ],
    page: dto.page,
    size: dto.size,
    totalCount: dto.totalCount,
    totalPages: dto.totalPages,
  );
}

ChannelVideo channelVideoFromDto(ChannelVideoDto dto) {
  return ChannelVideo(
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

ChannelPersonalData? _personalDataFromDto(ChannelPersonalDataDto? dto) {
  if (dto == null) {
    return null;
  }

  return ChannelPersonalData(
    following: _personalFollowingFromDto(dto.following),
    privateUserBlock: dto.privateUserBlock,
  );
}

ChannelPersonalFollowing? _personalFollowingFromDto(
  ChannelPersonalFollowingDto? dto,
) {
  if (dto == null) {
    return null;
  }

  return ChannelPersonalFollowing(
    following: dto.following,
    notification: dto.notification,
    followDate: dto.followDate,
  );
}
