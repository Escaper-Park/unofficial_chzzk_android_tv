import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel.g.dart';

@JsonSerializable()
class BaseChannel {
  final String channelId;
  final String channelName;
  final String? channelImageUrl;
  final bool verifiedMark;

  BaseChannel(
    this.channelId,
    this.channelName,
    this.channelImageUrl,
    this.verifiedMark,
  );

  factory BaseChannel.fromJson(Map<String, dynamic> json) =>
      _$BaseChannelFromJson(json);
}

@JsonSerializable()
class Channel extends BaseChannel {
  final String? channelType;
  final String channelDescription;
  final int followerCount;
  final bool openLive;

  Channel(
    super.channelId,
    super.channelName,
    super.channelImageUrl,
    super.verifiedMark,
    this.channelType,
    this.channelDescription,
    this.followerCount,
    this.openLive,
  );

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

/// Use it with login.
@JsonSerializable()
class ChannelWithPersonalData extends BaseChannel {
  final PersonalData? personalData;

  ChannelWithPersonalData(
    super.channelId,
    super.channelName,
    super.channelImageUrl,
    super.verifiedMark,
    this.personalData,
  );

  factory ChannelWithPersonalData.fromJson(Map<String, dynamic> json) =>
      _$ChannelWithPersonalDataFromJson(json);
}

@JsonSerializable()
class PersonalData {
  final ChannelFollowing? following;
  final bool? privateUserBlock;

  PersonalData(this.following, this.privateUserBlock);

  factory PersonalData.fromJson(Map<String, dynamic> json) =>
      _$PersonalDataFromJson(json);
}

@JsonSerializable()
class ChannelFollowing {
  final bool following;
  final bool notification;
  final String? followDate;

  ChannelFollowing(this.following, this.notification, this.followDate);

  factory ChannelFollowing.fromJson(Map<String, dynamic> json) =>
      _$ChannelFollowingFromJson(json);
}

@JsonSerializable()
class Streamer {
  final bool openLive;

  Streamer(this.openLive);

  factory Streamer.fromJson(Map<String, dynamic> json) =>
      _$StreamerFromJson(json);
}

@JsonSerializable()
class LiveInfo {
  final String? liveTitle;
  final int concurrentUserCount;
  final String? liveCategoryValue;

  LiveInfo(
    this.liveTitle,
    this.concurrentUserCount,
    this.liveCategoryValue,
  );

  factory LiveInfo.fromJson(Map<String, dynamic> json) =>
      _$LiveInfoFromJson(json);
}
