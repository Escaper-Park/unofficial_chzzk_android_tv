// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VodChat {
  String get chatChannelId;
  int get messageTime;
  String get userIdHash;
  String get content;
  Extras? get extras;
  int get messageTypeCode;
  String get messageStatusType;
  Profile? get profile;
  int get playerMessageTime;

  /// Create a copy of VodChat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodChatCopyWith<VodChat> get copyWith =>
      _$VodChatCopyWithImpl<VodChat>(this as VodChat, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodChat &&
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

  @override
  String toString() {
    return 'VodChat(chatChannelId: $chatChannelId, messageTime: $messageTime, userIdHash: $userIdHash, content: $content, extras: $extras, messageTypeCode: $messageTypeCode, messageStatusType: $messageStatusType, profile: $profile, playerMessageTime: $playerMessageTime)';
  }
}

/// @nodoc
abstract mixin class $VodChatCopyWith<$Res> {
  factory $VodChatCopyWith(VodChat value, $Res Function(VodChat) _then) =
      _$VodChatCopyWithImpl;
  @useResult
  $Res call(
      {String chatChannelId,
      int messageTime,
      String userIdHash,
      String content,
      Extras? extras,
      int messageTypeCode,
      String messageStatusType,
      Profile? profile,
      int playerMessageTime});
}

/// @nodoc
class _$VodChatCopyWithImpl<$Res> implements $VodChatCopyWith<$Res> {
  _$VodChatCopyWithImpl(this._self, this._then);

  final VodChat _self;
  final $Res Function(VodChat) _then;

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
    return _then(VodChat(
      chatChannelId: null == chatChannelId
          ? _self.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      messageTime: null == messageTime
          ? _self.messageTime
          : messageTime // ignore: cast_nullable_to_non_nullable
              as int,
      userIdHash: null == userIdHash
          ? _self.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      extras: freezed == extras
          ? _self.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras?,
      messageTypeCode: null == messageTypeCode
          ? _self.messageTypeCode
          : messageTypeCode // ignore: cast_nullable_to_non_nullable
              as int,
      messageStatusType: null == messageStatusType
          ? _self.messageStatusType
          : messageStatusType // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      playerMessageTime: null == playerMessageTime
          ? _self.playerMessageTime
          : playerMessageTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
