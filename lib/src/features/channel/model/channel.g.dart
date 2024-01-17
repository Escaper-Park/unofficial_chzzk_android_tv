// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseChannel _$BaseChannelFromJson(Map<String, dynamic> json) => BaseChannel(
      json['channelId'] as String,
      json['channelName'] as String,
      json['channelImageUrl'] as String?,
      json['verifiedMark'] as bool,
    );

Map<String, dynamic> _$BaseChannelToJson(BaseChannel instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      json['channelId'] as String,
      json['channelName'] as String,
      json['channelImageUrl'] as String?,
      json['verifiedMark'] as bool,
      json['channelType'] as String?,
      json['channelDescription'] as String,
      json['followerCount'] as int,
      json['openLive'] as bool,
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
      'channelType': instance.channelType,
      'channelDescription': instance.channelDescription,
      'followerCount': instance.followerCount,
      'openLive': instance.openLive,
    };

ChannelWithPersonalData _$ChannelWithPersonalDataFromJson(
        Map<String, dynamic> json) =>
    ChannelWithPersonalData(
      json['channelId'] as String,
      json['channelName'] as String,
      json['channelImageUrl'] as String?,
      json['verifiedMark'] as bool,
      json['personalData'] == null
          ? null
          : PersonalData.fromJson(json['personalData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChannelWithPersonalDataToJson(
        ChannelWithPersonalData instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
      'personalData': instance.personalData,
    };

PersonalData _$PersonalDataFromJson(Map<String, dynamic> json) => PersonalData(
      json['following'] == null
          ? null
          : ChannelFollowing.fromJson(
              json['following'] as Map<String, dynamic>),
      json['privateUserBlock'] as bool?,
    );

Map<String, dynamic> _$PersonalDataToJson(PersonalData instance) =>
    <String, dynamic>{
      'following': instance.following,
      'privateUserBlock': instance.privateUserBlock,
    };

ChannelFollowing _$ChannelFollowingFromJson(Map<String, dynamic> json) =>
    ChannelFollowing(
      json['following'] as bool,
      json['notification'] as bool,
      json['followDate'] as String?,
    );

Map<String, dynamic> _$ChannelFollowingToJson(ChannelFollowing instance) =>
    <String, dynamic>{
      'following': instance.following,
      'notification': instance.notification,
      'followDate': instance.followDate,
    };

Streamer _$StreamerFromJson(Map<String, dynamic> json) => Streamer(
      json['openLive'] as bool,
    );

Map<String, dynamic> _$StreamerToJson(Streamer instance) => <String, dynamic>{
      'openLive': instance.openLive,
    };

LiveInfo _$LiveInfoFromJson(Map<String, dynamic> json) => LiveInfo(
      json['liveTitle'] as String?,
      json['concurrentUserCount'] as int,
      json['liveCategoryValue'] as String?,
    );

Map<String, dynamic> _$LiveInfoToJson(LiveInfo instance) => <String, dynamic>{
      'liveTitle': instance.liveTitle,
      'concurrentUserCount': instance.concurrentUserCount,
      'liveCategoryValue': instance.liveCategoryValue,
    };
