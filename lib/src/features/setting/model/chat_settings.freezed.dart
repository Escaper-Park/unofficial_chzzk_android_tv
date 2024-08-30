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
  /// The X value of the overlay chat position as a ratio of the entire screen.
  ///
  /// MediaQuery.of(context).size.width * chatPositionX * 0.01.
  int get chatPositionX => throw _privateConstructorUsedError;

  /// The Y value of the overlay chat position as a ratio of the entire screen.
  ///
  /// MediaQuery.of(context).size.height * chatPositionY * 0.01.
  int get chatPositionY => throw _privateConstructorUsedError;

  /// The height of entire overlay chat container as a ratio of the entire screen.
  int get chatContainerHeight => throw _privateConstructorUsedError;

  /// The width of entire overlay chat container as a ratio of the entire screen.
  int get chatContainerWidth => throw _privateConstructorUsedError;

  /// The font size of the chat.
  int get chatFontSize => throw _privateConstructorUsedError;

  /// The transparency of the container that wraps the entire chat.
  ///
  /// Used with the opacity function. Opacity = (100 - Transparency) * 0.01.
  /// The max value of opacity  is 1.
  int get entireChatContainerTransparency => throw _privateConstructorUsedError;

  /// The transparency of the container that wraps a single chat.
  ///
  /// Used with the opacity function. Opacity = (100 - Transparency) * 0.01.
  /// The max value of opacity is 1.
  int get singleChatContainerTransparency => throw _privateConstructorUsedError;

  /// The vertical spacing between each chat.
  int get chatContainerVerticalMargin => throw _privateConstructorUsedError;

  /// Show chat created time
  ///
  /// 0: false, 1: true
  int get showChatTime => throw _privateConstructorUsedError;

  /// Show user's nick name in chat.
  ///
  /// 0: false, 1: true
  int get showNickname => throw _privateConstructorUsedError;

  /// The height of badge collector as a ratio of the entire chat container.
  int get badgeCollectorHeight => throw _privateConstructorUsedError;

  /// Show the badge collector.
  ///
  /// 0: false, 1: true
  int get useBadgeCollector => throw _privateConstructorUsedError;

  /// Serializes this ChatSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {int chatPositionX,
      int chatPositionY,
      int chatContainerHeight,
      int chatContainerWidth,
      int chatFontSize,
      int entireChatContainerTransparency,
      int singleChatContainerTransparency,
      int chatContainerVerticalMargin,
      int showChatTime,
      int showNickname,
      int badgeCollectorHeight,
      int useBadgeCollector});
}

/// @nodoc
class _$ChatSettingsCopyWithImpl<$Res, $Val extends ChatSettings>
    implements $ChatSettingsCopyWith<$Res> {
  _$ChatSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatPositionX = null,
    Object? chatPositionY = null,
    Object? chatContainerHeight = null,
    Object? chatContainerWidth = null,
    Object? chatFontSize = null,
    Object? entireChatContainerTransparency = null,
    Object? singleChatContainerTransparency = null,
    Object? chatContainerVerticalMargin = null,
    Object? showChatTime = null,
    Object? showNickname = null,
    Object? badgeCollectorHeight = null,
    Object? useBadgeCollector = null,
  }) {
    return _then(_value.copyWith(
      chatPositionX: null == chatPositionX
          ? _value.chatPositionX
          : chatPositionX // ignore: cast_nullable_to_non_nullable
              as int,
      chatPositionY: null == chatPositionY
          ? _value.chatPositionY
          : chatPositionY // ignore: cast_nullable_to_non_nullable
              as int,
      chatContainerHeight: null == chatContainerHeight
          ? _value.chatContainerHeight
          : chatContainerHeight // ignore: cast_nullable_to_non_nullable
              as int,
      chatContainerWidth: null == chatContainerWidth
          ? _value.chatContainerWidth
          : chatContainerWidth // ignore: cast_nullable_to_non_nullable
              as int,
      chatFontSize: null == chatFontSize
          ? _value.chatFontSize
          : chatFontSize // ignore: cast_nullable_to_non_nullable
              as int,
      entireChatContainerTransparency: null == entireChatContainerTransparency
          ? _value.entireChatContainerTransparency
          : entireChatContainerTransparency // ignore: cast_nullable_to_non_nullable
              as int,
      singleChatContainerTransparency: null == singleChatContainerTransparency
          ? _value.singleChatContainerTransparency
          : singleChatContainerTransparency // ignore: cast_nullable_to_non_nullable
              as int,
      chatContainerVerticalMargin: null == chatContainerVerticalMargin
          ? _value.chatContainerVerticalMargin
          : chatContainerVerticalMargin // ignore: cast_nullable_to_non_nullable
              as int,
      showChatTime: null == showChatTime
          ? _value.showChatTime
          : showChatTime // ignore: cast_nullable_to_non_nullable
              as int,
      showNickname: null == showNickname
          ? _value.showNickname
          : showNickname // ignore: cast_nullable_to_non_nullable
              as int,
      badgeCollectorHeight: null == badgeCollectorHeight
          ? _value.badgeCollectorHeight
          : badgeCollectorHeight // ignore: cast_nullable_to_non_nullable
              as int,
      useBadgeCollector: null == useBadgeCollector
          ? _value.useBadgeCollector
          : useBadgeCollector // ignore: cast_nullable_to_non_nullable
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
      {int chatPositionX,
      int chatPositionY,
      int chatContainerHeight,
      int chatContainerWidth,
      int chatFontSize,
      int entireChatContainerTransparency,
      int singleChatContainerTransparency,
      int chatContainerVerticalMargin,
      int showChatTime,
      int showNickname,
      int badgeCollectorHeight,
      int useBadgeCollector});
}

/// @nodoc
class __$$ChatSettingsImplCopyWithImpl<$Res>
    extends _$ChatSettingsCopyWithImpl<$Res, _$ChatSettingsImpl>
    implements _$$ChatSettingsImplCopyWith<$Res> {
  __$$ChatSettingsImplCopyWithImpl(
      _$ChatSettingsImpl _value, $Res Function(_$ChatSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatPositionX = null,
    Object? chatPositionY = null,
    Object? chatContainerHeight = null,
    Object? chatContainerWidth = null,
    Object? chatFontSize = null,
    Object? entireChatContainerTransparency = null,
    Object? singleChatContainerTransparency = null,
    Object? chatContainerVerticalMargin = null,
    Object? showChatTime = null,
    Object? showNickname = null,
    Object? badgeCollectorHeight = null,
    Object? useBadgeCollector = null,
  }) {
    return _then(_$ChatSettingsImpl(
      chatPositionX: null == chatPositionX
          ? _value.chatPositionX
          : chatPositionX // ignore: cast_nullable_to_non_nullable
              as int,
      chatPositionY: null == chatPositionY
          ? _value.chatPositionY
          : chatPositionY // ignore: cast_nullable_to_non_nullable
              as int,
      chatContainerHeight: null == chatContainerHeight
          ? _value.chatContainerHeight
          : chatContainerHeight // ignore: cast_nullable_to_non_nullable
              as int,
      chatContainerWidth: null == chatContainerWidth
          ? _value.chatContainerWidth
          : chatContainerWidth // ignore: cast_nullable_to_non_nullable
              as int,
      chatFontSize: null == chatFontSize
          ? _value.chatFontSize
          : chatFontSize // ignore: cast_nullable_to_non_nullable
              as int,
      entireChatContainerTransparency: null == entireChatContainerTransparency
          ? _value.entireChatContainerTransparency
          : entireChatContainerTransparency // ignore: cast_nullable_to_non_nullable
              as int,
      singleChatContainerTransparency: null == singleChatContainerTransparency
          ? _value.singleChatContainerTransparency
          : singleChatContainerTransparency // ignore: cast_nullable_to_non_nullable
              as int,
      chatContainerVerticalMargin: null == chatContainerVerticalMargin
          ? _value.chatContainerVerticalMargin
          : chatContainerVerticalMargin // ignore: cast_nullable_to_non_nullable
              as int,
      showChatTime: null == showChatTime
          ? _value.showChatTime
          : showChatTime // ignore: cast_nullable_to_non_nullable
              as int,
      showNickname: null == showNickname
          ? _value.showNickname
          : showNickname // ignore: cast_nullable_to_non_nullable
              as int,
      badgeCollectorHeight: null == badgeCollectorHeight
          ? _value.badgeCollectorHeight
          : badgeCollectorHeight // ignore: cast_nullable_to_non_nullable
              as int,
      useBadgeCollector: null == useBadgeCollector
          ? _value.useBadgeCollector
          : useBadgeCollector // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatSettingsImpl implements _ChatSettings {
  const _$ChatSettingsImpl(
      {required this.chatPositionX,
      required this.chatPositionY,
      required this.chatContainerHeight,
      required this.chatContainerWidth,
      required this.chatFontSize,
      required this.entireChatContainerTransparency,
      required this.singleChatContainerTransparency,
      required this.chatContainerVerticalMargin,
      required this.showChatTime,
      required this.showNickname,
      required this.badgeCollectorHeight,
      required this.useBadgeCollector});

  factory _$ChatSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatSettingsImplFromJson(json);

  /// The X value of the overlay chat position as a ratio of the entire screen.
  ///
  /// MediaQuery.of(context).size.width * chatPositionX * 0.01.
  @override
  final int chatPositionX;

  /// The Y value of the overlay chat position as a ratio of the entire screen.
  ///
  /// MediaQuery.of(context).size.height * chatPositionY * 0.01.
  @override
  final int chatPositionY;

  /// The height of entire overlay chat container as a ratio of the entire screen.
  @override
  final int chatContainerHeight;

  /// The width of entire overlay chat container as a ratio of the entire screen.
  @override
  final int chatContainerWidth;

  /// The font size of the chat.
  @override
  final int chatFontSize;

  /// The transparency of the container that wraps the entire chat.
  ///
  /// Used with the opacity function. Opacity = (100 - Transparency) * 0.01.
  /// The max value of opacity  is 1.
  @override
  final int entireChatContainerTransparency;

  /// The transparency of the container that wraps a single chat.
  ///
  /// Used with the opacity function. Opacity = (100 - Transparency) * 0.01.
  /// The max value of opacity is 1.
  @override
  final int singleChatContainerTransparency;

  /// The vertical spacing between each chat.
  @override
  final int chatContainerVerticalMargin;

  /// Show chat created time
  ///
  /// 0: false, 1: true
  @override
  final int showChatTime;

  /// Show user's nick name in chat.
  ///
  /// 0: false, 1: true
  @override
  final int showNickname;

  /// The height of badge collector as a ratio of the entire chat container.
  @override
  final int badgeCollectorHeight;

  /// Show the badge collector.
  ///
  /// 0: false, 1: true
  @override
  final int useBadgeCollector;

  @override
  String toString() {
    return 'ChatSettings(chatPositionX: $chatPositionX, chatPositionY: $chatPositionY, chatContainerHeight: $chatContainerHeight, chatContainerWidth: $chatContainerWidth, chatFontSize: $chatFontSize, entireChatContainerTransparency: $entireChatContainerTransparency, singleChatContainerTransparency: $singleChatContainerTransparency, chatContainerVerticalMargin: $chatContainerVerticalMargin, showChatTime: $showChatTime, showNickname: $showNickname, badgeCollectorHeight: $badgeCollectorHeight, useBadgeCollector: $useBadgeCollector)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSettingsImpl &&
            (identical(other.chatPositionX, chatPositionX) ||
                other.chatPositionX == chatPositionX) &&
            (identical(other.chatPositionY, chatPositionY) ||
                other.chatPositionY == chatPositionY) &&
            (identical(other.chatContainerHeight, chatContainerHeight) ||
                other.chatContainerHeight == chatContainerHeight) &&
            (identical(other.chatContainerWidth, chatContainerWidth) ||
                other.chatContainerWidth == chatContainerWidth) &&
            (identical(other.chatFontSize, chatFontSize) ||
                other.chatFontSize == chatFontSize) &&
            (identical(other.entireChatContainerTransparency,
                    entireChatContainerTransparency) ||
                other.entireChatContainerTransparency ==
                    entireChatContainerTransparency) &&
            (identical(other.singleChatContainerTransparency,
                    singleChatContainerTransparency) ||
                other.singleChatContainerTransparency ==
                    singleChatContainerTransparency) &&
            (identical(other.chatContainerVerticalMargin,
                    chatContainerVerticalMargin) ||
                other.chatContainerVerticalMargin ==
                    chatContainerVerticalMargin) &&
            (identical(other.showChatTime, showChatTime) ||
                other.showChatTime == showChatTime) &&
            (identical(other.showNickname, showNickname) ||
                other.showNickname == showNickname) &&
            (identical(other.badgeCollectorHeight, badgeCollectorHeight) ||
                other.badgeCollectorHeight == badgeCollectorHeight) &&
            (identical(other.useBadgeCollector, useBadgeCollector) ||
                other.useBadgeCollector == useBadgeCollector));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chatPositionX,
      chatPositionY,
      chatContainerHeight,
      chatContainerWidth,
      chatFontSize,
      entireChatContainerTransparency,
      singleChatContainerTransparency,
      chatContainerVerticalMargin,
      showChatTime,
      showNickname,
      badgeCollectorHeight,
      useBadgeCollector);

  /// Create a copy of ChatSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  const factory _ChatSettings(
      {required final int chatPositionX,
      required final int chatPositionY,
      required final int chatContainerHeight,
      required final int chatContainerWidth,
      required final int chatFontSize,
      required final int entireChatContainerTransparency,
      required final int singleChatContainerTransparency,
      required final int chatContainerVerticalMargin,
      required final int showChatTime,
      required final int showNickname,
      required final int badgeCollectorHeight,
      required final int useBadgeCollector}) = _$ChatSettingsImpl;

  factory _ChatSettings.fromJson(Map<String, dynamic> json) =
      _$ChatSettingsImpl.fromJson;

  /// The X value of the overlay chat position as a ratio of the entire screen.
  ///
  /// MediaQuery.of(context).size.width * chatPositionX * 0.01.
  @override
  int get chatPositionX;

  /// The Y value of the overlay chat position as a ratio of the entire screen.
  ///
  /// MediaQuery.of(context).size.height * chatPositionY * 0.01.
  @override
  int get chatPositionY;

  /// The height of entire overlay chat container as a ratio of the entire screen.
  @override
  int get chatContainerHeight;

  /// The width of entire overlay chat container as a ratio of the entire screen.
  @override
  int get chatContainerWidth;

  /// The font size of the chat.
  @override
  int get chatFontSize;

  /// The transparency of the container that wraps the entire chat.
  ///
  /// Used with the opacity function. Opacity = (100 - Transparency) * 0.01.
  /// The max value of opacity  is 1.
  @override
  int get entireChatContainerTransparency;

  /// The transparency of the container that wraps a single chat.
  ///
  /// Used with the opacity function. Opacity = (100 - Transparency) * 0.01.
  /// The max value of opacity is 1.
  @override
  int get singleChatContainerTransparency;

  /// The vertical spacing between each chat.
  @override
  int get chatContainerVerticalMargin;

  /// Show chat created time
  ///
  /// 0: false, 1: true
  @override
  int get showChatTime;

  /// Show user's nick name in chat.
  ///
  /// 0: false, 1: true
  @override
  int get showNickname;

  /// The height of badge collector as a ratio of the entire chat container.
  @override
  int get badgeCollectorHeight;

  /// Show the badge collector.
  ///
  /// 0: false, 1: true
  @override
  int get useBadgeCollector;

  /// Create a copy of ChatSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatSettingsImplCopyWith<_$ChatSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
