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
    );

Map<String, dynamic> _$$AccessTokenImplToJson(_$AccessTokenImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'realNameAuth': instance.realNameAuth,
      'extraToken': instance.extraToken,
    };
