import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel.g.dart';
part 'channel.freezed.dart';

@freezed
@JsonSerializable()
class Channel with _$Channel {
  /* Required */
  final String channelId;
  final String channelName;
  final String? channelImageUrl;
  final bool verifiedMark;
  final List<String>? activatedChannelBadgeIds;

  /* Optional */
  final PersonalData? personalData;
  final String? channelType;
  final String? channelDescription;
  final int? followerCount;
  final bool? openLive;

  Channel({
    required this.channelId,
    required this.channelName,
    required this.channelImageUrl,
    required this.verifiedMark,
    this.personalData,
    this.activatedChannelBadgeIds,
    this.channelType,
    this.channelDescription,
    this.followerCount,
    this.openLive,
  });

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);

  Map<String, Object?> toJson() => _$ChannelToJson(this);
}

/* Use it in the following list.*/
@freezed
@JsonSerializable()
class PersonalData with _$PersonalData {
  final PersonalFollowing? following;
  final bool privateUserBlock;

  PersonalData({
    this.following,
    required this.privateUserBlock,
  });

  factory PersonalData.fromJson(Map<String, dynamic> json) =>
      _$PersonalDataFromJson(json);

  Map<String, Object?> toJson() => _$PersonalDataToJson(this);
}

@freezed
@JsonSerializable()
class PersonalFollowing with _$PersonalFollowing {
  final bool following;
  final bool notification;
  final String? followDate;

  PersonalFollowing({
    required this.following,
    required this.notification,
    this.followDate,
  });

  factory PersonalFollowing.fromJson(Map<String, dynamic> json) =>
      _$PersonalFollowingFromJson(json);

  Map<String, Object?> toJson() => _$PersonalFollowingToJson(this);
}
