// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userIdHash: json['userIdHash'] as String?,
      hasProfile: json['hasProfile'] as bool,
      nickname: json['nickname'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userIdHash': instance.userIdHash,
      'hasProfile': instance.hasProfile,
      'nickname': instance.nickname,
      'profileImageUrl': instance.profileImageUrl,
    };
