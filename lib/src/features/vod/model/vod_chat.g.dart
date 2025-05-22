// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VodChat _$VodChatFromJson(Map<String, dynamic> json) => VodChat(
      chatChannelId: json['chatChannelId'] as String,
      messageTime: (json['messageTime'] as num).toInt(),
      userIdHash: json['userIdHash'] as String,
      content: json['content'] as String,
      extras: _$JsonConverterFromJson<String, Extras>(
          json['extras'], const ExtrasConverter().fromJson),
      messageTypeCode: (json['messageTypeCode'] as num).toInt(),
      messageStatusType: json['messageStatusType'] as String,
      profile: _$JsonConverterFromJson<String, Profile>(
          json['profile'], const ProfileConverter().fromJson),
      playerMessageTime: (json['playerMessageTime'] as num).toInt(),
    );

Map<String, dynamic> _$VodChatToJson(VodChat instance) => <String, dynamic>{
      'chatChannelId': instance.chatChannelId,
      'messageTime': instance.messageTime,
      'userIdHash': instance.userIdHash,
      'content': instance.content,
      'extras': _$JsonConverterToJson<String, Extras>(
          instance.extras, const ExtrasConverter().toJson),
      'messageTypeCode': instance.messageTypeCode,
      'messageStatusType': instance.messageStatusType,
      'profile': _$JsonConverterToJson<String, Profile>(
          instance.profile, const ProfileConverter().toJson),
      'playerMessageTime': instance.playerMessageTime,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
