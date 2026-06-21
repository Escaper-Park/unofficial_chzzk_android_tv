part of 'live_player_bloc.dart';

@freezed
abstract class LivePlayerSlotState with _$LivePlayerSlotState {
  const LivePlayerSlotState._();

  const factory LivePlayerSlotState({
    required String slotId,
    @Default(LivePlayerSlotStatus.empty) LivePlayerSlotStatus status,
    String? channelId,
    int? liveId,
    String? fallbackTitle,
    String? fallbackThumbnailImageUrl,
    LiveDetail? detail,
    LiveStatus? liveStatus,
    Uri? playbackUri,
    @Default(LivePlaybackResolutionOptions.allIndexes)
    List<int> availableResolutionIndexes,
    int? playbackLatencyIndex,
    int? playbackResolutionIndex,
    @Default(PlayerVideoViewType.textureView) PlayerVideoViewType videoViewType,
    LivePlayerFailureReason? failureReason,
  }) = _LivePlayerSlotState;

  String? get title {
    return liveStatus?.title ?? detail?.title ?? fallbackTitle;
  }

  String? get thumbnailImageUrl {
    return detail?.thumbnailImageUrl ??
        detail?.defaultThumbnailImageUrl ??
        fallbackThumbnailImageUrl;
  }

  List<String> get tags {
    return liveStatus?.tags ?? detail?.tags ?? const [];
  }

  int? get concurrentUserCount {
    return liveStatus?.concurrentUserCount ?? detail?.concurrentUserCount;
  }

  String? get openDate {
    return liveStatus?.openDate ?? detail?.openDate;
  }

  String? get channelName {
    return detail?.channel?.channelName;
  }

  String? get channelImageUrl {
    return detail?.channel?.channelImageUrl;
  }

  bool get channelVerified {
    return detail?.channel?.verifiedMark ?? false;
  }

  String? get chatChannelId {
    return liveStatus?.chatChannelId ?? detail?.chatChannelId;
  }

  String? get categoryType {
    return liveStatus?.categoryType ?? detail?.categoryType;
  }

  String? get categoryId {
    return liveStatus?.categoryId ?? detail?.categoryId;
  }

  String? get categoryValue {
    return liveStatus?.categoryValue ?? detail?.categoryValue;
  }

  List<String> get liveTokens {
    return liveStatus?.liveTokens ?? const <String>[];
  }
}
