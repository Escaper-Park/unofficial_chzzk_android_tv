// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String? get userIdHash => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get userRoleCode =>
      throw _privateConstructorUsedError; // "common-user", "streaming_channel_manager", "streaming_chat_manager",
  ChzzkBadge? get badge => throw _privateConstructorUsedError;
  bool? get verifiedMark => throw _privateConstructorUsedError;

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String? userIdHash,
      String? nickname,
      String? userRoleCode,
      ChzzkBadge? badge,
      bool? verifiedMark});

  $ChzzkBadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      userIdHash: freezed == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      userRoleCode: freezed == userRoleCode
          ? _value.userRoleCode
          : userRoleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as ChzzkBadge?,
      verifiedMark: freezed == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChzzkBadgeCopyWith<$Res>? get badge {
    if (_value.badge == null) {
      return null;
    }

    return $ChzzkBadgeCopyWith<$Res>(_value.badge!, (value) {
      return _then(_value.copyWith(badge: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userIdHash,
      String? nickname,
      String? userRoleCode,
      ChzzkBadge? badge,
      bool? verifiedMark});

  @override
  $ChzzkBadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

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
    return _then(_$ProfileImpl(
      userIdHash: freezed == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      userRoleCode: freezed == userRoleCode
          ? _value.userRoleCode
          : userRoleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as ChzzkBadge?,
      verifiedMark: freezed == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl(
      {this.userIdHash,
      this.nickname,
      this.userRoleCode,
      this.badge,
      required this.verifiedMark});

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final String? userIdHash;
  @override
  final String? nickname;
  @override
  final String? userRoleCode;
// "common-user", "streaming_channel_manager", "streaming_chat_manager",
  @override
  final ChzzkBadge? badge;
  @override
  final bool? verifiedMark;

  @override
  String toString() {
    return 'Profile(userIdHash: $userIdHash, nickname: $nickname, userRoleCode: $userRoleCode, badge: $badge, verifiedMark: $verifiedMark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
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

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {final String? userIdHash,
      final String? nickname,
      final String? userRoleCode,
      final ChzzkBadge? badge,
      required final bool? verifiedMark}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String? get userIdHash;
  @override
  String? get nickname;
  @override
  String?
      get userRoleCode; // "common-user", "streaming_channel_manager", "streaming_chat_manager",
  @override
  ChzzkBadge? get badge;
  @override
  bool? get verifiedMark;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChzzkBadge _$ChzzkBadgeFromJson(Map<String, dynamic> json) {
  return _ChzzkBadge.fromJson(json);
}

/// @nodoc
mixin _$ChzzkBadge {
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this ChzzkBadge to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChzzkBadge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChzzkBadgeCopyWith<ChzzkBadge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChzzkBadgeCopyWith<$Res> {
  factory $ChzzkBadgeCopyWith(
          ChzzkBadge value, $Res Function(ChzzkBadge) then) =
      _$ChzzkBadgeCopyWithImpl<$Res, ChzzkBadge>;
  @useResult
  $Res call({String? imageUrl});
}

/// @nodoc
class _$ChzzkBadgeCopyWithImpl<$Res, $Val extends ChzzkBadge>
    implements $ChzzkBadgeCopyWith<$Res> {
  _$ChzzkBadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChzzkBadge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChzzkBadgeImplCopyWith<$Res>
    implements $ChzzkBadgeCopyWith<$Res> {
  factory _$$ChzzkBadgeImplCopyWith(
          _$ChzzkBadgeImpl value, $Res Function(_$ChzzkBadgeImpl) then) =
      __$$ChzzkBadgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? imageUrl});
}

/// @nodoc
class __$$ChzzkBadgeImplCopyWithImpl<$Res>
    extends _$ChzzkBadgeCopyWithImpl<$Res, _$ChzzkBadgeImpl>
    implements _$$ChzzkBadgeImplCopyWith<$Res> {
  __$$ChzzkBadgeImplCopyWithImpl(
      _$ChzzkBadgeImpl _value, $Res Function(_$ChzzkBadgeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChzzkBadge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
  }) {
    return _then(_$ChzzkBadgeImpl(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChzzkBadgeImpl implements _ChzzkBadge {
  const _$ChzzkBadgeImpl({this.imageUrl});

  factory _$ChzzkBadgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChzzkBadgeImplFromJson(json);

  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'ChzzkBadge(imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChzzkBadgeImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl);

  /// Create a copy of ChzzkBadge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChzzkBadgeImplCopyWith<_$ChzzkBadgeImpl> get copyWith =>
      __$$ChzzkBadgeImplCopyWithImpl<_$ChzzkBadgeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChzzkBadgeImplToJson(
      this,
    );
  }
}

abstract class _ChzzkBadge implements ChzzkBadge {
  const factory _ChzzkBadge({final String? imageUrl}) = _$ChzzkBadgeImpl;

  factory _ChzzkBadge.fromJson(Map<String, dynamic> json) =
      _$ChzzkBadgeImpl.fromJson;

  @override
  String? get imageUrl;

  /// Create a copy of ChzzkBadge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChzzkBadgeImplCopyWith<_$ChzzkBadgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
