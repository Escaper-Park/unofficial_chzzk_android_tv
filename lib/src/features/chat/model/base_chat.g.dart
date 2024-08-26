// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseChatImpl _$$BaseChatImplFromJson(Map<String, dynamic> json) =>
    _$BaseChatImpl(
      msg: json['msg'] as String,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      extras: json['extras'] == null
          ? null
          : Extras.fromJson(json['extras'] as Map<String, dynamic>),
      ctime: (json['ctime'] as num).toInt(),
    );

Map<String, dynamic> _$$BaseChatImplToJson(_$BaseChatImpl instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'profile': instance.profile,
      'extras': instance.extras,
      'ctime': instance.ctime,
    };
