// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      svcid: json['svcid'] as String,
      ver: json['ver'] as String,
      bdy: (json['bdy'] as List<dynamic>)
          .map((e) => ChatBdy.fromJson(e as Map<String, dynamic>))
          .toList(),
      cmd: (json['cmd'] as num).toInt(),
      tid: json['tid'] as String?,
      cid: json['cid'] as String?,
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      'svcid': instance.svcid,
      'ver': instance.ver,
      'bdy': instance.bdy,
      'cmd': instance.cmd,
      'tid': instance.tid,
      'cid': instance.cid,
    };

_$ChatBdyImpl _$$ChatBdyImplFromJson(Map<String, dynamic> json) =>
    _$ChatBdyImpl(
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

Map<String, dynamic> _$$ChatBdyImplToJson(_$ChatBdyImpl instance) =>
    <String, dynamic>{
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
