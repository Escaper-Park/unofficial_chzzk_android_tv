// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      svcid: json['svcid'] as String,
      ver: json['ver'] as String,
      bdy: (json['bdy'] as List<dynamic>)
          .map((e) => ChatBdy.fromJson(e as Map<String, dynamic>))
          .toList(),
      cmd: (json['cmd'] as num).toInt(),
      tid: json['tid'] as String?,
      cid: json['cid'] as String?,
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'svcid': instance.svcid,
      'ver': instance.ver,
      'bdy': instance.bdy.map((e) => e.toJson()).toList(),
      'cmd': instance.cmd,
      'tid': instance.tid,
      'cid': instance.cid,
    };

ChatBdy _$ChatBdyFromJson(Map<String, dynamic> json) => ChatBdy(
      svcid: json['svcid'] as String,
      cid: json['cid'] as String,
      mbrCnt: (json['mbrCnt'] as num).toInt(),
      uid: json['uid'] as String,
      profile: _$JsonConverterFromJson<String, Profile>(
          json['profile'], const ProfileConverter().fromJson),
      msg: json['msg'] as String,
      msgTypeCode: (json['msgTypeCode'] as num).toInt(),
      msgStatusType: json['msgStatusType'] as String,
      extras: _$JsonConverterFromJson<String, Extras>(
          json['extras'], const ExtrasConverter().fromJson),
      ctime: (json['ctime'] as num).toInt(),
      utime: (json['utime'] as num).toInt(),
      msgTime: (json['msgTime'] as num).toInt(),
    );

Map<String, dynamic> _$ChatBdyToJson(ChatBdy instance) => <String, dynamic>{
      'svcid': instance.svcid,
      'cid': instance.cid,
      'mbrCnt': instance.mbrCnt,
      'uid': instance.uid,
      'profile': _$JsonConverterToJson<String, Profile>(
          instance.profile, const ProfileConverter().toJson),
      'msg': instance.msg,
      'msgTypeCode': instance.msgTypeCode,
      'msgStatusType': instance.msgStatusType,
      'extras': _$JsonConverterToJson<String, Extras>(
          instance.extras, const ExtrasConverter().toJson),
      'ctime': instance.ctime,
      'utime': instance.utime,
      'msgTime': instance.msgTime,
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
