// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VodChat _$VodChatFromJson(Map<String, dynamic> json) {
  return _VodChat.fromJson(json);
}

/// @nodoc
mixin _$VodChat {
  String get chatChannelId => throw _privateConstructorUsedError;
  int get messageTime => throw _privateConstructorUsedError;
  String get userIdHash => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @ExtrasConverter()
  Extras? get extras => throw _privateConstructorUsedError;
  int get messageTypeCode => throw _privateConstructorUsedError;
  String get messageStatusType => throw _privateConstructorUsedError;
  @ProfileConverter()
  Profile? get profile => throw _privateConstructorUsedError;
  int get playerMessageTime => throw _privateConstructorUsedError;

  /// Serializes this VodChat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VodChat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VodChatCopyWith<VodChat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodChatCopyWith<$Res> {
  factory $VodChatCopyWith(VodChat value, $Res Function(VodChat) then) =
      _$VodChatCopyWithImpl<$Res, VodChat>;
  @useResult
  $Res call(
      {String chatChannelId,
      int messageTime,
      String userIdHash,
      String content,
      @ExtrasConverter() Extras? extras,
      int messageTypeCode,
      String messageStatusType,
      @ProfileConverter() Profile? profile,
      int playerMessageTime});

  $ExtrasCopyWith<$Res>? get extras;
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$VodChatCopyWithImpl<$Res, $Val extends VodChat>
    implements $VodChatCopyWith<$Res> {
  _$VodChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VodChat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatChannelId = null,
    Object? messageTime = null,
    Object? userIdHash = null,
    Object? content = null,
    Object? extras = freezed,
    Object? messageTypeCode = null,
    Object? messageStatusType = null,
    Object? profile = freezed,
    Object? playerMessageTime = null,
  }) {
    return _then(_value.copyWith(
      chatChannelId: null == chatChannelId
          ? _value.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      messageTime: null == messageTime
          ? _value.messageTime
          : messageTime // ignore: cast_nullable_to_non_nullable
              as int,
      userIdHash: null == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras?,
      messageTypeCode: null == messageTypeCode
          ? _value.messageTypeCode
          : messageTypeCode // ignore: cast_nullable_to_non_nullable
              as int,
      messageStatusType: null == messageStatusType
          ? _value.messageStatusType
          : messageStatusType // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      playerMessageTime: null == playerMessageTime
          ? _value.playerMessageTime
          : playerMessageTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of VodChat
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of VodChat
  /// with the given fields replaced by the non-null parameter values.
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
}

/// @nodoc
abstract class _$$VodChatImplCopyWith<$Res> implements $VodChatCopyWith<$Res> {
  factory _$$VodChatImplCopyWith(
          _$VodChatImpl value, $Res Function(_$VodChatImpl) then) =
      __$$VodChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatChannelId,
      int messageTime,
      String userIdHash,
      String content,
      @ExtrasConverter() Extras? extras,
      int messageTypeCode,
      String messageStatusType,
      @ProfileConverter() Profile? profile,
      int playerMessageTime});

  @override
  $ExtrasCopyWith<$Res>? get extras;
  @override
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$VodChatImplCopyWithImpl<$Res>
    extends _$VodChatCopyWithImpl<$Res, _$VodChatImpl>
    implements _$$VodChatImplCopyWith<$Res> {
  __$$VodChatImplCopyWithImpl(
      _$VodChatImpl _value, $Res Function(_$VodChatImpl) _then)
      : super(_value, _then);

  /// Create a copy of VodChat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatChannelId = null,
    Object? messageTime = null,
    Object? userIdHash = null,
    Object? content = null,
    Object? extras = freezed,
    Object? messageTypeCode = null,
    Object? messageStatusType = null,
    Object? profile = freezed,
    Object? playerMessageTime = null,
  }) {
    return _then(_$VodChatImpl(
      chatChannelId: null == chatChannelId
          ? _value.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      messageTime: null == messageTime
          ? _value.messageTime
          : messageTime // ignore: cast_nullable_to_non_nullable
              as int,
      userIdHash: null == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras?,
      messageTypeCode: null == messageTypeCode
          ? _value.messageTypeCode
          : messageTypeCode // ignore: cast_nullable_to_non_nullable
              as int,
      messageStatusType: null == messageStatusType
          ? _value.messageStatusType
          : messageStatusType // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      playerMessageTime: null == playerMessageTime
          ? _value.playerMessageTime
          : playerMessageTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VodChatImpl implements _VodChat {
  const _$VodChatImpl(
      {required this.chatChannelId,
      required this.messageTime,
      required this.userIdHash,
      required this.content,
      @ExtrasConverter() this.extras,
      required this.messageTypeCode,
      required this.messageStatusType,
      @ProfileConverter() this.profile,
      required this.playerMessageTime});

  factory _$VodChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$VodChatImplFromJson(json);

  @override
  final String chatChannelId;
  @override
  final int messageTime;
  @override
  final String userIdHash;
  @override
  final String content;
  @override
  @ExtrasConverter()
  final Extras? extras;
  @override
  final int messageTypeCode;
  @override
  final String messageStatusType;
  @override
  @ProfileConverter()
  final Profile? profile;
  @override
  final int playerMessageTime;

  @override
  String toString() {
    return 'VodChat(chatChannelId: $chatChannelId, messageTime: $messageTime, userIdHash: $userIdHash, content: $content, extras: $extras, messageTypeCode: $messageTypeCode, messageStatusType: $messageStatusType, profile: $profile, playerMessageTime: $playerMessageTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodChatImpl &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            (identical(other.messageTime, messageTime) ||
                other.messageTime == messageTime) &&
            (identical(other.userIdHash, userIdHash) ||
                other.userIdHash == userIdHash) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.extras, extras) || other.extras == extras) &&
            (identical(other.messageTypeCode, messageTypeCode) ||
                other.messageTypeCode == messageTypeCode) &&
            (identical(other.messageStatusType, messageStatusType) ||
                other.messageStatusType == messageStatusType) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.playerMessageTime, playerMessageTime) ||
                other.playerMessageTime == playerMessageTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chatChannelId,
      messageTime,
      userIdHash,
      content,
      extras,
      messageTypeCode,
      messageStatusType,
      profile,
      playerMessageTime);

  /// Create a copy of VodChat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VodChatImplCopyWith<_$VodChatImpl> get copyWith =>
      __$$VodChatImplCopyWithImpl<_$VodChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VodChatImplToJson(
      this,
    );
  }
}

abstract class _VodChat implements VodChat {
  const factory _VodChat(
      {required final String chatChannelId,
      required final int messageTime,
      required final String userIdHash,
      required final String content,
      @ExtrasConverter() final Extras? extras,
      required final int messageTypeCode,
      required final String messageStatusType,
      @ProfileConverter() final Profile? profile,
      required final int playerMessageTime}) = _$VodChatImpl;

  factory _VodChat.fromJson(Map<String, dynamic> json) = _$VodChatImpl.fromJson;

  @override
  String get chatChannelId;
  @override
  int get messageTime;
  @override
  String get userIdHash;
  @override
  String get content;
  @override
  @ExtrasConverter()
  Extras? get extras;
  @override
  int get messageTypeCode;
  @override
  String get messageStatusType;
  @override
  @ProfileConverter()
  Profile? get profile;
  @override
  int get playerMessageTime;

  /// Create a copy of VodChat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VodChatImplCopyWith<_$VodChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
