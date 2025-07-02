// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      hasProfile: json['hasProfile'] as bool,
      userIdHash: json['userIdHash'] as String?,
      nickname: json['nickname'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      verifiedMark: json['verifiedMark'] as bool,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'hasProfile': instance.hasProfile,
      'userIdHash': instance.userIdHash,
      'nickname': instance.nickname,
      'profileImageUrl': instance.profileImageUrl,
      'verifiedMark': instance.verifiedMark,
    };
