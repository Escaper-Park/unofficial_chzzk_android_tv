import '../../domain/entities/vod_detail.dart';
import '../../domain/entities/vod_feed.dart';
import '../../domain/entities/vod_playback.dart';
import '../dtos/vod_dtos.dart';

part 'vod_playback_mapper.dart';

VodPage vodPageFromDto(VodListDto dto) {
  return VodPage(
    items: [
      for (final item in dto.data) vodFromDto(item),
    ],
    cursor: _vodCursorFromDto(dto.page?.next),
    size: dto.size,
  );
}

FollowingVodPage followingVodPageFromDto(FollowingVodListDto dto) {
  return FollowingVodPage(
    items: [
      for (final item in dto.data) vodFromDto(item),
    ],
    cursor: _followingVodCursorFromDto(dto.page?.next),
    size: dto.size,
  );
}

Vod vodFromDto(VodDto dto) {
  return Vod(
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
    channel: vodChannelFromDto(dto.channel),
    blindType: dto.blindType,
    watchTimeline: dto.watchTimeline,
    userAdultStatus: dto.userAdultStatus,
    membershipBenefitType: dto.membershipBenefitType,
  );
}

VodDetail vodDetailFromDto(VodDetailDto dto) {
  return VodDetail(
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
    chapterActive: dto.chapterActive,
    chapters: [
      for (final chapter in dto.chapters) vodChapterFromDto(chapter),
    ],
    channel: vodChannelFromDto(dto.channel),
    blindType: dto.blindType,
    watchTimeline: dto.watchTimeline,
    inKey: dto.inKey,
    liveOpenDate: dto.liveOpenDate,
    liveRewindPlaybackJson: dto.liveRewindPlaybackJson,
    userAdultStatus: dto.userAdultStatus,
    videoChatEnabled: dto.videoChatEnabled,
    videoChatChannelId: dto.videoChatChannelId,
    membershipBenefitType: dto.membershipBenefitType,
  );
}

VodChapter vodChapterFromDto(VodChapterDto dto) {
  return VodChapter(
    title: dto.title,
    startTime: dto.startTime,
    endTime: dto.endTime,
    thumbnailUrl: dto.thumbnailUrl,
  );
}

VodChannel? vodChannelFromDto(VodChannelDto? dto) {
  if (dto == null) {
    return null;
  }

  return VodChannel(
    channelId: dto.channelId,
    channelName: dto.channelName,
    channelImageUrl: dto.channelImageUrl,
    verifiedMark: dto.verifiedMark,
  );
}

VodCursor? _vodCursorFromDto(VodPageNextDto? dto) {
  if (dto == null || dto.publishDateAt == null && dto.readCount == null) {
    return null;
  }

  return VodCursor(
    publishDateAt: dto.publishDateAt,
    readCount: dto.readCount,
  );
}

FollowingVodCursor? _followingVodCursorFromDto(
  FollowingVodPageNextDto? dto,
) {
  if (dto == null || dto.nextNo == null) {
    return null;
  }

  return FollowingVodCursor(nextNo: dto.nextNo);
}
