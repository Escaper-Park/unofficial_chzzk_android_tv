// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
