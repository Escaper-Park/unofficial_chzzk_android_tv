// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccessTokenImpl _$$AccessTokenImplFromJson(Map<String, dynamic> json) =>
    _$AccessTokenImpl(
      accessToken: json['accessToken'] as String,
      realNameAuth: json['realNameAuth'] as bool,
      extraToken: json['extraToken'] as String,
      temporaryRestrict: TemporaryRestrict.fromJson(
          json['temporaryRestrict'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AccessTokenImplToJson(_$AccessTokenImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'realNameAuth': instance.realNameAuth,
      'extraToken': instance.extraToken,
      'temporaryRestrict': instance.temporaryRestrict,
    };

_$TemporaryRestrictImpl _$$TemporaryRestrictImplFromJson(
        Map<String, dynamic> json) =>
    _$TemporaryRestrictImpl(
      temporaryRestrict: json['temporaryRestrict'] as bool,
      times: (json['times'] as num).toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      createdTime: (json['createdTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TemporaryRestrictImplToJson(
        _$TemporaryRestrictImpl instance) =>
    <String, dynamic>{
      'temporaryRestrict': instance.temporaryRestrict,
      'times': instance.times,
      'duration': instance.duration,
      'createdTime': instance.createdTime,
    };
