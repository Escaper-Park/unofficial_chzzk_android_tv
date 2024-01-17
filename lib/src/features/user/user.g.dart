// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      hasProfile: json['hasProfile'] as bool,
      loggedIn: json['loggedIn'] as bool,
      nickname: json['nickname'] as String,
      officialNotiAgree: json['officialNotiAgree'] as bool,
      officialNotiAgreeUpdateDate:
          json['officialNotiAgreeUpdateDate'] as String?,
      penalties: json['penalties'] as List<dynamic>,
      profileImageUrl: json['profileImageUrl'] as String?,
      userIdHash: json['userIdHash'] as String,
      verifiedMark: json['verifiedMark'] as bool,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'hasProfile': instance.hasProfile,
      'loggedIn': instance.loggedIn,
      'nickname': instance.nickname,
      'officialNotiAgree': instance.officialNotiAgree,
      'officialNotiAgreeUpdateDate': instance.officialNotiAgreeUpdateDate,
      'penalties': instance.penalties,
      'profileImageUrl': instance.profileImageUrl,
      'userIdHash': instance.userIdHash,
      'verifiedMark': instance.verifiedMark,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userHash() => r'616d1933a278f007b0d5d855c0a5dfc3a8cf876b';

/// See also [user].
@ProviderFor(user)
final userProvider = AutoDisposeFutureProvider<User?>.internal(
  user,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRef = AutoDisposeFutureProviderRef<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
