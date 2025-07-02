// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  bool get hasProfile => throw _privateConstructorUsedError;

  /// UID for chat service.
  String? get userIdHash => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;

  /// partner streamer
  bool get verifiedMark => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {bool hasProfile,
      String? userIdHash,
      String nickname,
      String? profileImageUrl,
      bool verifiedMark});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasProfile = null,
    Object? userIdHash = freezed,
    Object? nickname = null,
    Object? profileImageUrl = freezed,
    Object? verifiedMark = null,
  }) {
    return _then(_value.copyWith(
      hasProfile: null == hasProfile
          ? _value.hasProfile
          : hasProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      userIdHash: freezed == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedMark: null == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasProfile,
      String? userIdHash,
      String nickname,
      String? profileImageUrl,
      bool verifiedMark});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasProfile = null,
    Object? userIdHash = freezed,
    Object? nickname = null,
    Object? profileImageUrl = freezed,
    Object? verifiedMark = null,
  }) {
    return _then(_$UserImpl(
      hasProfile: null == hasProfile
          ? _value.hasProfile
          : hasProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      userIdHash: freezed == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedMark: null == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.hasProfile,
      this.userIdHash,
      required this.nickname,
      this.profileImageUrl,
      required this.verifiedMark});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final bool hasProfile;

  /// UID for chat service.
  @override
  final String? userIdHash;
  @override
  final String nickname;
  @override
  final String? profileImageUrl;

  /// partner streamer
  @override
  final bool verifiedMark;

  @override
  String toString() {
    return 'User(hasProfile: $hasProfile, userIdHash: $userIdHash, nickname: $nickname, profileImageUrl: $profileImageUrl, verifiedMark: $verifiedMark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.hasProfile, hasProfile) ||
                other.hasProfile == hasProfile) &&
            (identical(other.userIdHash, userIdHash) ||
                other.userIdHash == userIdHash) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasProfile, userIdHash, nickname,
      profileImageUrl, verifiedMark);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final bool hasProfile,
      final String? userIdHash,
      required final String nickname,
      final String? profileImageUrl,
      required final bool verifiedMark}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  bool get hasProfile;

  /// UID for chat service.
  @override
  String? get userIdHash;
  @override
  String get nickname;
  @override
  String? get profileImageUrl;

  /// partner streamer
  @override
  bool get verifiedMark;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
