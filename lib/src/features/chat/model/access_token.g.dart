// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => AccessToken(
      accessToken: json['accessToken'] as String,
      realNameAuth: json['realNameAuth'] as bool,
      extraToken: json['extraToken'] as String,
    );

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'realNameAuth': instance.realNameAuth,
      'extraToken': instance.extraToken,
    };
