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
      followerCount: json['followerCount'] as int?,
      channelDescription: json['channelDescription'] as String?,
      openLive: json['openLive'] as bool?,
      personalData: json['personalData'] == null
          ? null
          : PersonalData.fromJson(json['personalData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChannelImplToJson(_$ChannelImpl instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
      'followerCount': instance.followerCount,
      'channelDescription': instance.channelDescription,
      'openLive': instance.openLive,
      'personalData': instance.personalData,
    };

_$PersonalDataImpl _$$PersonalDataImplFromJson(Map<String, dynamic> json) =>
    _$PersonalDataImpl(
      privateUserBlock: json['privateUserBlock'] as bool,
    );

Map<String, dynamic> _$$PersonalDataImplToJson(_$PersonalDataImpl instance) =>
    <String, dynamic>{
      'privateUserBlock': instance.privateUserBlock,
    };
