// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecentChatImpl _$$RecentChatImplFromJson(Map<String, dynamic> json) =>
    _$RecentChatImpl(
      svcid: json['svcid'] as String,
      bdy: (json['bdy'] as List<dynamic>)
          .map((e) => RecentChatBdy.fromJson(e as Map<String, dynamic>))
          .toList(),
      cmd: (json['cmd'] as num).toInt(),
      retCode: (json['retCode'] as num).toInt(),
      retMsg: json['retMsg'] as String?,
      tid: json['tid'] as String?,
      cid: json['cid'] as String?,
    );

Map<String, dynamic> _$$RecentChatImplToJson(_$RecentChatImpl instance) =>
    <String, dynamic>{
      'svcid': instance.svcid,
      'bdy': instance.bdy,
      'cmd': instance.cmd,
      'retCode': instance.retCode,
      'retMsg': instance.retMsg,
      'tid': instance.tid,
      'cid': instance.cid,
    };

_$RecentChatBdyImpl _$$RecentChatBdyImplFromJson(Map<String, dynamic> json) =>
    _$RecentChatBdyImpl(
      messageList: (json['messageList'] as List<dynamic>)
          .map((e) => RecentChatMsg.fromJson(e as Map<String, dynamic>))
          .toList(),
      userCount: (json['userCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RecentChatBdyImplToJson(_$RecentChatBdyImpl instance) =>
    <String, dynamic>{
      'messageList': instance.messageList,
      'userCount': instance.userCount,
    };

_$RecentChatMsgImpl _$$RecentChatMsgImplFromJson(Map<String, dynamic> json) =>
    _$RecentChatMsgImpl(
      serviceId: json['serviceId'] as String,
      channelId: json['channelId'] as String,
      messageTime: (json['messageTime'] as num).toInt(),
      userId: json['userId'] as String,
      profile: _$JsonConverterFromJson<String, Profile>(
          json['profile'], const ProfileConverter().fromJson),
      content: json['content'] as String,
      extras: _$JsonConverterFromJson<String, Extras>(
          json['extras'], const ExtrasConverter().fromJson),
      memberCount: (json['memberCount'] as num).toInt(),
      messageTypeCode: (json['messageTypeCode'] as num).toInt(),
      messageStatusType: json['messageStatusType'] as String,
      createTime: (json['createTime'] as num).toInt(),
      updateTime: (json['updateTime'] as num).toInt(),
    );

Map<String, dynamic> _$$RecentChatMsgImplToJson(_$RecentChatMsgImpl instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'channelId': instance.channelId,
      'messageTime': instance.messageTime,
      'userId': instance.userId,
      'profile': _$JsonConverterToJson<String, Profile>(
          instance.profile, const ProfileConverter().toJson),
      'content': instance.content,
      'extras': _$JsonConverterToJson<String, Extras>(
          instance.extras, const ExtrasConverter().toJson),
      'memberCount': instance.memberCount,
      'messageTypeCode': instance.messageTypeCode,
      'messageStatusType': instance.messageStatusType,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
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
