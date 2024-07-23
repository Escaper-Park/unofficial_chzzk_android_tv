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
  /// UID for chat service
  String get userIdHash => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  bool get hasProfile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String userIdHash,
      String nickname,
      String? profileImageUrl,
      bool hasProfile});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIdHash = null,
    Object? nickname = null,
    Object? profileImageUrl = freezed,
    Object? hasProfile = null,
  }) {
    return _then(_value.copyWith(
      userIdHash: null == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      hasProfile: null == hasProfile
          ? _value.hasProfile
          : hasProfile // ignore: cast_nullable_to_non_nullable
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
      {String userIdHash,
      String nickname,
      String? profileImageUrl,
      bool hasProfile});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIdHash = null,
    Object? nickname = null,
    Object? profileImageUrl = freezed,
    Object? hasProfile = null,
  }) {
    return _then(_$UserImpl(
      userIdHash: null == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      hasProfile: null == hasProfile
          ? _value.hasProfile
          : hasProfile // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.userIdHash,
      required this.nickname,
      required this.profileImageUrl,
      required this.hasProfile});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  /// UID for chat service
  @override
  final String userIdHash;
  @override
  final String nickname;
  @override
  final String? profileImageUrl;
  @override
  final bool hasProfile;

  @override
  String toString() {
    return 'User(userIdHash: $userIdHash, nickname: $nickname, profileImageUrl: $profileImageUrl, hasProfile: $hasProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.userIdHash, userIdHash) ||
                other.userIdHash == userIdHash) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.hasProfile, hasProfile) ||
                other.hasProfile == hasProfile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userIdHash, nickname, profileImageUrl, hasProfile);

  @JsonKey(ignore: true)
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
      {required final String userIdHash,
      required final String nickname,
      required final String? profileImageUrl,
      required final bool hasProfile}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override

  /// UID for chat service
  String get userIdHash;
  @override
  String get nickname;
  @override
  String? get profileImageUrl;
  @override
  bool get hasProfile;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
