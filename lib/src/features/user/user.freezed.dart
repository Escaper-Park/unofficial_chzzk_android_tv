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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  bool get hasProfile => throw _privateConstructorUsedError;
  bool get loggedIn => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  bool get officialNotiAgree => throw _privateConstructorUsedError;
  String? get officialNotiAgreeUpdateDate => throw _privateConstructorUsedError;
  List<dynamic> get penalties => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String get userIdHash => throw _privateConstructorUsedError;
  bool get verifiedMark => throw _privateConstructorUsedError;

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
      {bool hasProfile,
      bool loggedIn,
      String nickname,
      bool officialNotiAgree,
      String? officialNotiAgreeUpdateDate,
      List<dynamic> penalties,
      String? profileImageUrl,
      String userIdHash,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasProfile = null,
    Object? loggedIn = null,
    Object? nickname = null,
    Object? officialNotiAgree = null,
    Object? officialNotiAgreeUpdateDate = freezed,
    Object? penalties = null,
    Object? profileImageUrl = freezed,
    Object? userIdHash = null,
    Object? verifiedMark = null,
  }) {
    return _then(_value.copyWith(
      hasProfile: null == hasProfile
          ? _value.hasProfile
          : hasProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      loggedIn: null == loggedIn
          ? _value.loggedIn
          : loggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      officialNotiAgree: null == officialNotiAgree
          ? _value.officialNotiAgree
          : officialNotiAgree // ignore: cast_nullable_to_non_nullable
              as bool,
      officialNotiAgreeUpdateDate: freezed == officialNotiAgreeUpdateDate
          ? _value.officialNotiAgreeUpdateDate
          : officialNotiAgreeUpdateDate // ignore: cast_nullable_to_non_nullable
              as String?,
      penalties: null == penalties
          ? _value.penalties
          : penalties // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdHash: null == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String,
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
      bool loggedIn,
      String nickname,
      bool officialNotiAgree,
      String? officialNotiAgreeUpdateDate,
      List<dynamic> penalties,
      String? profileImageUrl,
      String userIdHash,
      bool verifiedMark});
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
    Object? hasProfile = null,
    Object? loggedIn = null,
    Object? nickname = null,
    Object? officialNotiAgree = null,
    Object? officialNotiAgreeUpdateDate = freezed,
    Object? penalties = null,
    Object? profileImageUrl = freezed,
    Object? userIdHash = null,
    Object? verifiedMark = null,
  }) {
    return _then(_$UserImpl(
      hasProfile: null == hasProfile
          ? _value.hasProfile
          : hasProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      loggedIn: null == loggedIn
          ? _value.loggedIn
          : loggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      officialNotiAgree: null == officialNotiAgree
          ? _value.officialNotiAgree
          : officialNotiAgree // ignore: cast_nullable_to_non_nullable
              as bool,
      officialNotiAgreeUpdateDate: freezed == officialNotiAgreeUpdateDate
          ? _value.officialNotiAgreeUpdateDate
          : officialNotiAgreeUpdateDate // ignore: cast_nullable_to_non_nullable
              as String?,
      penalties: null == penalties
          ? _value._penalties
          : penalties // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdHash: null == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String,
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
  _$UserImpl(
      {required this.hasProfile,
      required this.loggedIn,
      required this.nickname,
      required this.officialNotiAgree,
      required this.officialNotiAgreeUpdateDate,
      required final List<dynamic> penalties,
      required this.profileImageUrl,
      required this.userIdHash,
      required this.verifiedMark})
      : _penalties = penalties;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final bool hasProfile;
  @override
  final bool loggedIn;
  @override
  final String nickname;
  @override
  final bool officialNotiAgree;
  @override
  final String? officialNotiAgreeUpdateDate;
  final List<dynamic> _penalties;
  @override
  List<dynamic> get penalties {
    if (_penalties is EqualUnmodifiableListView) return _penalties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_penalties);
  }

  @override
  final String? profileImageUrl;
  @override
  final String userIdHash;
  @override
  final bool verifiedMark;

  @override
  String toString() {
    return 'User(hasProfile: $hasProfile, loggedIn: $loggedIn, nickname: $nickname, officialNotiAgree: $officialNotiAgree, officialNotiAgreeUpdateDate: $officialNotiAgreeUpdateDate, penalties: $penalties, profileImageUrl: $profileImageUrl, userIdHash: $userIdHash, verifiedMark: $verifiedMark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.hasProfile, hasProfile) ||
                other.hasProfile == hasProfile) &&
            (identical(other.loggedIn, loggedIn) ||
                other.loggedIn == loggedIn) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.officialNotiAgree, officialNotiAgree) ||
                other.officialNotiAgree == officialNotiAgree) &&
            (identical(other.officialNotiAgreeUpdateDate,
                    officialNotiAgreeUpdateDate) ||
                other.officialNotiAgreeUpdateDate ==
                    officialNotiAgreeUpdateDate) &&
            const DeepCollectionEquality()
                .equals(other._penalties, _penalties) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.userIdHash, userIdHash) ||
                other.userIdHash == userIdHash) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      hasProfile,
      loggedIn,
      nickname,
      officialNotiAgree,
      officialNotiAgreeUpdateDate,
      const DeepCollectionEquality().hash(_penalties),
      profileImageUrl,
      userIdHash,
      verifiedMark);

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
  factory _User(
      {required final bool hasProfile,
      required final bool loggedIn,
      required final String nickname,
      required final bool officialNotiAgree,
      required final String? officialNotiAgreeUpdateDate,
      required final List<dynamic> penalties,
      required final String? profileImageUrl,
      required final String userIdHash,
      required final bool verifiedMark}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  bool get hasProfile;
  @override
  bool get loggedIn;
  @override
  String get nickname;
  @override
  bool get officialNotiAgree;
  @override
  String? get officialNotiAgreeUpdateDate;
  @override
  List<dynamic> get penalties;
  @override
  String? get profileImageUrl;
  @override
  String get userIdHash;
  @override
  bool get verifiedMark;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
