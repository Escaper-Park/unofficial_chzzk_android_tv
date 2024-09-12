// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseChat _$BaseChatFromJson(Map<String, dynamic> json) {
  return _BaseChat.fromJson(json);
}

/// @nodoc
mixin _$BaseChat {
  String get msg => throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;
  Extras? get extras => throw _privateConstructorUsedError;

  /// chat created time
  int get ctime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseChatCopyWith<BaseChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseChatCopyWith<$Res> {
  factory $BaseChatCopyWith(BaseChat value, $Res Function(BaseChat) then) =
      _$BaseChatCopyWithImpl<$Res, BaseChat>;
  @useResult
  $Res call({String msg, Profile? profile, Extras? extras, int ctime});

  $ProfileCopyWith<$Res>? get profile;
  $ExtrasCopyWith<$Res>? get extras;
}

/// @nodoc
class _$BaseChatCopyWithImpl<$Res, $Val extends BaseChat>
    implements $BaseChatCopyWith<$Res> {
  _$BaseChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
    Object? profile = freezed,
    Object? extras = freezed,
    Object? ctime = null,
  }) {
    return _then(_value.copyWith(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras?,
      ctime: null == ctime
          ? _value.ctime
          : ctime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExtrasCopyWith<$Res>? get extras {
    if (_value.extras == null) {
      return null;
    }

    return $ExtrasCopyWith<$Res>(_value.extras!, (value) {
      return _then(_value.copyWith(extras: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BaseChatImplCopyWith<$Res>
    implements $BaseChatCopyWith<$Res> {
  factory _$$BaseChatImplCopyWith(
          _$BaseChatImpl value, $Res Function(_$BaseChatImpl) then) =
      __$$BaseChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg, Profile? profile, Extras? extras, int ctime});

  @override
  $ProfileCopyWith<$Res>? get profile;
  @override
  $ExtrasCopyWith<$Res>? get extras;
}

/// @nodoc
class __$$BaseChatImplCopyWithImpl<$Res>
    extends _$BaseChatCopyWithImpl<$Res, _$BaseChatImpl>
    implements _$$BaseChatImplCopyWith<$Res> {
  __$$BaseChatImplCopyWithImpl(
      _$BaseChatImpl _value, $Res Function(_$BaseChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
    Object? profile = freezed,
    Object? extras = freezed,
    Object? ctime = null,
  }) {
    return _then(_$BaseChatImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras?,
      ctime: null == ctime
          ? _value.ctime
          : ctime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseChatImpl implements _BaseChat {
  const _$BaseChatImpl(
      {required this.msg,
      required this.profile,
      required this.extras,
      required this.ctime});

  factory _$BaseChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseChatImplFromJson(json);

  @override
  final String msg;
  @override
  final Profile? profile;
  @override
  final Extras? extras;

  /// chat created time
  @override
  final int ctime;

  @override
  String toString() {
    return 'BaseChat(msg: $msg, profile: $profile, extras: $extras, ctime: $ctime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseChatImpl &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.extras, extras) || other.extras == extras) &&
            (identical(other.ctime, ctime) || other.ctime == ctime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, msg, profile, extras, ctime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseChatImplCopyWith<_$BaseChatImpl> get copyWith =>
      __$$BaseChatImplCopyWithImpl<_$BaseChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseChatImplToJson(
      this,
    );
  }
}

abstract class _BaseChat implements BaseChat {
  const factory _BaseChat(
      {required final String msg,
      required final Profile? profile,
      required final Extras? extras,
      required final int ctime}) = _$BaseChatImpl;

  factory _BaseChat.fromJson(Map<String, dynamic> json) =
      _$BaseChatImpl.fromJson;

  @override
  String get msg;
  @override
  Profile? get profile;
  @override
  Extras? get extras;
  @override

  /// chat created time
  int get ctime;
  @override
  @JsonKey(ignore: true)
  _$$BaseChatImplCopyWith<_$BaseChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
