// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {
  String? get userIdHash;
  String? get nickname;
  String?
      get userRoleCode; // "common-user", "streaming_channel_manager", "streaming_chat_manager",
  ChzzkBadge? get badge;
  bool? get verifiedMark;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<Profile> get copyWith =>
      _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Profile &&
            (identical(other.userIdHash, userIdHash) ||
                other.userIdHash == userIdHash) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.userRoleCode, userRoleCode) ||
                other.userRoleCode == userRoleCode) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userIdHash, nickname, userRoleCode, badge, verifiedMark);

  @override
  String toString() {
    return 'Profile(userIdHash: $userIdHash, nickname: $nickname, userRoleCode: $userRoleCode, badge: $badge, verifiedMark: $verifiedMark)';
  }
}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) =
      _$ProfileCopyWithImpl;
  @useResult
  $Res call(
      {String? userIdHash,
      String? nickname,
      String? userRoleCode,
      ChzzkBadge? badge,
      bool? verifiedMark});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIdHash = freezed,
    Object? nickname = freezed,
    Object? userRoleCode = freezed,
    Object? badge = freezed,
    Object? verifiedMark = freezed,
  }) {
    return _then(Profile(
      userIdHash: freezed == userIdHash
          ? _self.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      userRoleCode: freezed == userRoleCode
          ? _self.userRoleCode
          : userRoleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      badge: freezed == badge
          ? _self.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as ChzzkBadge?,
      verifiedMark: freezed == verifiedMark
          ? _self.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$ChzzkBadge {
  String? get imageUrl;

  /// Create a copy of ChzzkBadge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChzzkBadgeCopyWith<ChzzkBadge> get copyWith =>
      _$ChzzkBadgeCopyWithImpl<ChzzkBadge>(this as ChzzkBadge, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChzzkBadge &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl);

  @override
  String toString() {
    return 'ChzzkBadge(imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $ChzzkBadgeCopyWith<$Res> {
  factory $ChzzkBadgeCopyWith(
          ChzzkBadge value, $Res Function(ChzzkBadge) _then) =
      _$ChzzkBadgeCopyWithImpl;
  @useResult
  $Res call({String? imageUrl});
}

/// @nodoc
class _$ChzzkBadgeCopyWithImpl<$Res> implements $ChzzkBadgeCopyWith<$Res> {
  _$ChzzkBadgeCopyWithImpl(this._self, this._then);

  final ChzzkBadge _self;
  final $Res Function(ChzzkBadge) _then;

  /// Create a copy of ChzzkBadge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
  }) {
    return _then(ChzzkBadge(
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
