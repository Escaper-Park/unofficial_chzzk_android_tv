// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extras.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtrasImpl _$$ExtrasImplFromJson(Map<String, dynamic> json) => _$ExtrasImpl(
      chatType: json['chatType'] as String?,
      emojis: (json['emojis'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      streamingChannelId: json['streamingChannelId'] as String?,
      isAnonymous: json['isAnonymous'] as bool?,
      nickname: json['nickname'] as String?,
      payAmount: (json['payAmount'] as num?)?.toInt(),
      donationType: json['donationType'] as String?,
    );

Map<String, dynamic> _$$ExtrasImplToJson(_$ExtrasImpl instance) =>
    <String, dynamic>{
      'chatType': instance.chatType,
      'emojis': instance.emojis,
      'streamingChannelId': instance.streamingChannelId,
      'isAnonymous': instance.isAnonymous,
      'nickname': instance.nickname,
      'payAmount': instance.payAmount,
      'donationType': instance.donationType,
    };
