// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecentChat {
  String get svcid;
  List<RecentChatBdy> get bdy;
  int get cmd;
  int get retCode;
  String? get retMsg;
  String? get tid;
  String? get cid;

  /// Create a copy of RecentChat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecentChatCopyWith<RecentChat> get copyWith =>
      _$RecentChatCopyWithImpl<RecentChat>(this as RecentChat, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecentChat &&
            (identical(other.svcid, svcid) || other.svcid == svcid) &&
            const DeepCollectionEquality().equals(other.bdy, bdy) &&
            (identical(other.cmd, cmd) || other.cmd == cmd) &&
            (identical(other.retCode, retCode) || other.retCode == retCode) &&
            (identical(other.retMsg, retMsg) || other.retMsg == retMsg) &&
            (identical(other.tid, tid) || other.tid == tid) &&
            (identical(other.cid, cid) || other.cid == cid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, svcid,
      const DeepCollectionEquality().hash(bdy), cmd, retCode, retMsg, tid, cid);

  @override
  String toString() {
    return 'RecentChat(svcid: $svcid, bdy: $bdy, cmd: $cmd, retCode: $retCode, retMsg: $retMsg, tid: $tid, cid: $cid)';
  }
}

/// @nodoc
abstract mixin class $RecentChatCopyWith<$Res> {
  factory $RecentChatCopyWith(
          RecentChat value, $Res Function(RecentChat) _then) =
      _$RecentChatCopyWithImpl;
  @useResult
  $Res call(
      {String svcid,
      List<RecentChatBdy> bdy,
      int cmd,
      int retCode,
      String? retMsg,
      String? tid,
      String? cid});
}

/// @nodoc
class _$RecentChatCopyWithImpl<$Res> implements $RecentChatCopyWith<$Res> {
  _$RecentChatCopyWithImpl(this._self, this._then);

  final RecentChat _self;
  final $Res Function(RecentChat) _then;

  /// Create a copy of RecentChat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? svcid = null,
    Object? bdy = null,
    Object? cmd = null,
    Object? retCode = null,
    Object? retMsg = freezed,
    Object? tid = freezed,
    Object? cid = freezed,
  }) {
    return _then(RecentChat(
      svcid: null == svcid
          ? _self.svcid
          : svcid // ignore: cast_nullable_to_non_nullable
              as String,
      bdy: null == bdy
          ? _self.bdy
          : bdy // ignore: cast_nullable_to_non_nullable
              as List<RecentChatBdy>,
      cmd: null == cmd
          ? _self.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as int,
      retCode: null == retCode
          ? _self.retCode
          : retCode // ignore: cast_nullable_to_non_nullable
              as int,
      retMsg: freezed == retMsg
          ? _self.retMsg
          : retMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      tid: freezed == tid
          ? _self.tid
          : tid // ignore: cast_nullable_to_non_nullable
              as String?,
      cid: freezed == cid
          ? _self.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$RecentChatBdy {
  List<RecentChatMsg> get messageList;
  int? get userCount;

  /// Create a copy of RecentChatBdy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecentChatBdyCopyWith<RecentChatBdy> get copyWith =>
      _$RecentChatBdyCopyWithImpl<RecentChatBdy>(
          this as RecentChatBdy, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecentChatBdy &&
            const DeepCollectionEquality()
                .equals(other.messageList, messageList) &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(messageList), userCount);

  @override
  String toString() {
    return 'RecentChatBdy(messageList: $messageList, userCount: $userCount)';
  }
}

/// @nodoc
abstract mixin class $RecentChatBdyCopyWith<$Res> {
  factory $RecentChatBdyCopyWith(
          RecentChatBdy value, $Res Function(RecentChatBdy) _then) =
      _$RecentChatBdyCopyWithImpl;
  @useResult
  $Res call({List<RecentChatMsg> messageList, int? userCount});
}

/// @nodoc
class _$RecentChatBdyCopyWithImpl<$Res>
    implements $RecentChatBdyCopyWith<$Res> {
  _$RecentChatBdyCopyWithImpl(this._self, this._then);

  final RecentChatBdy _self;
  final $Res Function(RecentChatBdy) _then;

  /// Create a copy of RecentChatBdy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageList = null,
    Object? userCount = freezed,
  }) {
    return _then(RecentChatBdy(
      messageList: null == messageList
          ? _self.messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<RecentChatMsg>,
      userCount: freezed == userCount
          ? _self.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$RecentChatMsg {
  String get serviceId;
  String get channelId;
  int get messageTime;
  String get userId;
  Profile? get profile;
  String get content;
  Extras? get extras;
  int get memberCount;
  int get messageTypeCode;
  String get messageStatusType;
  int get createTime;
  int get updateTime;

  /// Create a copy of RecentChatMsg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecentChatMsgCopyWith<RecentChatMsg> get copyWith =>
      _$RecentChatMsgCopyWithImpl<RecentChatMsg>(
          this as RecentChatMsg, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecentChatMsg &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.messageTime, messageTime) ||
                other.messageTime == messageTime) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.extras, extras) || other.extras == extras) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.messageTypeCode, messageTypeCode) ||
                other.messageTypeCode == messageTypeCode) &&
            (identical(other.messageStatusType, messageStatusType) ||
                other.messageStatusType == messageStatusType) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      serviceId,
      channelId,
      messageTime,
      userId,
      profile,
      content,
      extras,
      memberCount,
      messageTypeCode,
      messageStatusType,
      createTime,
      updateTime);

  @override
  String toString() {
    return 'RecentChatMsg(serviceId: $serviceId, channelId: $channelId, messageTime: $messageTime, userId: $userId, profile: $profile, content: $content, extras: $extras, memberCount: $memberCount, messageTypeCode: $messageTypeCode, messageStatusType: $messageStatusType, createTime: $createTime, updateTime: $updateTime)';
  }
}

/// @nodoc
abstract mixin class $RecentChatMsgCopyWith<$Res> {
  factory $RecentChatMsgCopyWith(
          RecentChatMsg value, $Res Function(RecentChatMsg) _then) =
      _$RecentChatMsgCopyWithImpl;
  @useResult
  $Res call(
      {String serviceId,
      String channelId,
      int messageTime,
      String userId,
      Profile? profile,
      String content,
      Extras? extras,
      int memberCount,
      int messageTypeCode,
      String messageStatusType,
      int createTime,
      int updateTime});
}

/// @nodoc
class _$RecentChatMsgCopyWithImpl<$Res>
    implements $RecentChatMsgCopyWith<$Res> {
  _$RecentChatMsgCopyWithImpl(this._self, this._then);

  final RecentChatMsg _self;
  final $Res Function(RecentChatMsg) _then;

  /// Create a copy of RecentChatMsg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? channelId = null,
    Object? messageTime = null,
    Object? userId = null,
    Object? profile = freezed,
    Object? content = null,
    Object? extras = freezed,
    Object? memberCount = null,
    Object? messageTypeCode = null,
    Object? messageStatusType = null,
    Object? createTime = null,
    Object? updateTime = null,
  }) {
    return _then(RecentChatMsg(
      serviceId: null == serviceId
          ? _self.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      messageTime: null == messageTime
          ? _self.messageTime
          : messageTime // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      extras: freezed == extras
          ? _self.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras?,
      memberCount: null == memberCount
          ? _self.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      messageTypeCode: null == messageTypeCode
          ? _self.messageTypeCode
          : messageTypeCode // ignore: cast_nullable_to_non_nullable
              as int,
      messageStatusType: null == messageStatusType
          ? _self.messageStatusType
          : messageStatusType // ignore: cast_nullable_to_non_nullable
              as String,
      createTime: null == createTime
          ? _self.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as int,
      updateTime: null == updateTime
          ? _self.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
