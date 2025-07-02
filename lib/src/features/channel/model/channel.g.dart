// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChannelImpl _$$ChannelImplFromJson(Map<String, dynamic> json) =>
    _$ChannelImpl(
      channelId: json['channelId'] as String,
      channelName: json['channelName'] as String,
      channelImageUrl: json['channelImageUrl'] as String?,
      verifiedMark: json['verifiedMark'] as bool,
      activatedChannelBadgeIds:
          (json['activatedChannelBadgeIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      personalData: json['personalData'] == null
          ? null
          : PersonalData.fromJson(json['personalData'] as Map<String, dynamic>),
      channelType: json['channelType'] as String?,
      channelDescription: json['channelDescription'] as String?,
      followerCount: (json['followerCount'] as num?)?.toInt(),
      openLive: json['openLive'] as bool?,
    );

Map<String, dynamic> _$$ChannelImplToJson(_$ChannelImpl instance) =>
    <String, dynamic>{
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

_$PersonalDataImpl _$$PersonalDataImplFromJson(Map<String, dynamic> json) =>
    _$PersonalDataImpl(
      following: json['following'] == null
          ? null
          : PersonalFollowing.fromJson(
              json['following'] as Map<String, dynamic>),
      privateUserBlock: json['privateUserBlock'] as bool,
    );

Map<String, dynamic> _$$PersonalDataImplToJson(_$PersonalDataImpl instance) =>
    <String, dynamic>{
      'following': instance.following,
      'privateUserBlock': instance.privateUserBlock,
    };

_$PersonalFollowingImpl _$$PersonalFollowingImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalFollowingImpl(
      following: json['following'] as bool,
      notification: json['notification'] as bool,
      followDate: json['followDate'] as String?,
    );

Map<String, dynamic> _$$PersonalFollowingImplToJson(
        _$PersonalFollowingImpl instance) =>
    <String, dynamic>{
      'following': instance.following,
      'notification': instance.notification,
      'followDate': instance.followDate,
    };
