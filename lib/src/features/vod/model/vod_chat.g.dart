// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VodChatImpl _$$VodChatImplFromJson(Map<String, dynamic> json) =>
    _$VodChatImpl(
      chatChannelId: json['chatChannelId'] as String,
      messageTime: (json['messageTime'] as num).toInt(),
      userIdHash: json['userIdHash'] as String,
      content: json['content'] as String,
      extras: extrasFromJson(json['extras'] as String?),
      messageTypeCode: (json['messageTypeCode'] as num).toInt(),
      messageStatusType: json['messageStatusType'] as String,
      profile: profileFromJson(json['profile'] as String?),
      playerMessageTime: (json['playerMessageTime'] as num).toInt(),
    );

Map<String, dynamic> _$$VodChatImplToJson(_$VodChatImpl instance) =>
    <String, dynamic>{
      'chatChannelId': instance.chatChannelId,
      'messageTime': instance.messageTime,
      'userIdHash': instance.userIdHash,
      'content': instance.content,
      'extras': instance.extras,
      'messageTypeCode': instance.messageTypeCode,
      'messageStatusType': instance.messageStatusType,
      'profile': instance.profile,
      'playerMessageTime': instance.playerMessageTime,
    };

_$VodChatResponseImpl _$$VodChatResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VodChatResponseImpl(
      nextPlayerMessageTime: (json['nextPlayerMessageTime'] as num?)?.toInt(),
      previousVideoChats: (json['previousVideoChats'] as List<dynamic>?)
          ?.map((e) => VodChat.fromJson(e as Map<String, dynamic>))
          .toList(),
      videoChats: (json['videoChats'] as List<dynamic>?)
          ?.map((e) => VodChat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VodChatResponseImplToJson(
        _$VodChatResponseImpl instance) =>
    <String, dynamic>{
      'nextPlayerMessageTime': instance.nextPlayerMessageTime,
      'previousVideoChats': instance.previousVideoChats,
      'videoChats': instance.videoChats,
    };
