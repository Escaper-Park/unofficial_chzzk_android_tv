// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      channelId: json['channelId'] as String,
      channelName: json['channelName'] as String,
      channelImageUrl: json['channelImageUrl'] as String?,
      verifiedMark: json['verifiedMark'] as bool,
      personalData: json['personalData'] == null
          ? null
          : PersonalData.fromJson(json['personalData'] as Map<String, dynamic>),
      activatedChannelBadgeIds:
          (json['activatedChannelBadgeIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      channelType: json['channelType'] as String?,
      channelDescription: json['channelDescription'] as String?,
      followerCount: (json['followerCount'] as num?)?.toInt(),
      openLive: json['openLive'] as bool?,
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
      'activatedChannelBadgeIds': instance.activatedChannelBadgeIds,
      'personalData': instance.personalData,
      'channelType': instance.channelType,
      'channelDescription': instance.channelDescription,
      'followerCount': instance.followerCount,
      'openLive': instance.openLive,
    };

PersonalData _$PersonalDataFromJson(Map<String, dynamic> json) => PersonalData(
      following: json['following'] == null
          ? null
          : PersonalFollowing.fromJson(
              json['following'] as Map<String, dynamic>),
      privateUserBlock: json['privateUserBlock'] as bool,
    );

Map<String, dynamic> _$PersonalDataToJson(PersonalData instance) =>
    <String, dynamic>{
      'following': instance.following,
      'privateUserBlock': instance.privateUserBlock,
    };

PersonalFollowing _$PersonalFollowingFromJson(Map<String, dynamic> json) =>
    PersonalFollowing(
      following: json['following'] as bool,
      notification: json['notification'] as bool,
      followDate: json['followDate'] as String?,
    );

Map<String, dynamic> _$PersonalFollowingToJson(PersonalFollowing instance) =>
    <String, dynamic>{
      'following': instance.following,
      'notification': instance.notification,
      'followDate': instance.followDate,
    };
