// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      userIdHash: json['userIdHash'] as String?,
      nickname: json['nickname'] as String?,
      userRoleCode: json['userRoleCode'] as String?,
      badge: json['badge'] == null
          ? null
          : ChzzkBadge.fromJson(json['badge'] as Map<String, dynamic>),
      verifiedMark: json['verifiedMark'] as bool?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'userIdHash': instance.userIdHash,
      'nickname': instance.nickname,
      'userRoleCode': instance.userRoleCode,
      'badge': instance.badge,
      'verifiedMark': instance.verifiedMark,
    };

_$ChzzkBadgeImpl _$$ChzzkBadgeImplFromJson(Map<String, dynamic> json) =>
    _$ChzzkBadgeImpl(
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$ChzzkBadgeImplToJson(_$ChzzkBadgeImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
    };
