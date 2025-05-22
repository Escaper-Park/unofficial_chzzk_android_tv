// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chat {
  String get svcid;
  String get ver;
  List<ChatBdy> get bdy;
  int get cmd; // only use 93101, 93102. Don't accept 93006 to avoid duplicated displaying missions.
  String? get tid;
  String? get cid;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatCopyWith<Chat> get copyWith =>
      _$ChatCopyWithImpl<Chat>(this as Chat, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Chat &&
            (identical(other.svcid, svcid) || other.svcid == svcid) &&
            (identical(other.ver, ver) || other.ver == ver) &&
            const DeepCollectionEquality().equals(other.bdy, bdy) &&
            (identical(other.cmd, cmd) || other.cmd == cmd) &&
            (identical(other.tid, tid) || other.tid == tid) &&
            (identical(other.cid, cid) || other.cid == cid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, svcid, ver,
      const DeepCollectionEquality().hash(bdy), cmd, tid, cid);

  @override
  String toString() {
    return 'Chat(svcid: $svcid, ver: $ver, bdy: $bdy, cmd: $cmd, tid: $tid, cid: $cid)';
  }
}

/// @nodoc
abstract mixin class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) _then) =
      _$ChatCopyWithImpl;
  @useResult
  $Res call(
      {String svcid,
      String ver,
      List<ChatBdy> bdy,
      int cmd,
      String? tid,
      String? cid});
}

/// @nodoc
class _$ChatCopyWithImpl<$Res> implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._self, this._then);

  final Chat _self;
  final $Res Function(Chat) _then;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? svcid = null,
    Object? ver = null,
    Object? bdy = null,
    Object? cmd = null,
    Object? tid = freezed,
    Object? cid = freezed,
  }) {
    return _then(Chat(
      svcid: null == svcid
          ? _self.svcid
          : svcid // ignore: cast_nullable_to_non_nullable
              as String,
      ver: null == ver
          ? _self.ver
          : ver // ignore: cast_nullable_to_non_nullable
              as String,
      bdy: null == bdy
          ? _self.bdy
          : bdy // ignore: cast_nullable_to_non_nullable
              as List<ChatBdy>,
      cmd: null == cmd
          ? _self.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as int,
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
mixin _$ChatBdy {
  String get svcid;
  String get cid;
  int get mbrCnt;
  String get uid;
  Profile? get profile;
  String get msg;
  int get msgTypeCode;
  String get msgStatusType;
  Extras? get extras;
  int get ctime;
  int get utime;
  int get msgTime;

  /// Create a copy of ChatBdy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatBdyCopyWith<ChatBdy> get copyWith =>
      _$ChatBdyCopyWithImpl<ChatBdy>(this as ChatBdy, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatBdy &&
            (identical(other.svcid, svcid) || other.svcid == svcid) &&
            (identical(other.cid, cid) || other.cid == cid) &&
            (identical(other.mbrCnt, mbrCnt) || other.mbrCnt == mbrCnt) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.msgTypeCode, msgTypeCode) ||
                other.msgTypeCode == msgTypeCode) &&
            (identical(other.msgStatusType, msgStatusType) ||
                other.msgStatusType == msgStatusType) &&
            (identical(other.extras, extras) || other.extras == extras) &&
            (identical(other.ctime, ctime) || other.ctime == ctime) &&
            (identical(other.utime, utime) || other.utime == utime) &&
            (identical(other.msgTime, msgTime) || other.msgTime == msgTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, svcid, cid, mbrCnt, uid, profile,
      msg, msgTypeCode, msgStatusType, extras, ctime, utime, msgTime);

  @override
  String toString() {
    return 'ChatBdy(svcid: $svcid, cid: $cid, mbrCnt: $mbrCnt, uid: $uid, profile: $profile, msg: $msg, msgTypeCode: $msgTypeCode, msgStatusType: $msgStatusType, extras: $extras, ctime: $ctime, utime: $utime, msgTime: $msgTime)';
  }
}

/// @nodoc
abstract mixin class $ChatBdyCopyWith<$Res> {
  factory $ChatBdyCopyWith(ChatBdy value, $Res Function(ChatBdy) _then) =
      _$ChatBdyCopyWithImpl;
  @useResult
  $Res call(
      {String svcid,
      String cid,
      int mbrCnt,
      String uid,
      @ProfileConverter() Profile? profile,
      String msg,
      int msgTypeCode,
      String msgStatusType,
      @ExtrasConverter() Extras? extras,
      int ctime,
      int utime,
      int msgTime});
}

/// @nodoc
class _$ChatBdyCopyWithImpl<$Res> implements $ChatBdyCopyWith<$Res> {
  _$ChatBdyCopyWithImpl(this._self, this._then);

  final ChatBdy _self;
  final $Res Function(ChatBdy) _then;

  /// Create a copy of ChatBdy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? svcid = null,
    Object? cid = null,
    Object? mbrCnt = null,
    Object? uid = null,
    Object? profile = freezed,
    Object? msg = null,
    Object? msgTypeCode = null,
    Object? msgStatusType = null,
    Object? extras = freezed,
    Object? ctime = null,
    Object? utime = null,
    Object? msgTime = null,
  }) {
    return _then(ChatBdy(
      svcid: null == svcid
          ? _self.svcid
          : svcid // ignore: cast_nullable_to_non_nullable
              as String,
      cid: null == cid
          ? _self.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String,
      mbrCnt: null == mbrCnt
          ? _self.mbrCnt
          : mbrCnt // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      msg: null == msg
          ? _self.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      msgTypeCode: null == msgTypeCode
          ? _self.msgTypeCode
          : msgTypeCode // ignore: cast_nullable_to_non_nullable
              as int,
      msgStatusType: null == msgStatusType
          ? _self.msgStatusType
          : msgStatusType // ignore: cast_nullable_to_non_nullable
              as String,
      extras: freezed == extras
          ? _self.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras?,
      ctime: null == ctime
          ? _self.ctime
          : ctime // ignore: cast_nullable_to_non_nullable
              as int,
      utime: null == utime
          ? _self.utime
          : utime // ignore: cast_nullable_to_non_nullable
              as int,
      msgTime: null == msgTime
          ? _self.msgTime
          : msgTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
