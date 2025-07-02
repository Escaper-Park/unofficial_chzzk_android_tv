import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel.g.dart';
part 'channel.freezed.dart';

@freezed
class Channel with _$Channel {
  const factory Channel({
    /* Required */
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    required bool verifiedMark,
    List<String>? activatedChannelBadgeIds,

    /* Optional */
    PersonalData? personalData,
    String? channelType,
    String? channelDescription,
    int? followerCount,
    bool? openLive,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

/* Use it in the following list.*/
@freezed
class PersonalData with _$PersonalData {
  const factory PersonalData({
    PersonalFollowing? following,
    required bool privateUserBlock,
  }) = _PersonalData;

  factory PersonalData.fromJson(Map<String, dynamic> json) =>
      _$PersonalDataFromJson(json);
}

@freezed
class PersonalFollowing with _$PersonalFollowing {
  const factory PersonalFollowing({
    required bool following,
    required bool notification,
    String? followDate,
  }) = _PersonalFollowing;

  factory PersonalFollowing.fromJson(Map<String, dynamic> json) =>
      _$PersonalFollowingFromJson(json);
}
