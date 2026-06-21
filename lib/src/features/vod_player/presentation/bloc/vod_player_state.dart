part of 'vod_player_bloc.dart';

enum VodPlayerOverlayMode {
  none,
  controls,
  browse,
}

enum VodPlayerSlotStatus {
  empty,
  loadingSource,
  ready,
  playing,
  ended,
  failure,
}

enum VodPlayerFailureReason {
  missingInitialTarget,
  detailLoadFailed,
  entryBlocked,
  playbackSourceMissing,
  playbackFailed,
}

enum VodPlayerBrowseLoadStatus {
  initial,
  loading,
  success,
  empty,
  failure,
}

enum VodPlayerBrowseFallbackAction {
  none,
  closeBrowse,
}

enum VodPlayerFeedbackType {
  followSuccess,
  followFailure,
  unfollowSuccess,
  unfollowFailure,
  groupAddSuccess,
  groupAddAlreadyExists,
  groupAddFailure,
  browseLoadMoreFailure,
}

@freezed
abstract class VodPlayerState with _$VodPlayerState {
  const VodPlayerState._();

  const factory VodPlayerState({
    @Default(VodPlayerOverlayMode.none) VodPlayerOverlayMode overlayMode,
    required String activeSlotId,
    required String primarySlotId,
    required List<VodPlayerSlotState> slots,
    @Default(defaultSettingsPreferences)
    SettingsPreferences settingsPreferences,
    @Default(defaultGroupCollection) GroupCollection groupCollection,
    @Default(1.0) double playbackSpeed,
    @Default(VodPlayerBrowseLoadStatus.initial)
    VodPlayerBrowseLoadStatus browseStatus,
    @Default(<Vod>[]) List<Vod> browseItems,
    int? browseNextPage,
    @Default(false) bool browseHasMore,
    @Default(false) bool browseLoadingMore,
    @Default(VodPlayerBrowseFallbackAction.none)
    VodPlayerBrowseFallbackAction browseFallbackAction,
    VodPlayerFeedbackType? feedbackType,
    @Default(0) int feedbackSerial,
  }) = _VodPlayerState;

  factory VodPlayerState.initial() {
    return const VodPlayerState(
      activeSlotId: _primarySlotId,
      primarySlotId: _primarySlotId,
      slots: [
        VodPlayerSlotState(slotId: _primarySlotId),
      ],
    );
  }

  VodPlayerSlotState get activeSlot {
    return slotById(activeSlotId) ?? slots.first;
  }

  VodPlayerSlotState? slotById(String slotId) {
    for (final slot in slots) {
      if (slot.slotId == slotId) {
        return slot;
      }
    }

    return null;
  }
}

@freezed
abstract class VodPlayerSlotState with _$VodPlayerSlotState {
  const VodPlayerSlotState._();

  const factory VodPlayerSlotState({
    required String slotId,
    @Default(VodPlayerSlotStatus.empty) VodPlayerSlotStatus status,
    int? videoNo,
    String? videoId,
    String? fallbackTitle,
    String? fallbackThumbnailImageUrl,
    String? fallbackChannelId,
    String? fallbackChannelName,
    @Default(false) bool fallbackChannelVerified,
    VodDetail? detail,
    Uri? playbackUri,
    VodPlaybackCache? playbackCache,
    VodSeekThumbnail? seekThumbnail,
    @Default(<int>[VodPlaybackResolutionOptions.autoIndex])
    List<int> availableResolutionIndexes,
    @Default(PlayerVideoViewType.textureView) PlayerVideoViewType videoViewType,
    @Default(Duration.zero) Duration position,
    @Default(Duration.zero) Duration duration,
    @Default(Duration.zero) Duration startPosition,
    ChannelMyInfo? channelMyInfo,
    VodPlayerFailureReason? failureReason,
  }) = _VodPlayerSlotState;

  String? get title {
    return detail?.title ?? fallbackTitle;
  }

  String? get thumbnailImageUrl {
    return detail?.thumbnailImageUrl ?? fallbackThumbnailImageUrl;
  }

  List<String> get tags {
    return detail?.tags ?? const [];
  }

  List<VodChapter> get chapters {
    return detail?.chapters ?? const [];
  }

  String? get channelId {
    return _nonBlank(detail?.channel?.channelId) ??
        _nonBlank(fallbackChannelId);
  }

  String? get channelName {
    return _nonBlank(detail?.channel?.channelName) ??
        _nonBlank(fallbackChannelName);
  }

  bool get channelVerified {
    return detail?.channel?.verifiedMark ?? fallbackChannelVerified;
  }

  int get durationSeconds {
    final detailDuration = detail?.duration;
    if (detailDuration != null && detailDuration > 0) {
      return detailDuration;
    }

    return duration.inSeconds;
  }

  double get progress {
    final totalSeconds = durationSeconds;
    if (totalSeconds <= 0) {
      return 0;
    }

    return (position.inMilliseconds / (totalSeconds * 1000))
        .clamp(0, 1)
        .toDouble();
  }

  bool get isFollowing {
    return channelMyInfo?.following?.following ?? false;
  }

  bool get canToggleFollowing {
    return channelMyInfo?.following != null;
  }
}

const _primarySlotId = 'primary';
