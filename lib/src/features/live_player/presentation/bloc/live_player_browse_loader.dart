part of 'live_player_bloc.dart';

const _browsePageSize = 12;
const _recentBrowseLimit = 10;

final class LivePlayerBrowseLoader {
  const LivePlayerBrowseLoader({
    required this.liveRepository,
    required this.followingRepository,
    required this.categoryRepository,
  });

  final LiveRepository liveRepository;
  final FollowingRepository followingRepository;
  final CategoryRepository categoryRepository;

  Future<LivePlayerBrowseLoadResult> load(
    LivePlayerBrowseRequest request,
  ) async {
    switch (request.section) {
      case LivePlayerBrowseSection.following:
        return _loadFollowing();
      case LivePlayerBrowseSection.popular:
        return _loadPopular(request.liveCursor);
      case LivePlayerBrowseSection.category:
        return _loadCategory(request);
      case LivePlayerBrowseSection.recent:
        return _loadRecent(request.recentLiveChannelIds);
      case LivePlayerBrowseSection.group:
        return _loadGroup(request.groupMemberChannelIds);
    }
  }

  Future<LivePlayerBrowseLoadResult> _loadFollowing() async {
    final page = await followingRepository.fetchFollowingLives();
    return LivePlayerBrowseLoadResult(
      items: [
        for (final channel in page.items) ?_liveFromFollowingChannel(channel),
      ],
    );
  }

  Future<LivePlayerBrowseLoadResult> _loadPopular(
    LiveCursor? liveCursor,
  ) async {
    final page = await liveRepository.getLives(
      size: _browsePageSize,
      cursor: liveCursor,
    );
    return LivePlayerBrowseLoadResult(
      items: _selectableLives(page.items),
      liveCursor: page.cursor,
      hasMore: page.cursor != null,
    );
  }

  Future<LivePlayerBrowseLoadResult> _loadCategory(
    LivePlayerBrowseRequest request,
  ) async {
    final categoryType = request.categoryType;
    final categoryId = request.categoryId;
    if (categoryType == null || categoryId == null) {
      return const LivePlayerBrowseLoadResult();
    }

    final page = await categoryRepository.fetchCategoryLives(
      categoryType: categoryType,
      categoryId: categoryId,
      cursor: request.categoryCursor,
    );
    return LivePlayerBrowseLoadResult(
      items: [
        for (final live in page.items) ?_liveFromCategoryLive(live),
      ],
      categoryCursor: page.cursor,
      hasMore: page.cursor != null,
    );
  }

  Future<LivePlayerBrowseLoadResult> _loadGroup(
    List<String> memberChannelIds,
  ) async {
    if (memberChannelIds.isEmpty) {
      return const LivePlayerBrowseLoadResult();
    }

    return _loadDetails(memberChannelIds);
  }

  Future<LivePlayerBrowseLoadResult> _loadRecent(
    List<String> channelIds,
  ) async {
    if (channelIds.isEmpty) {
      return const LivePlayerBrowseLoadResult();
    }

    return _loadDetails(channelIds.take(_recentBrowseLimit));
  }

  Future<LivePlayerBrowseLoadResult> _loadDetails(
    Iterable<String> channelIds,
  ) async {
    final lives = <Live>[];
    for (final channelId in channelIds) {
      try {
        final detail = await liveRepository.getLiveDetail(channelId: channelId);
        final live = _liveFromDetail(detail, fallbackChannelId: channelId);
        if (live != null) {
          lives.add(live);
        }
      } on Object {
        // Ignore unavailable channels and show fallback if all fail.
      }
    }

    return LivePlayerBrowseLoadResult(items: lives);
  }
}

final class LivePlayerBrowseRequest {
  const LivePlayerBrowseRequest({
    required this.section,
    this.liveCursor,
    this.categoryCursor,
    this.categoryType,
    this.categoryId,
    this.recentLiveChannelIds = const <String>[],
    this.groupMemberChannelIds = const <String>[],
  });

  final LivePlayerBrowseSection section;
  final LiveCursor? liveCursor;
  final CategoryLiveCursor? categoryCursor;
  final String? categoryType;
  final String? categoryId;
  final List<String> recentLiveChannelIds;
  final List<String> groupMemberChannelIds;
}

final class LivePlayerBrowseLoadResult {
  const LivePlayerBrowseLoadResult({
    this.items = const [],
    this.liveCursor,
    this.categoryCursor,
    this.hasMore = false,
  });

  final List<Live> items;
  final LiveCursor? liveCursor;
  final CategoryLiveCursor? categoryCursor;
  final bool hasMore;
}

List<Live> _selectableLives(List<Live> items) {
  return [
    for (final item in items)
      if (item.channel?.channelId != null) item,
  ];
}

Live? _liveFromFollowingChannel(FollowingChannel channel) {
  final liveInfo = channel.liveInfo;
  final liveId = liveInfo?.liveId;
  if (!channel.openLive || liveInfo == null || liveId == null) {
    return null;
  }

  return Live(
    liveId: liveId,
    title: playerEntryTextOrNull(liveInfo.title) ?? channel.channelName,
    thumbnailImageUrl: liveInfo.thumbnailImageUrl,
    defaultThumbnailImageUrl: liveInfo.defaultThumbnailImageUrl,
    concurrentUserCount: liveInfo.concurrentUserCount,
    adult: liveInfo.adult,
    tags: liveInfo.tags,
    categoryValue: liveInfo.categoryValue,
    channel: LiveChannel(
      channelId: channel.channelId,
      channelName: channel.channelName,
      channelImageUrl: channel.channelImageUrl,
      verifiedMark: channel.verifiedMark,
    ),
    blindType: liveInfo.blindType,
    watchPartyTag: liveInfo.watchPartyTag,
    watchPartyType: liveInfo.watchPartyType,
  );
}

Live? _liveFromCategoryLive(CategoryLive live) {
  final channel = live.channel;
  if (channel == null) {
    return null;
  }

  return Live(
    liveId: live.liveId,
    title: live.title,
    thumbnailImageUrl: live.thumbnailImageUrl,
    defaultThumbnailImageUrl: live.defaultThumbnailImageUrl,
    concurrentUserCount: live.concurrentUserCount,
    openDate: live.openDate,
    adult: live.adult,
    tags: live.tags,
    categoryValue: live.categoryValue,
    channel: LiveChannel(
      channelId: channel.channelId,
      channelName: channel.channelName,
      channelImageUrl: channel.channelImageUrl,
      verifiedMark: channel.verifiedMark,
    ),
    blindType: live.blindType,
    watchPartyTag: live.watchPartyTag,
    watchPartyType: live.watchPartyType,
  );
}

Live? _liveFromDetail(
  LiveDetail detail, {
  required String fallbackChannelId,
}) {
  if (detail.status.trim().toUpperCase() != 'OPEN') {
    return null;
  }

  final detailChannel = detail.channel;
  return Live(
    liveId: detail.liveId,
    title: detail.title,
    thumbnailImageUrl: detail.thumbnailImageUrl,
    defaultThumbnailImageUrl: detail.defaultThumbnailImageUrl,
    concurrentUserCount: detail.concurrentUserCount,
    openDate: detail.openDate,
    adult: detail.adult,
    tags: detail.tags,
    categoryValue: detail.categoryValue,
    channel: detailChannel == null
        ? LiveChannel(
            channelId: fallbackChannelId,
            channelName: fallbackChannelId,
            verifiedMark: false,
          )
        : LiveChannel(
            channelId: detailChannel.channelId,
            channelName: detailChannel.channelName,
            channelImageUrl: detailChannel.channelImageUrl,
            verifiedMark: detailChannel.verifiedMark,
          ),
    blindType: detail.blindType,
    watchPartyTag: detail.watchPartyTag,
    watchPartyType: detail.watchPartyType,
    membershipBenefitType: detail.membershipBenefitType,
  );
}
