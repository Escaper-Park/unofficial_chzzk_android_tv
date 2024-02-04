// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatSetting {
  int get fontSize => throw _privateConstructorUsedError;

  /// Ratio to maxHeight
  int get chatContainerHeight => throw _privateConstructorUsedError;

  /// Ratio to maxWidth,
  int get chatContainerWidth => throw _privateConstructorUsedError;

  /// Opacity = 1-chatContainerTransparency
  int get chatContainerTransparency => throw _privateConstructorUsedError;

  /// Chat Position
  int get chatPosition => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatSettingCopyWith<ChatSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSettingCopyWith<$Res> {
  factory $ChatSettingCopyWith(
          ChatSetting value, $Res Function(ChatSetting) then) =
      _$ChatSettingCopyWithImpl<$Res, ChatSetting>;
  @useResult
  $Res call(
      {int fontSize,
      int chatContainerHeight,
      int chatContainerWidth,
      int chatContainerTransparency,
      int chatPosition});
}

/// @nodoc
class _$ChatSettingCopyWithImpl<$Res, $Val extends ChatSetting>
    implements $ChatSettingCopyWith<$Res> {
  _$ChatSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontSize = null,
    Object? chatContainerHeight = null,
    Object? chatContainerWidth = null,
    Object? chatContainerTransparency = null,
    Object? chatPosition = null,
  }) {
    return _then(_value.copyWith(
      fontSize: null == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as int,
      chatContainerHeight: null == chatContainerHeight
          ? _value.chatContainerHeight
          : chatContainerHeight // ignore: cast_nullable_to_non_nullable
              as int,
      chatContainerWidth: null == chatContainerWidth
          ? _value.chatContainerWidth
          : chatContainerWidth // ignore: cast_nullable_to_non_nullable
              as int,
      chatContainerTransparency: null == chatContainerTransparency
          ? _value.chatContainerTransparency
          : chatContainerTransparency // ignore: cast_nullable_to_non_nullable
              as int,
      chatPosition: null == chatPosition
          ? _value.chatPosition
          : chatPosition // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatSettingImplCopyWith<$Res>
    implements $ChatSettingCopyWith<$Res> {
  factory _$$ChatSettingImplCopyWith(
          _$ChatSettingImpl value, $Res Function(_$ChatSettingImpl) then) =
      __$$ChatSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int fontSize,
      int chatContainerHeight,
      int chatContainerWidth,
      int chatContainerTransparency,
      int chatPosition});
}

/// @nodoc
class __$$ChatSettingImplCopyWithImpl<$Res>
    extends _$ChatSettingCopyWithImpl<$Res, _$ChatSettingImpl>
    implements _$$ChatSettingImplCopyWith<$Res> {
  __$$ChatSettingImplCopyWithImpl(
      _$ChatSettingImpl _value, $Res Function(_$ChatSettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontSize = null,
    Object? chatContainerHeight = null,
    Object? chatContainerWidth = null,
    Object? chatContainerTransparency = null,
    Object? chatPosition = null,
  }) {
    return _then(_$ChatSettingImpl(
      fontSize: null == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as int,
      chatContainerHeight: null == chatContainerHeight
          ? _value.chatContainerHeight
          : chatContainerHeight // ignore: cast_nullable_to_non_nullable
              as int,
      chatContainerWidth: null == chatContainerWidth
          ? _value.chatContainerWidth
          : chatContainerWidth // ignore: cast_nullable_to_non_nullable
              as int,
      chatContainerTransparency: null == chatContainerTransparency
          ? _value.chatContainerTransparency
          : chatContainerTransparency // ignore: cast_nullable_to_non_nullable
              as int,
      chatPosition: null == chatPosition
          ? _value.chatPosition
          : chatPosition // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChatSettingImpl implements _ChatSetting {
  _$ChatSettingImpl(
      {required this.fontSize,
      required this.chatContainerHeight,
      required this.chatContainerWidth,
      required this.chatContainerTransparency,
      required this.chatPosition});

  @override
  final int fontSize;

  /// Ratio to maxHeight
  @override
  final int chatContainerHeight;

  /// Ratio to maxWidth,
  @override
  final int chatContainerWidth;

  /// Opacity = 1-chatContainerTransparency
  @override
  final int chatContainerTransparency;

  /// Chat Position
  @override
  final int chatPosition;

  @override
  String toString() {
    return 'ChatSetting(fontSize: $fontSize, chatContainerHeight: $chatContainerHeight, chatContainerWidth: $chatContainerWidth, chatContainerTransparency: $chatContainerTransparency, chatPosition: $chatPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSettingImpl &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize) &&
            (identical(other.chatContainerHeight, chatContainerHeight) ||
                other.chatContainerHeight == chatContainerHeight) &&
            (identical(other.chatContainerWidth, chatContainerWidth) ||
                other.chatContainerWidth == chatContainerWidth) &&
            (identical(other.chatContainerTransparency,
                    chatContainerTransparency) ||
                other.chatContainerTransparency == chatContainerTransparency) &&
            (identical(other.chatPosition, chatPosition) ||
                other.chatPosition == chatPosition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fontSize, chatContainerHeight,
      chatContainerWidth, chatContainerTransparency, chatPosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSettingImplCopyWith<_$ChatSettingImpl> get copyWith =>
      __$$ChatSettingImplCopyWithImpl<_$ChatSettingImpl>(this, _$identity);
}

abstract class _ChatSetting implements ChatSetting {
  factory _ChatSetting(
      {required final int fontSize,
      required final int chatContainerHeight,
      required final int chatContainerWidth,
      required final int chatContainerTransparency,
      required final int chatPosition}) = _$ChatSettingImpl;

  @override
  int get fontSize;
  @override

  /// Ratio to maxHeight
  int get chatContainerHeight;
  @override

  /// Ratio to maxWidth,
  int get chatContainerWidth;
  @override

  /// Opacity = 1-chatContainerTransparency
  int get chatContainerTransparency;
  @override

  /// Chat Position
  int get chatPosition;
  @override
  @JsonKey(ignore: true)
  _$$ChatSettingImplCopyWith<_$ChatSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
