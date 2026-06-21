// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatAccessTokenDto _$ChatAccessTokenDtoFromJson(Map<String, dynamic> json) =>
    _ChatAccessTokenDto(
      accessToken: json['accessToken'] as String,
      extraToken: json['extraToken'] as String,
    );

Map<String, dynamic> _$ChatAccessTokenDtoToJson(_ChatAccessTokenDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'extraToken': instance.extraToken,
    };

_VideoChatListDto _$VideoChatListDtoFromJson(
  Map<String, dynamic> json,
) => _VideoChatListDto(
  nextPlayerMessageTime: (json['nextPlayerMessageTime'] as num?)?.toInt(),
  previousVideoChats:
      (json['previousVideoChats'] as List<dynamic>?)
          ?.map((e) => VideoChatMessageDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <VideoChatMessageDto>[],
  videoChats:
      (json['videoChats'] as List<dynamic>?)
          ?.map((e) => VideoChatMessageDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <VideoChatMessageDto>[],
);

Map<String, dynamic> _$VideoChatListDtoToJson(_VideoChatListDto instance) =>
    <String, dynamic>{
      'nextPlayerMessageTime': instance.nextPlayerMessageTime,
      'previousVideoChats': instance.previousVideoChats,
      'videoChats': instance.videoChats,
    };

_VideoChatMessageDto _$VideoChatMessageDtoFromJson(Map<String, dynamic> json) =>
    _VideoChatMessageDto(
      chatChannelId: json['chatChannelId'] as String? ?? '',
      content: json['content'] as String? ?? '',
      extras: json['extras'],
      messageStatusType: json['messageStatusType'] as String? ?? '',
      messageTime: (json['messageTime'] as num?)?.toInt() ?? 0,
      messageTypeCode: (json['messageTypeCode'] as num?)?.toInt() ?? 0,
      playerMessageTime: (json['playerMessageTime'] as num?)?.toInt() ?? 0,
      profile: json['profile'],
      userIdHash: json['userIdHash'] as String? ?? '',
    );

Map<String, dynamic> _$VideoChatMessageDtoToJson(
  _VideoChatMessageDto instance,
) => <String, dynamic>{
  'chatChannelId': instance.chatChannelId,
  'content': instance.content,
  'extras': instance.extras,
  'messageStatusType': instance.messageStatusType,
  'messageTime': instance.messageTime,
  'messageTypeCode': instance.messageTypeCode,
  'playerMessageTime': instance.playerMessageTime,
  'profile': instance.profile,
  'userIdHash': instance.userIdHash,
};
