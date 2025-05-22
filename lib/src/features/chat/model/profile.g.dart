// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      userIdHash: json['userIdHash'] as String?,
      nickname: json['nickname'] as String?,
      userRoleCode: json['userRoleCode'] as String?,
      badge: json['badge'] == null
          ? null
          : ChzzkBadge.fromJson(json['badge'] as Map<String, dynamic>),
      verifiedMark: json['verifiedMark'] as bool?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'userIdHash': instance.userIdHash,
      'nickname': instance.nickname,
      'userRoleCode': instance.userRoleCode,
      'badge': instance.badge,
      'verifiedMark': instance.verifiedMark,
    };

ChzzkBadge _$ChzzkBadgeFromJson(Map<String, dynamic> json) => ChzzkBadge(
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ChzzkBadgeToJson(ChzzkBadge instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
    };
