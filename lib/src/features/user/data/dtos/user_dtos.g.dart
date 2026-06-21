// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStatusDto _$UserStatusDtoFromJson(
  Map<String, dynamic> json,
) => _UserStatusDto(
  hasProfile: json['hasProfile'] as bool,
  loggedIn: json['loggedIn'] as bool,
  nickname: json['nickname'] as String?,
  officialNotiAgree: json['officialNotiAgree'] as bool? ?? false,
  officialNotiAgreeUpdatedDate: json['officialNotiAgreeUpdatedDate'] as String?,
  penalties:
      (json['penalties'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  profileImageUrl: json['profileImageUrl'] as String?,
  userIdHash: json['userIdHash'] as String?,
  verifiedMark: json['verifiedMark'] as bool? ?? false,
);

Map<String, dynamic> _$UserStatusDtoToJson(_UserStatusDto instance) =>
    <String, dynamic>{
      'hasProfile': instance.hasProfile,
      'loggedIn': instance.loggedIn,
      'nickname': instance.nickname,
      'officialNotiAgree': instance.officialNotiAgree,
      'officialNotiAgreeUpdatedDate': instance.officialNotiAgreeUpdatedDate,
      'penalties': instance.penalties,
      'profileImageUrl': instance.profileImageUrl,
      'userIdHash': instance.userIdHash,
      'verifiedMark': instance.verifiedMark,
    };
