// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) {
  return _AccessToken.fromJson(json);
}

/// @nodoc
mixin _$AccessToken {
  String get accessToken => throw _privateConstructorUsedError;
  bool get realNameAuth => throw _privateConstructorUsedError;
  String get extraToken => throw _privateConstructorUsedError;
  TemporaryRestrict get temporaryRestrict => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessTokenCopyWith<AccessToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessTokenCopyWith<$Res> {
  factory $AccessTokenCopyWith(
          AccessToken value, $Res Function(AccessToken) then) =
      _$AccessTokenCopyWithImpl<$Res, AccessToken>;
  @useResult
  $Res call(
      {String accessToken,
      bool realNameAuth,
      String extraToken,
      TemporaryRestrict temporaryRestrict});

  $TemporaryRestrictCopyWith<$Res> get temporaryRestrict;
}

/// @nodoc
class _$AccessTokenCopyWithImpl<$Res, $Val extends AccessToken>
    implements $AccessTokenCopyWith<$Res> {
  _$AccessTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? realNameAuth = null,
    Object? extraToken = null,
    Object? temporaryRestrict = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      realNameAuth: null == realNameAuth
          ? _value.realNameAuth
          : realNameAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      extraToken: null == extraToken
          ? _value.extraToken
          : extraToken // ignore: cast_nullable_to_non_nullable
              as String,
      temporaryRestrict: null == temporaryRestrict
          ? _value.temporaryRestrict
          : temporaryRestrict // ignore: cast_nullable_to_non_nullable
              as TemporaryRestrict,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemporaryRestrictCopyWith<$Res> get temporaryRestrict {
    return $TemporaryRestrictCopyWith<$Res>(_value.temporaryRestrict, (value) {
      return _then(_value.copyWith(temporaryRestrict: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccessTokenImplCopyWith<$Res>
    implements $AccessTokenCopyWith<$Res> {
  factory _$$AccessTokenImplCopyWith(
          _$AccessTokenImpl value, $Res Function(_$AccessTokenImpl) then) =
      __$$AccessTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken,
      bool realNameAuth,
      String extraToken,
      TemporaryRestrict temporaryRestrict});

  @override
  $TemporaryRestrictCopyWith<$Res> get temporaryRestrict;
}

/// @nodoc
class __$$AccessTokenImplCopyWithImpl<$Res>
    extends _$AccessTokenCopyWithImpl<$Res, _$AccessTokenImpl>
    implements _$$AccessTokenImplCopyWith<$Res> {
  __$$AccessTokenImplCopyWithImpl(
      _$AccessTokenImpl _value, $Res Function(_$AccessTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? realNameAuth = null,
    Object? extraToken = null,
    Object? temporaryRestrict = null,
  }) {
    return _then(_$AccessTokenImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      realNameAuth: null == realNameAuth
          ? _value.realNameAuth
          : realNameAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      extraToken: null == extraToken
          ? _value.extraToken
          : extraToken // ignore: cast_nullable_to_non_nullable
              as String,
      temporaryRestrict: null == temporaryRestrict
          ? _value.temporaryRestrict
          : temporaryRestrict // ignore: cast_nullable_to_non_nullable
              as TemporaryRestrict,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessTokenImpl implements _AccessToken {
  const _$AccessTokenImpl(
      {required this.accessToken,
      required this.realNameAuth,
      required this.extraToken,
      required this.temporaryRestrict});

  factory _$AccessTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessTokenImplFromJson(json);

  @override
  final String accessToken;
  @override
  final bool realNameAuth;
  @override
  final String extraToken;
  @override
  final TemporaryRestrict temporaryRestrict;

  @override
  String toString() {
    return 'AccessToken(accessToken: $accessToken, realNameAuth: $realNameAuth, extraToken: $extraToken, temporaryRestrict: $temporaryRestrict)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessTokenImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.realNameAuth, realNameAuth) ||
                other.realNameAuth == realNameAuth) &&
            (identical(other.extraToken, extraToken) ||
                other.extraToken == extraToken) &&
            (identical(other.temporaryRestrict, temporaryRestrict) ||
                other.temporaryRestrict == temporaryRestrict));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, accessToken, realNameAuth, extraToken, temporaryRestrict);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessTokenImplCopyWith<_$AccessTokenImpl> get copyWith =>
      __$$AccessTokenImplCopyWithImpl<_$AccessTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessTokenImplToJson(
      this,
    );
  }
}

abstract class _AccessToken implements AccessToken {
  const factory _AccessToken(
      {required final String accessToken,
      required final bool realNameAuth,
      required final String extraToken,
      required final TemporaryRestrict temporaryRestrict}) = _$AccessTokenImpl;

  factory _AccessToken.fromJson(Map<String, dynamic> json) =
      _$AccessTokenImpl.fromJson;

  @override
  String get accessToken;
  @override
  bool get realNameAuth;
  @override
  String get extraToken;
  @override
  TemporaryRestrict get temporaryRestrict;
  @override
  @JsonKey(ignore: true)
  _$$AccessTokenImplCopyWith<_$AccessTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TemporaryRestrict _$TemporaryRestrictFromJson(Map<String, dynamic> json) {
  return _TemporaryRestrict.fromJson(json);
}

/// @nodoc
mixin _$TemporaryRestrict {
  bool get temporaryRestrict => throw _privateConstructorUsedError;
  int get times => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int? get createdTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemporaryRestrictCopyWith<TemporaryRestrict> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemporaryRestrictCopyWith<$Res> {
  factory $TemporaryRestrictCopyWith(
          TemporaryRestrict value, $Res Function(TemporaryRestrict) then) =
      _$TemporaryRestrictCopyWithImpl<$Res, TemporaryRestrict>;
  @useResult
  $Res call(
      {bool temporaryRestrict, int times, int? duration, int? createdTime});
}

/// @nodoc
class _$TemporaryRestrictCopyWithImpl<$Res, $Val extends TemporaryRestrict>
    implements $TemporaryRestrictCopyWith<$Res> {
  _$TemporaryRestrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temporaryRestrict = null,
    Object? times = null,
    Object? duration = freezed,
    Object? createdTime = freezed,
  }) {
    return _then(_value.copyWith(
      temporaryRestrict: null == temporaryRestrict
          ? _value.temporaryRestrict
          : temporaryRestrict // ignore: cast_nullable_to_non_nullable
              as bool,
      times: null == times
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as int,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemporaryRestrictImplCopyWith<$Res>
    implements $TemporaryRestrictCopyWith<$Res> {
  factory _$$TemporaryRestrictImplCopyWith(_$TemporaryRestrictImpl value,
          $Res Function(_$TemporaryRestrictImpl) then) =
      __$$TemporaryRestrictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool temporaryRestrict, int times, int? duration, int? createdTime});
}

/// @nodoc
class __$$TemporaryRestrictImplCopyWithImpl<$Res>
    extends _$TemporaryRestrictCopyWithImpl<$Res, _$TemporaryRestrictImpl>
    implements _$$TemporaryRestrictImplCopyWith<$Res> {
  __$$TemporaryRestrictImplCopyWithImpl(_$TemporaryRestrictImpl _value,
      $Res Function(_$TemporaryRestrictImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temporaryRestrict = null,
    Object? times = null,
    Object? duration = freezed,
    Object? createdTime = freezed,
  }) {
    return _then(_$TemporaryRestrictImpl(
      temporaryRestrict: null == temporaryRestrict
          ? _value.temporaryRestrict
          : temporaryRestrict // ignore: cast_nullable_to_non_nullable
              as bool,
      times: null == times
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as int,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemporaryRestrictImpl implements _TemporaryRestrict {
  const _$TemporaryRestrictImpl(
      {required this.temporaryRestrict,
      required this.times,
      required this.duration,
      required this.createdTime});

  factory _$TemporaryRestrictImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemporaryRestrictImplFromJson(json);

  @override
  final bool temporaryRestrict;
  @override
  final int times;
  @override
  final int? duration;
  @override
  final int? createdTime;

  @override
  String toString() {
    return 'TemporaryRestrict(temporaryRestrict: $temporaryRestrict, times: $times, duration: $duration, createdTime: $createdTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemporaryRestrictImpl &&
            (identical(other.temporaryRestrict, temporaryRestrict) ||
                other.temporaryRestrict == temporaryRestrict) &&
            (identical(other.times, times) || other.times == times) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, temporaryRestrict, times, duration, createdTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemporaryRestrictImplCopyWith<_$TemporaryRestrictImpl> get copyWith =>
      __$$TemporaryRestrictImplCopyWithImpl<_$TemporaryRestrictImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemporaryRestrictImplToJson(
      this,
    );
  }
}

abstract class _TemporaryRestrict implements TemporaryRestrict {
  const factory _TemporaryRestrict(
      {required final bool temporaryRestrict,
      required final int times,
      required final int? duration,
      required final int? createdTime}) = _$TemporaryRestrictImpl;

  factory _TemporaryRestrict.fromJson(Map<String, dynamic> json) =
      _$TemporaryRestrictImpl.fromJson;

  @override
  bool get temporaryRestrict;
  @override
  int get times;
  @override
  int? get duration;
  @override
  int? get createdTime;
  @override
  @JsonKey(ignore: true)
  _$$TemporaryRestrictImplCopyWith<_$TemporaryRestrictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
