import '../../domain/entities/home_live.dart';
import '../dtos/home_dtos.dart';

List<HomeLive> homeTopLivesFromDto(HomeMainDto dto) {
  return [
    for (final item in dto.topLives) homeLiveFromDto(item),
  ];
}

HomeLive homeLiveFromDto(HomeLiveDto dto) {
  return HomeLive(
    liveId: dto.liveId,
    title: dto.liveTitle,
    thumbnailImageUrl: dto.liveImageUrl,
    defaultThumbnailImageUrl: dto.defaultThumbnailImageUrl,
    concurrentUserCount: dto.concurrentUserCount,
    adult: dto.adult,
    tags: dto.tags,
    openDate: dto.openDate,
    categoryValue: dto.liveCategoryValue,
    channel: _homeChannelFromDto(dto.channel),
    blindType: dto.blindType,
    watchPartyTag: dto.watchPartyTag,
    watchPartyType: dto.watchPartyType,
    membershipBenefitType: dto.membershipBenefitType,
  );
}

HomeChannel? _homeChannelFromDto(HomeChannelDto? dto) {
  if (dto == null) {
    return null;
  }

  return HomeChannel(
    channelId: dto.channelId,
    channelName: dto.channelName,
    channelImageUrl: dto.channelImageUrl,
    verifiedMark: dto.verifiedMark,
  );
}
