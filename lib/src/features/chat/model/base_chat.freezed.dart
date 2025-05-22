// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseChat {
  String get msg;
  Profile? get profile;
  Extras? get extras;
  int get ctime;

  /// Create a copy of BaseChat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BaseChatCopyWith<BaseChat> get copyWith =>
      _$BaseChatCopyWithImpl<BaseChat>(this as BaseChat, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BaseChat &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.extras, extras) || other.extras == extras) &&
            (identical(other.ctime, ctime) || other.ctime == ctime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, msg, profile, extras, ctime);

  @override
  String toString() {
    return 'BaseChat(msg: $msg, profile: $profile, extras: $extras, ctime: $ctime)';
  }
}

/// @nodoc
abstract mixin class $BaseChatCopyWith<$Res> {
  factory $BaseChatCopyWith(BaseChat value, $Res Function(BaseChat) _then) =
      _$BaseChatCopyWithImpl;
  @useResult
  $Res call({String msg, Profile? profile, Extras? extras, int ctime});
}

/// @nodoc
class _$BaseChatCopyWithImpl<$Res> implements $BaseChatCopyWith<$Res> {
  _$BaseChatCopyWithImpl(this._self, this._then);

  final BaseChat _self;
  final $Res Function(BaseChat) _then;

  /// Create a copy of BaseChat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
    Object? profile = freezed,
    Object? extras = freezed,
    Object? ctime = null,
  }) {
    return _then(BaseChat(
      msg: null == msg
          ? _self.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      extras: freezed == extras
          ? _self.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras?,
      ctime: null == ctime
          ? _self.ctime
          : ctime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
