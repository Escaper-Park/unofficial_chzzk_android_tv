import '../../domain/entities/category_info.dart';
import '../../domain/entities/category_item.dart';
import '../../domain/entities/category_live.dart';
import '../../domain/entities/category_page.dart';
import '../../domain/entities/category_video.dart';
import '../dtos/category_dtos.dart';

CategoryPage categoryPageFromDto(CategoryListDto dto) {
  return CategoryPage(
    items: [
      for (final item in dto.data) categoryItemFromDto(item),
    ],
    cursor: _categoryCursorFromDto(dto.page?.next),
    size: dto.size,
  );
}

CategoryItem categoryItemFromDto(CategoryDto dto) {
  return CategoryItem(
    categoryId: dto.categoryId,
    categoryType: dto.categoryType,
    title: dto.categoryValue,
    posterImageUrl: dto.posterImageUrl,
    openLiveCount: dto.openLiveCount,
    concurrentUserCount: dto.concurrentUserCount,
  );
}

List<CategoryItem> categoryItemsFromFollowingDto(
  FollowingCategoryListDto dto,
) {
  return [
    for (final item in dto.followingList)
      CategoryItem(
        categoryId: item.categoryId,
        categoryType: item.categoryType,
        title: item.categoryValue,
        posterImageUrl: item.posterImageUrl,
        openLiveCount: item.openLiveCount,
        concurrentUserCount: item.concurrentUserCount,
      ),
  ];
}

CategoryInfo categoryInfoFromDto(CategoryInfoDto dto) {
  return CategoryInfo(
    categoryId: dto.categoryId,
    categoryType: dto.categoryType,
    title: dto.categoryValue,
    posterImageUrl: dto.posterImageUrl,
    openLiveCount: dto.openLiveCount,
    concurrentUserCount: dto.concurrentUserCount,
    tags: dto.tags,
    following: dto.following,
  );
}

CategoryLivePage categoryLivePageFromDto(CategoryLiveListDto dto) {
  return CategoryLivePage(
    items: [
      for (final item in dto.data) categoryLiveFromDto(item),
    ],
    cursor: _categoryLiveCursorFromDto(dto.page?.next),
    size: dto.size,
  );
}

CategoryLive categoryLiveFromDto(CategoryLiveDto dto) {
  return CategoryLive(
    liveId: dto.liveId,
    title: dto.liveTitle,
    thumbnailImageUrl: dto.liveImageUrl,
    defaultThumbnailImageUrl: dto.defaultThumbnailImageUrl,
    concurrentUserCount: dto.concurrentUserCount,
    openDate: dto.openDate,
    adult: dto.adult,
    tags: dto.tags,
    categoryValue: dto.liveCategoryValue,
    channel: _liveChannelFromDto(dto.channel),
    blindType: dto.blindType,
    watchPartyTag: dto.watchPartyTag,
    watchPartyType: dto.watchPartyType,
  );
}

CategoryVideoPage categoryVideoPageFromDto(CategoryVideoListDto dto) {
  return CategoryVideoPage(
    items: [
      for (final item in dto.data) categoryVideoFromDto(item),
    ],
    cursor: _categoryVideoCursorFromDto(dto.page?.next),
    size: dto.size,
  );
}

CategoryVideo categoryVideoFromDto(CategoryVideoDto dto) {
  return CategoryVideo(
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
    channel: _videoChannelFromDto(dto.channel),
    blindType: dto.blindType,
    watchTimeline: dto.watchTimeline,
  );
}

CategoryPageCursor? _categoryCursorFromDto(CategoryPageNextDto? dto) {
  if (dto == null || dto.categoryId == null) {
    return null;
  }

  return CategoryPageCursor(
    categoryId: dto.categoryId!,
    categoryType: dto.categoryType,
    concurrentUserCount: dto.concurrentUserCount,
    openLiveCount: dto.openLiveCount,
  );
}

CategoryLiveCursor? _categoryLiveCursorFromDto(
  CategoryLivePageNextDto? dto,
) {
  if (dto == null || dto.liveId == null) {
    return null;
  }

  return CategoryLiveCursor(
    concurrentUserCount: dto.concurrentUserCount,
    liveId: dto.liveId,
  );
}

CategoryVideoCursor? _categoryVideoCursorFromDto(
  CategoryVideoPageNextDto? dto,
) {
  if (dto == null || dto.publishDateAt == null && dto.readCount == null) {
    return null;
  }

  return CategoryVideoCursor(
    publishDateAt: dto.publishDateAt,
    readCount: dto.readCount,
  );
}

CategoryLiveChannel? _liveChannelFromDto(CategoryChannelDto? dto) {
  if (dto == null) {
    return null;
  }

  return CategoryLiveChannel(
    channelId: dto.channelId,
    channelName: dto.channelName,
    channelImageUrl: dto.channelImageUrl,
    verifiedMark: dto.verifiedMark,
  );
}

CategoryVideoChannel? _videoChannelFromDto(CategoryChannelDto? dto) {
  if (dto == null) {
    return null;
  }

  return CategoryVideoChannel(
    channelId: dto.channelId,
    channelName: dto.channelName,
    channelImageUrl: dto.channelImageUrl,
    verifiedMark: dto.verifiedMark,
  );
}
