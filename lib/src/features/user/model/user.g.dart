// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      hasProfile: json['hasProfile'] as bool,
      userIdHash: json['userIdHash'] as String?,
      nickname: json['nickname'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      verifiedMark: json['verifiedMark'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'hasProfile': instance.hasProfile,
      'userIdHash': instance.userIdHash,
      'nickname': instance.nickname,
      'profileImageUrl': instance.profileImageUrl,
      'verifiedMark': instance.verifiedMark,
    };
