// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MissionImpl _$$MissionImplFromJson(Map<String, dynamic> json) =>
    _$MissionImpl(
      missionDonationId: json['missionDonationId'] as String,
      missionText: json['missionText'] as String,
      channelId: json['channelId'] as String,
      missionType: json['missionType'] as String,
      amount: (json['amount'] as num).toInt(),
      failCheeringRate: (json['failCheeringRate'] as num).toInt(),
      status: json['status'] as String,
      missionDurationTime: (json['missionDurationTime'] as num).toInt(),
      missionStartTime: json['missionStartTime'] as String,
      missionEndTime: json['missionEndTime'] as String,
      createdTime: json['createdTime'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      channel: json['channel'] as String?,
      anonymous: json['anonymous'] as bool,
      createdBadge: json['createdBadge'],
    );

Map<String, dynamic> _$$MissionImplToJson(_$MissionImpl instance) =>
    <String, dynamic>{
      'missionDonationId': instance.missionDonationId,
      'missionText': instance.missionText,
      'channelId': instance.channelId,
      'missionType': instance.missionType,
      'amount': instance.amount,
      'failCheeringRate': instance.failCheeringRate,
      'status': instance.status,
      'missionDurationTime': instance.missionDurationTime,
      'missionStartTime': instance.missionStartTime,
      'missionEndTime': instance.missionEndTime,
      'createdTime': instance.createdTime,
      'user': instance.user,
      'channel': instance.channel,
      'anonymous': instance.anonymous,
      'createdBadge': instance.createdBadge,
    };
