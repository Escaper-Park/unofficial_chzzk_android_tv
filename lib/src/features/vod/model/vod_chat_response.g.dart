// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VodChatResponse _$VodChatResponseFromJson(Map<String, dynamic> json) =>
    VodChatResponse(
      nextPlayerMessageTime: (json['nextPlayerMessageTime'] as num?)?.toInt(),
      previousVideoChats: (json['previousVideoChats'] as List<dynamic>?)
          ?.map((e) => VodChat.fromJson(e as Map<String, dynamic>))
          .toList(),
      videoChats: (json['videoChats'] as List<dynamic>?)
          ?.map((e) => VodChat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VodChatResponseToJson(VodChatResponse instance) =>
    <String, dynamic>{
      'nextPlayerMessageTime': instance.nextPlayerMessageTime,
      'previousVideoChats': instance.previousVideoChats,
      'videoChats': instance.videoChats,
    };
