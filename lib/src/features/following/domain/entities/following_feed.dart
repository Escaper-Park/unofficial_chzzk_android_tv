import 'package:freezed_annotation/freezed_annotation.dart';

part 'following_feed.freezed.dart';

@freezed
abstract class FollowingChannelPage with _$FollowingChannelPage {
  const factory FollowingChannelPage({
    @Default(<FollowingChannel>[]) List<FollowingChannel> items,
    @Default(0) int totalCount,
    @Default(0) int totalPages,
  }) = _FollowingChannelPage;
}

@freezed
abstract class FollowingLivePage with _$FollowingLivePage {
  const factory FollowingLivePage({
    @Default(<FollowingChannel>[]) List<FollowingChannel> items,
    int? totalCount,
    int? totalLiveCount,
    int? totalPages,
  }) = _FollowingLivePage;
}

@freezed
abstract class FollowingChannel with _$FollowingChannel {
  const factory FollowingChannel({
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    required bool verifiedMark,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    FollowingPersonalData? personalData,
    FollowingLiveInfo? liveInfo,
    required bool openLive,
  }) = _FollowingChannel;
}

@freezed
abstract class FollowingLiveInfo with _$FollowingLiveInfo {
  const factory FollowingLiveInfo({
    int? liveId,
    String? title,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    @Default(0) int concurrentUserCount,
    required bool adult,
    @Default(<String>[]) List<String> tags,
    String? categoryValue,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
  }) = _FollowingLiveInfo;
}

@freezed
abstract class FollowingPersonalData with _$FollowingPersonalData {
  const factory FollowingPersonalData({
    required bool following,
    required bool notification,
    String? followDate,
    required bool privateUserBlock,
  }) = _FollowingPersonalData;
}
