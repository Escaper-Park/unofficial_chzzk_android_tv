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
  Extras? get extras => throw _privateConstructorUsedError;
  int get messageTypeCode => throw _privateConstructorUsedError;
  String get messageStatusType => throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;
  int get playerMessageTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      Extras? extras,
      int messageTypeCode,
      String messageStatusType,
      Profile? profile,
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
      Extras? extras,
      int messageTypeCode,
      String messageStatusType,
      Profile? profile,
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
      required this.extras,
      required this.messageTypeCode,
      required this.messageStatusType,
      required this.profile,
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
  final Extras? extras;
  @override
  final int messageTypeCode;
  @override
  final String messageStatusType;
  @override
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
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
      required final Extras? extras,
      required final int messageTypeCode,
      required final String messageStatusType,
      required final Profile? profile,
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
  Extras? get extras;
  @override
  int get messageTypeCode;
  @override
  String get messageStatusType;
  @override
  Profile? get profile;
  @override
  int get playerMessageTime;
  @override
  @JsonKey(ignore: true)
  _$$VodChatImplCopyWith<_$VodChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VodChatResponse _$VodChatResponseFromJson(Map<String, dynamic> json) {
  return _VodChatResponse.fromJson(json);
}

/// @nodoc
mixin _$VodChatResponse {
  int? get nextPlayerMessageTime => throw _privateConstructorUsedError;
  List<VodChat>? get previousVideoChats => throw _privateConstructorUsedError;
  List<VodChat>? get videoChats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VodChatResponseCopyWith<VodChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodChatResponseCopyWith<$Res> {
  factory $VodChatResponseCopyWith(
          VodChatResponse value, $Res Function(VodChatResponse) then) =
      _$VodChatResponseCopyWithImpl<$Res, VodChatResponse>;
  @useResult
  $Res call(
      {int? nextPlayerMessageTime,
      List<VodChat>? previousVideoChats,
      List<VodChat>? videoChats});
}

/// @nodoc
class _$VodChatResponseCopyWithImpl<$Res, $Val extends VodChatResponse>
    implements $VodChatResponseCopyWith<$Res> {
  _$VodChatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPlayerMessageTime = freezed,
    Object? previousVideoChats = freezed,
    Object? videoChats = freezed,
  }) {
    return _then(_value.copyWith(
      nextPlayerMessageTime: freezed == nextPlayerMessageTime
          ? _value.nextPlayerMessageTime
          : nextPlayerMessageTime // ignore: cast_nullable_to_non_nullable
              as int?,
      previousVideoChats: freezed == previousVideoChats
          ? _value.previousVideoChats
          : previousVideoChats // ignore: cast_nullable_to_non_nullable
              as List<VodChat>?,
      videoChats: freezed == videoChats
          ? _value.videoChats
          : videoChats // ignore: cast_nullable_to_non_nullable
              as List<VodChat>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VodChatResponseImplCopyWith<$Res>
    implements $VodChatResponseCopyWith<$Res> {
  factory _$$VodChatResponseImplCopyWith(_$VodChatResponseImpl value,
          $Res Function(_$VodChatResponseImpl) then) =
      __$$VodChatResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? nextPlayerMessageTime,
      List<VodChat>? previousVideoChats,
      List<VodChat>? videoChats});
}

/// @nodoc
class __$$VodChatResponseImplCopyWithImpl<$Res>
    extends _$VodChatResponseCopyWithImpl<$Res, _$VodChatResponseImpl>
    implements _$$VodChatResponseImplCopyWith<$Res> {
  __$$VodChatResponseImplCopyWithImpl(
      _$VodChatResponseImpl _value, $Res Function(_$VodChatResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPlayerMessageTime = freezed,
    Object? previousVideoChats = freezed,
    Object? videoChats = freezed,
  }) {
    return _then(_$VodChatResponseImpl(
      nextPlayerMessageTime: freezed == nextPlayerMessageTime
          ? _value.nextPlayerMessageTime
          : nextPlayerMessageTime // ignore: cast_nullable_to_non_nullable
              as int?,
      previousVideoChats: freezed == previousVideoChats
          ? _value._previousVideoChats
          : previousVideoChats // ignore: cast_nullable_to_non_nullable
              as List<VodChat>?,
      videoChats: freezed == videoChats
          ? _value._videoChats
          : videoChats // ignore: cast_nullable_to_non_nullable
              as List<VodChat>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VodChatResponseImpl implements _VodChatResponse {
  const _$VodChatResponseImpl(
      {required this.nextPlayerMessageTime,
      required final List<VodChat>? previousVideoChats,
      required final List<VodChat>? videoChats})
      : _previousVideoChats = previousVideoChats,
        _videoChats = videoChats;

  factory _$VodChatResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VodChatResponseImplFromJson(json);

  @override
  final int? nextPlayerMessageTime;
  final List<VodChat>? _previousVideoChats;
  @override
  List<VodChat>? get previousVideoChats {
    final value = _previousVideoChats;
    if (value == null) return null;
    if (_previousVideoChats is EqualUnmodifiableListView)
      return _previousVideoChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<VodChat>? _videoChats;
  @override
  List<VodChat>? get videoChats {
    final value = _videoChats;
    if (value == null) return null;
    if (_videoChats is EqualUnmodifiableListView) return _videoChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VodChatResponse(nextPlayerMessageTime: $nextPlayerMessageTime, previousVideoChats: $previousVideoChats, videoChats: $videoChats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodChatResponseImpl &&
            (identical(other.nextPlayerMessageTime, nextPlayerMessageTime) ||
                other.nextPlayerMessageTime == nextPlayerMessageTime) &&
            const DeepCollectionEquality()
                .equals(other._previousVideoChats, _previousVideoChats) &&
            const DeepCollectionEquality()
                .equals(other._videoChats, _videoChats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nextPlayerMessageTime,
      const DeepCollectionEquality().hash(_previousVideoChats),
      const DeepCollectionEquality().hash(_videoChats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VodChatResponseImplCopyWith<_$VodChatResponseImpl> get copyWith =>
      __$$VodChatResponseImplCopyWithImpl<_$VodChatResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VodChatResponseImplToJson(
      this,
    );
  }
}

abstract class _VodChatResponse implements VodChatResponse {
  const factory _VodChatResponse(
      {required final int? nextPlayerMessageTime,
      required final List<VodChat>? previousVideoChats,
      required final List<VodChat>? videoChats}) = _$VodChatResponseImpl;

  factory _VodChatResponse.fromJson(Map<String, dynamic> json) =
      _$VodChatResponseImpl.fromJson;

  @override
  int? get nextPlayerMessageTime;
  @override
  List<VodChat>? get previousVideoChats;
  @override
  List<VodChat>? get videoChats;
  @override
  @JsonKey(ignore: true)
  _$$VodChatResponseImplCopyWith<_$VodChatResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
