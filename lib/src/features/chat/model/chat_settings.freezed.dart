// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatSettings _$ChatSettingsFromJson(Map<String, dynamic> json) {
  return _ChatSettings.fromJson(json);
}

/// @nodoc
mixin _$ChatSettings {
  int get fontSize => throw _privateConstructorUsedError;

  /// Ratio to maxHeight
  int get chatContainerHeight => throw _privateConstructorUsedError;

  /// Ratio to maxWidth,
  int get chatContainerWidth => throw _privateConstructorUsedError;

  /// Opacity = 1-chatContainerTransparency
  int get chatContainerTransparency => throw _privateConstructorUsedError;

  /// Chat Position
  int get chatPosition => throw _privateConstructorUsedError;

  /// Chat container interval
  int get chatContainerVerticalInterval => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatSettingsCopyWith<ChatSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSettingsCopyWith<$Res> {
  factory $ChatSettingsCopyWith(
          ChatSettings value, $Res Function(ChatSettings) then) =
      _$ChatSettingsCopyWithImpl<$Res, ChatSettings>;
  @useResult
  $Res call(
      {int fontSize,
      int chatContainerHeight,
      int chatContainerWidth,
      int chatContainerTransparency,
      int chatPosition,
      int chatContainerVerticalInterval});
}

/// @nodoc
class _$ChatSettingsCopyWithImpl<$Res, $Val extends ChatSettings>
    implements $ChatSettingsCopyWith<$Res> {
  _$ChatSettingsCopyWithImpl(this._value, this._then);

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
    Object? chatContainerVerticalInterval = null,
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
      chatContainerVerticalInterval: null == chatContainerVerticalInterval
          ? _value.chatContainerVerticalInterval
          : chatContainerVerticalInterval // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatSettingsImplCopyWith<$Res>
    implements $ChatSettingsCopyWith<$Res> {
  factory _$$ChatSettingsImplCopyWith(
          _$ChatSettingsImpl value, $Res Function(_$ChatSettingsImpl) then) =
      __$$ChatSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int fontSize,
      int chatContainerHeight,
      int chatContainerWidth,
      int chatContainerTransparency,
      int chatPosition,
      int chatContainerVerticalInterval});
}

/// @nodoc
class __$$ChatSettingsImplCopyWithImpl<$Res>
    extends _$ChatSettingsCopyWithImpl<$Res, _$ChatSettingsImpl>
    implements _$$ChatSettingsImplCopyWith<$Res> {
  __$$ChatSettingsImplCopyWithImpl(
      _$ChatSettingsImpl _value, $Res Function(_$ChatSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontSize = null,
    Object? chatContainerHeight = null,
    Object? chatContainerWidth = null,
    Object? chatContainerTransparency = null,
    Object? chatPosition = null,
    Object? chatContainerVerticalInterval = null,
  }) {
    return _then(_$ChatSettingsImpl(
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
      chatContainerVerticalInterval: null == chatContainerVerticalInterval
          ? _value.chatContainerVerticalInterval
          : chatContainerVerticalInterval // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatSettingsImpl implements _ChatSettings {
  _$ChatSettingsImpl(
      {required this.fontSize,
      required this.chatContainerHeight,
      required this.chatContainerWidth,
      required this.chatContainerTransparency,
      required this.chatPosition,
      required this.chatContainerVerticalInterval});

  factory _$ChatSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatSettingsImplFromJson(json);

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

  /// Chat container interval
  @override
  final int chatContainerVerticalInterval;

  @override
  String toString() {
    return 'ChatSettings(fontSize: $fontSize, chatContainerHeight: $chatContainerHeight, chatContainerWidth: $chatContainerWidth, chatContainerTransparency: $chatContainerTransparency, chatPosition: $chatPosition, chatContainerVerticalInterval: $chatContainerVerticalInterval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSettingsImpl &&
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
                other.chatPosition == chatPosition) &&
            (identical(other.chatContainerVerticalInterval,
                    chatContainerVerticalInterval) ||
                other.chatContainerVerticalInterval ==
                    chatContainerVerticalInterval));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fontSize,
      chatContainerHeight,
      chatContainerWidth,
      chatContainerTransparency,
      chatPosition,
      chatContainerVerticalInterval);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSettingsImplCopyWith<_$ChatSettingsImpl> get copyWith =>
      __$$ChatSettingsImplCopyWithImpl<_$ChatSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatSettingsImplToJson(
      this,
    );
  }
}

abstract class _ChatSettings implements ChatSettings {
  factory _ChatSettings(
      {required final int fontSize,
      required final int chatContainerHeight,
      required final int chatContainerWidth,
      required final int chatContainerTransparency,
      required final int chatPosition,
      required final int chatContainerVerticalInterval}) = _$ChatSettingsImpl;

  factory _ChatSettings.fromJson(Map<String, dynamic> json) =
      _$ChatSettingsImpl.fromJson;

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

  /// Chat container interval
  int get chatContainerVerticalInterval;
  @override
  @JsonKey(ignore: true)
  _$$ChatSettingsImplCopyWith<_$ChatSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
