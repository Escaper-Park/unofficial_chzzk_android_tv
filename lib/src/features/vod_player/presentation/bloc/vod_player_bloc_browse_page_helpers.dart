part of 'vod_player_bloc.dart';

extension _VodPlayerBlocBrowsePageHelpers on VodPlayerBloc {
  Future<void> _loadBrowsePage(
    Emitter<VodPlayerState> emit, {
    required String channelId,
    required int page,
    required int requestSerial,
    required List<Vod> existingItems,
    bool loadingMore = false,
  }) async {
    try {
      final result = await _fetchBrowsePage(channelId, page: page);
      if (!_isCurrentBrowseRequest(requestSerial, channelId)) {
        return;
      }

      final items = [...existingItems, ...result.items];
      if (items.isEmpty) {
        emit(
          state.copyWith(
            browseStatus: VodPlayerBrowseLoadStatus.empty,
            browseItems: const [],
            browseNextPage: null,
            browseHasMore: false,
            browseLoadingMore: false,
            browseFallbackAction: VodPlayerBrowseFallbackAction.closeBrowse,
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          browseStatus: VodPlayerBrowseLoadStatus.success,
          browseItems: items,
          browseNextPage: result.nextPage,
          browseHasMore: result.nextPage != null,
          browseLoadingMore: false,
          browseFallbackAction: VodPlayerBrowseFallbackAction.none,
        ),
      );
    } on Object {
      if (!_isCurrentBrowseRequest(requestSerial, channelId)) {
        return;
      }

      if (loadingMore) {
        emit(
          state.copyWith(
            browseLoadingMore: false,
            feedbackType: VodPlayerFeedbackType.browseLoadMoreFailure,
            feedbackSerial: state.feedbackSerial + 1,
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          browseStatus: VodPlayerBrowseLoadStatus.failure,
          browseItems: const [],
          browseNextPage: null,
          browseHasMore: false,
          browseLoadingMore: false,
          browseFallbackAction: VodPlayerBrowseFallbackAction.closeBrowse,
        ),
      );
    }
  }

  Future<_VodPlayerBrowseResult> _fetchBrowsePage(
    String channelId, {
    required int page,
  }) async {
    final channel = _browseChannelForActiveSlot(channelId);
    final videoPage = await channelRepository.getChannelVideos(
      channelId: channelId,
      page: page,
      size: _browsePageSize,
    );

    return _VodPlayerBrowseResult(
      items: [
        for (final video in videoPage.items)
          _vodFromChannelVideo(video, channel),
      ],
      nextPage: _nextPageFor(videoPage),
    );
  }

  VodChannel _browseChannelForActiveSlot(String channelId) {
    final slot = state.activeSlot;
    final detailChannel = slot.detail?.channel;
    if (detailChannel != null && detailChannel.channelId == channelId) {
      return detailChannel;
    }

    return VodChannel(
      channelId: channelId,
      channelName: slot.channelName ?? channelId,
      channelImageUrl: detailChannel?.channelImageUrl,
      verifiedMark: slot.channelVerified,
    );
  }

  bool _isCurrentBrowseRequest(int requestSerial, String channelId) {
    return requestSerial == _browseRequestSerial &&
        state.overlayMode == VodPlayerOverlayMode.browse &&
        state.activeSlot.channelId == channelId;
  }
}

VodPlayerState _browseLoadingState(VodPlayerState state) {
  return state.copyWith(
    overlayMode: VodPlayerOverlayMode.browse,
    browseStatus: VodPlayerBrowseLoadStatus.loading,
    browseItems: const [],
    browseNextPage: null,
    browseHasMore: false,
    browseLoadingMore: false,
    browseFallbackAction: VodPlayerBrowseFallbackAction.none,
  );
}

Vod _vodFromChannelVideo(ChannelVideo video, VodChannel channel) {
  return Vod(
    videoNo: video.videoNo,
    videoId: video.videoId,
    title: video.title,
    videoType: video.videoType,
    publishDate: video.publishDate,
    thumbnailImageUrl: video.thumbnailImageUrl,
    duration: video.duration,
    readCount: video.readCount,
    publishDateAt: video.publishDateAt,
    categoryValue: video.categoryValue,
    adult: video.adult,
    livePv: video.livePv,
    tags: video.tags,
    channel: channel,
    blindType: video.blindType,
    watchTimeline: video.watchTimeline,
  );
}

int? _nextPageFor(ChannelVideoPage page) {
  final nextPage = page.page + 1;
  if (page.totalPages <= 0 || nextPage >= page.totalPages) {
    return null;
  }

  return nextPage;
}

final class _VodPlayerBrowseResult {
  const _VodPlayerBrowseResult({
    this.items = const [],
    this.nextPage,
  });

  final List<Vod> items;
  final int? nextPage;
}
