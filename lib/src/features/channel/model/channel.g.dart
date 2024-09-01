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
      personalData: json['personalData'] == null
          ? null
          : PersonalData.fromJson(json['personalData'] as Map<String, dynamic>),
      followerCount: (json['followerCount'] as num?)?.toInt(),
      openLive: json['openLive'] as bool?,
      channelType: json['channelType'] as String?,
      channelDescription: json['channelDescription'] as String?,
    );

Map<String, dynamic> _$$ChannelImplToJson(_$ChannelImpl instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
      'personalData': instance.personalData,
      'followerCount': instance.followerCount,
      'openLive': instance.openLive,
      'channelType': instance.channelType,
      'channelDescription': instance.channelDescription,
    };

_$PersonalDataImpl _$$PersonalDataImplFromJson(Map<String, dynamic> json) =>
    _$PersonalDataImpl(
      following: json['following'] == null
          ? null
          : PersonalFollowing.fromJson(
              json['following'] as Map<String, dynamic>),
      privateUserBlock: json['privateUserBlock'] as bool,
      subscription: json['subscription'] as bool?,
    );

Map<String, dynamic> _$$PersonalDataImplToJson(_$PersonalDataImpl instance) =>
    <String, dynamic>{
      'following': instance.following,
      'privateUserBlock': instance.privateUserBlock,
      'subscription': instance.subscription,
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
