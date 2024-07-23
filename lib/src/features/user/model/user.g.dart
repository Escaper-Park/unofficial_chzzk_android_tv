// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userIdHash: json['userIdHash'] as String,
      nickname: json['nickname'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      hasProfile: json['hasProfile'] as bool,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userIdHash': instance.userIdHash,
      'nickname': instance.nickname,
      'profileImageUrl': instance.profileImageUrl,
      'hasProfile': instance.hasProfile,
    };
