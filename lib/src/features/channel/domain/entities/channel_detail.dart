import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_detail.freezed.dart';

@freezed
abstract class ChannelDetail with _$ChannelDetail {
  const factory ChannelDetail({
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    required bool verifiedMark,
    required int followerCount,
    required String description,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    required bool openLive,
    ChannelPersonalData? personalData,
  }) = _ChannelDetail;
}

@freezed
abstract class ChannelPersonalData with _$ChannelPersonalData {
  const factory ChannelPersonalData({
    ChannelPersonalFollowing? following,
    required bool privateUserBlock,
  }) = _ChannelPersonalData;
}

@freezed
abstract class ChannelPersonalFollowing with _$ChannelPersonalFollowing {
  const factory ChannelPersonalFollowing({
    required bool following,
    required bool notification,
    String? followDate,
  }) = _ChannelPersonalFollowing;
}
