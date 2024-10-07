// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
mixin _$Chat {
  String get svcid => throw _privateConstructorUsedError;
  String get ver => throw _privateConstructorUsedError;
  List<ChatBdy> get bdy => throw _privateConstructorUsedError;
  int get cmd => throw _privateConstructorUsedError;
  String? get tid => throw _privateConstructorUsedError;
  String? get cid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
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
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      svcid: null == svcid
          ? _value.svcid
          : svcid // ignore: cast_nullable_to_non_nullable
              as String,
      ver: null == ver
          ? _value.ver
          : ver // ignore: cast_nullable_to_non_nullable
              as String,
      bdy: null == bdy
          ? _value.bdy
          : bdy // ignore: cast_nullable_to_non_nullable
              as List<ChatBdy>,
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as int,
      tid: freezed == tid
          ? _value.tid
          : tid // ignore: cast_nullable_to_non_nullable
              as String?,
      cid: freezed == cid
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatImplCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$ChatImplCopyWith(
          _$ChatImpl value, $Res Function(_$ChatImpl) then) =
      __$$ChatImplCopyWithImpl<$Res>;
  @override
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
class __$$ChatImplCopyWithImpl<$Res>
    extends _$ChatCopyWithImpl<$Res, _$ChatImpl>
    implements _$$ChatImplCopyWith<$Res> {
  __$$ChatImplCopyWithImpl(_$ChatImpl _value, $Res Function(_$ChatImpl) _then)
      : super(_value, _then);

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
    return _then(_$ChatImpl(
      svcid: null == svcid
          ? _value.svcid
          : svcid // ignore: cast_nullable_to_non_nullable
              as String,
      ver: null == ver
          ? _value.ver
          : ver // ignore: cast_nullable_to_non_nullable
              as String,
      bdy: null == bdy
          ? _value._bdy
          : bdy // ignore: cast_nullable_to_non_nullable
              as List<ChatBdy>,
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as int,
      tid: freezed == tid
          ? _value.tid
          : tid // ignore: cast_nullable_to_non_nullable
              as String?,
      cid: freezed == cid
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatImpl implements _Chat {
  const _$ChatImpl(
      {required this.svcid,
      required this.ver,
      required final List<ChatBdy> bdy,
      required this.cmd,
      required this.tid,
      required this.cid})
      : _bdy = bdy;

  factory _$ChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatImplFromJson(json);

  @override
  final String svcid;
  @override
  final String ver;
  final List<ChatBdy> _bdy;
  @override
  List<ChatBdy> get bdy {
    if (_bdy is EqualUnmodifiableListView) return _bdy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bdy);
  }

  @override
  final int cmd;
  @override
  final String? tid;
  @override
  final String? cid;

  @override
  String toString() {
    return 'Chat(svcid: $svcid, ver: $ver, bdy: $bdy, cmd: $cmd, tid: $tid, cid: $cid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatImpl &&
            (identical(other.svcid, svcid) || other.svcid == svcid) &&
            (identical(other.ver, ver) || other.ver == ver) &&
            const DeepCollectionEquality().equals(other._bdy, _bdy) &&
            (identical(other.cmd, cmd) || other.cmd == cmd) &&
            (identical(other.tid, tid) || other.tid == tid) &&
            (identical(other.cid, cid) || other.cid == cid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, svcid, ver,
      const DeepCollectionEquality().hash(_bdy), cmd, tid, cid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      __$$ChatImplCopyWithImpl<_$ChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatImplToJson(
      this,
    );
  }
}

abstract class _Chat implements Chat {
  const factory _Chat(
      {required final String svcid,
      required final String ver,
      required final List<ChatBdy> bdy,
      required final int cmd,
      required final String? tid,
      required final String? cid}) = _$ChatImpl;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$ChatImpl.fromJson;

  @override
  String get svcid;
  @override
  String get ver;
  @override
  List<ChatBdy> get bdy;
  @override
  int get cmd;
  @override
  String? get tid;
  @override
  String? get cid;
  @override
  @JsonKey(ignore: true)
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatBdy _$ChatBdyFromJson(Map<String, dynamic> json) {
  return _ChatBdy.fromJson(json);
}

/// @nodoc
mixin _$ChatBdy {
  String get svcid => throw _privateConstructorUsedError;
  String get cid => throw _privateConstructorUsedError;
  int get mbrCnt => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(fromJson: profileFromJson)
  Profile? get profile => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  int get msgTypeCode => throw _privateConstructorUsedError;
  String get msgStatusType => throw _privateConstructorUsedError;
  @JsonKey(fromJson: extrasFromJson)
  Extras? get extras => throw _privateConstructorUsedError;
  int get ctime => throw _privateConstructorUsedError;
  int get utime => throw _privateConstructorUsedError;
  Object? get msgTid => throw _privateConstructorUsedError;
  int get msgTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatBdyCopyWith<ChatBdy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBdyCopyWith<$Res> {
  factory $ChatBdyCopyWith(ChatBdy value, $Res Function(ChatBdy) then) =
      _$ChatBdyCopyWithImpl<$Res, ChatBdy>;
  @useResult
  $Res call(
      {String svcid,
      String cid,
      int mbrCnt,
      String uid,
      @JsonKey(fromJson: profileFromJson) Profile? profile,
      String msg,
      int msgTypeCode,
      String msgStatusType,
      @JsonKey(fromJson: extrasFromJson) Extras? extras,
      int ctime,
      int utime,
      Object? msgTid,
      int msgTime});

  $ProfileCopyWith<$Res>? get profile;
  $ExtrasCopyWith<$Res>? get extras;
}

/// @nodoc
class _$ChatBdyCopyWithImpl<$Res, $Val extends ChatBdy>
    implements $ChatBdyCopyWith<$Res> {
  _$ChatBdyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? msgTid = freezed,
    Object? msgTime = null,
  }) {
    return _then(_value.copyWith(
      svcid: null == svcid
          ? _value.svcid
          : svcid // ignore: cast_nullable_to_non_nullable
              as String,
      cid: null == cid
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String,
      mbrCnt: null == mbrCnt
          ? _value.mbrCnt
          : mbrCnt // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      msgTypeCode: null == msgTypeCode
          ? _value.msgTypeCode
          : msgTypeCode // ignore: cast_nullable_to_non_nullable
              as int,
      msgStatusType: null == msgStatusType
          ? _value.msgStatusType
          : msgStatusType // ignore: cast_nullable_to_non_nullable
              as String,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras?,
      ctime: null == ctime
          ? _value.ctime
          : ctime // ignore: cast_nullable_to_non_nullable
              as int,
      utime: null == utime
          ? _value.utime
          : utime // ignore: cast_nullable_to_non_nullable
              as int,
      msgTid: freezed == msgTid ? _value.msgTid : msgTid,
      msgTime: null == msgTime
          ? _value.msgTime
          : msgTime // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ChatBdyImplCopyWith<$Res> implements $ChatBdyCopyWith<$Res> {
  factory _$$ChatBdyImplCopyWith(
          _$ChatBdyImpl value, $Res Function(_$ChatBdyImpl) then) =
      __$$ChatBdyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String svcid,
      String cid,
      int mbrCnt,
      String uid,
      @JsonKey(fromJson: profileFromJson) Profile? profile,
      String msg,
      int msgTypeCode,
      String msgStatusType,
      @JsonKey(fromJson: extrasFromJson) Extras? extras,
      int ctime,
      int utime,
      Object? msgTid,
      int msgTime});

  @override
  $ProfileCopyWith<$Res>? get profile;
  @override
  $ExtrasCopyWith<$Res>? get extras;
}

/// @nodoc
class __$$ChatBdyImplCopyWithImpl<$Res>
    extends _$ChatBdyCopyWithImpl<$Res, _$ChatBdyImpl>
    implements _$$ChatBdyImplCopyWith<$Res> {
  __$$ChatBdyImplCopyWithImpl(
      _$ChatBdyImpl _value, $Res Function(_$ChatBdyImpl) _then)
      : super(_value, _then);

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
    Object? msgTid = freezed,
    Object? msgTime = null,
  }) {
    return _then(_$ChatBdyImpl(
      svcid: null == svcid
          ? _value.svcid
          : svcid // ignore: cast_nullable_to_non_nullable
              as String,
      cid: null == cid
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String,
      mbrCnt: null == mbrCnt
          ? _value.mbrCnt
          : mbrCnt // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      msgTypeCode: null == msgTypeCode
          ? _value.msgTypeCode
          : msgTypeCode // ignore: cast_nullable_to_non_nullable
              as int,
      msgStatusType: null == msgStatusType
          ? _value.msgStatusType
          : msgStatusType // ignore: cast_nullable_to_non_nullable
              as String,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras?,
      ctime: null == ctime
          ? _value.ctime
          : ctime // ignore: cast_nullable_to_non_nullable
              as int,
      utime: null == utime
          ? _value.utime
          : utime // ignore: cast_nullable_to_non_nullable
              as int,
      msgTid: freezed == msgTid ? _value.msgTid : msgTid,
      msgTime: null == msgTime
          ? _value.msgTime
          : msgTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatBdyImpl implements _ChatBdy {
  const _$ChatBdyImpl(
      {required this.svcid,
      required this.cid,
      required this.mbrCnt,
      required this.uid,
      @JsonKey(fromJson: profileFromJson) required this.profile,
      required this.msg,
      required this.msgTypeCode,
      required this.msgStatusType,
      @JsonKey(fromJson: extrasFromJson) required this.extras,
      required this.ctime,
      required this.utime,
      required this.msgTid,
      required this.msgTime});

  factory _$ChatBdyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatBdyImplFromJson(json);

  @override
  final String svcid;
  @override
  final String cid;
  @override
  final int mbrCnt;
  @override
  final String uid;
  @override
  @JsonKey(fromJson: profileFromJson)
  final Profile? profile;
  @override
  final String msg;
  @override
  final int msgTypeCode;
  @override
  final String msgStatusType;
  @override
  @JsonKey(fromJson: extrasFromJson)
  final Extras? extras;
  @override
  final int ctime;
  @override
  final int utime;
  @override
  final Object? msgTid;
  @override
  final int msgTime;

  @override
  String toString() {
    return 'ChatBdy(svcid: $svcid, cid: $cid, mbrCnt: $mbrCnt, uid: $uid, profile: $profile, msg: $msg, msgTypeCode: $msgTypeCode, msgStatusType: $msgStatusType, extras: $extras, ctime: $ctime, utime: $utime, msgTid: $msgTid, msgTime: $msgTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatBdyImpl &&
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
            const DeepCollectionEquality().equals(other.msgTid, msgTid) &&
            (identical(other.msgTime, msgTime) || other.msgTime == msgTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      svcid,
      cid,
      mbrCnt,
      uid,
      profile,
      msg,
      msgTypeCode,
      msgStatusType,
      extras,
      ctime,
      utime,
      const DeepCollectionEquality().hash(msgTid),
      msgTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatBdyImplCopyWith<_$ChatBdyImpl> get copyWith =>
      __$$ChatBdyImplCopyWithImpl<_$ChatBdyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatBdyImplToJson(
      this,
    );
  }
}

abstract class _ChatBdy implements ChatBdy {
  const factory _ChatBdy(
      {required final String svcid,
      required final String cid,
      required final int mbrCnt,
      required final String uid,
      @JsonKey(fromJson: profileFromJson) required final Profile? profile,
      required final String msg,
      required final int msgTypeCode,
      required final String msgStatusType,
      @JsonKey(fromJson: extrasFromJson) required final Extras? extras,
      required final int ctime,
      required final int utime,
      required final Object? msgTid,
      required final int msgTime}) = _$ChatBdyImpl;

  factory _ChatBdy.fromJson(Map<String, dynamic> json) = _$ChatBdyImpl.fromJson;

  @override
  String get svcid;
  @override
  String get cid;
  @override
  int get mbrCnt;
  @override
  String get uid;
  @override
  @JsonKey(fromJson: profileFromJson)
  Profile? get profile;
  @override
  String get msg;
  @override
  int get msgTypeCode;
  @override
  String get msgStatusType;
  @override
  @JsonKey(fromJson: extrasFromJson)
  Extras? get extras;
  @override
  int get ctime;
  @override
  int get utime;
  @override
  Object? get msgTid;
  @override
  int get msgTime;
  @override
  @JsonKey(ignore: true)
  _$$ChatBdyImplCopyWith<_$ChatBdyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String? get userIdHash => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get userRoleCode =>
      throw _privateConstructorUsedError; // "common-user", "streaming_channel_manager", "streaming_chat_manager",
  Badge? get badge => throw _privateConstructorUsedError;
  ChatTitle? get title => throw _privateConstructorUsedError;
  bool? get verifiedMark => throw _privateConstructorUsedError;
  List<ActivityBadge>? get activityBadges => throw _privateConstructorUsedError;
  StreamingProperty? get streamingProperty =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String? userIdHash,
      String? nickname,
      String? profileImageUrl,
      String? userRoleCode,
      Badge? badge,
      ChatTitle? title,
      bool? verifiedMark,
      List<ActivityBadge>? activityBadges,
      StreamingProperty? streamingProperty});

  $BadgeCopyWith<$Res>? get badge;
  $ChatTitleCopyWith<$Res>? get title;
  $StreamingPropertyCopyWith<$Res>? get streamingProperty;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIdHash = freezed,
    Object? nickname = freezed,
    Object? profileImageUrl = freezed,
    Object? userRoleCode = freezed,
    Object? badge = freezed,
    Object? title = freezed,
    Object? verifiedMark = freezed,
    Object? activityBadges = freezed,
    Object? streamingProperty = freezed,
  }) {
    return _then(_value.copyWith(
      userIdHash: freezed == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userRoleCode: freezed == userRoleCode
          ? _value.userRoleCode
          : userRoleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as Badge?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as ChatTitle?,
      verifiedMark: freezed == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool?,
      activityBadges: freezed == activityBadges
          ? _value.activityBadges
          : activityBadges // ignore: cast_nullable_to_non_nullable
              as List<ActivityBadge>?,
      streamingProperty: freezed == streamingProperty
          ? _value.streamingProperty
          : streamingProperty // ignore: cast_nullable_to_non_nullable
              as StreamingProperty?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BadgeCopyWith<$Res>? get badge {
    if (_value.badge == null) {
      return null;
    }

    return $BadgeCopyWith<$Res>(_value.badge!, (value) {
      return _then(_value.copyWith(badge: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatTitleCopyWith<$Res>? get title {
    if (_value.title == null) {
      return null;
    }

    return $ChatTitleCopyWith<$Res>(_value.title!, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StreamingPropertyCopyWith<$Res>? get streamingProperty {
    if (_value.streamingProperty == null) {
      return null;
    }

    return $StreamingPropertyCopyWith<$Res>(_value.streamingProperty!, (value) {
      return _then(_value.copyWith(streamingProperty: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userIdHash,
      String? nickname,
      String? profileImageUrl,
      String? userRoleCode,
      Badge? badge,
      ChatTitle? title,
      bool? verifiedMark,
      List<ActivityBadge>? activityBadges,
      StreamingProperty? streamingProperty});

  @override
  $BadgeCopyWith<$Res>? get badge;
  @override
  $ChatTitleCopyWith<$Res>? get title;
  @override
  $StreamingPropertyCopyWith<$Res>? get streamingProperty;
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIdHash = freezed,
    Object? nickname = freezed,
    Object? profileImageUrl = freezed,
    Object? userRoleCode = freezed,
    Object? badge = freezed,
    Object? title = freezed,
    Object? verifiedMark = freezed,
    Object? activityBadges = freezed,
    Object? streamingProperty = freezed,
  }) {
    return _then(_$ProfileImpl(
      userIdHash: freezed == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userRoleCode: freezed == userRoleCode
          ? _value.userRoleCode
          : userRoleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as Badge?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as ChatTitle?,
      verifiedMark: freezed == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool?,
      activityBadges: freezed == activityBadges
          ? _value._activityBadges
          : activityBadges // ignore: cast_nullable_to_non_nullable
              as List<ActivityBadge>?,
      streamingProperty: freezed == streamingProperty
          ? _value.streamingProperty
          : streamingProperty // ignore: cast_nullable_to_non_nullable
              as StreamingProperty?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl(
      {required this.userIdHash,
      required this.nickname,
      required this.profileImageUrl,
      required this.userRoleCode,
      required this.badge,
      required this.title,
      required this.verifiedMark,
      required final List<ActivityBadge>? activityBadges,
      required this.streamingProperty})
      : _activityBadges = activityBadges;

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final String? userIdHash;
  @override
  final String? nickname;
  @override
  final String? profileImageUrl;
  @override
  final String? userRoleCode;
// "common-user", "streaming_channel_manager", "streaming_chat_manager",
  @override
  final Badge? badge;
  @override
  final ChatTitle? title;
  @override
  final bool? verifiedMark;
  final List<ActivityBadge>? _activityBadges;
  @override
  List<ActivityBadge>? get activityBadges {
    final value = _activityBadges;
    if (value == null) return null;
    if (_activityBadges is EqualUnmodifiableListView) return _activityBadges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final StreamingProperty? streamingProperty;

  @override
  String toString() {
    return 'Profile(userIdHash: $userIdHash, nickname: $nickname, profileImageUrl: $profileImageUrl, userRoleCode: $userRoleCode, badge: $badge, title: $title, verifiedMark: $verifiedMark, activityBadges: $activityBadges, streamingProperty: $streamingProperty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.userIdHash, userIdHash) ||
                other.userIdHash == userIdHash) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.userRoleCode, userRoleCode) ||
                other.userRoleCode == userRoleCode) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            const DeepCollectionEquality()
                .equals(other._activityBadges, _activityBadges) &&
            (identical(other.streamingProperty, streamingProperty) ||
                other.streamingProperty == streamingProperty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userIdHash,
      nickname,
      profileImageUrl,
      userRoleCode,
      badge,
      title,
      verifiedMark,
      const DeepCollectionEquality().hash(_activityBadges),
      streamingProperty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {required final String? userIdHash,
      required final String? nickname,
      required final String? profileImageUrl,
      required final String? userRoleCode,
      required final Badge? badge,
      required final ChatTitle? title,
      required final bool? verifiedMark,
      required final List<ActivityBadge>? activityBadges,
      required final StreamingProperty? streamingProperty}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String? get userIdHash;
  @override
  String? get nickname;
  @override
  String? get profileImageUrl;
  @override
  String? get userRoleCode;
  @override // "common-user", "streaming_channel_manager", "streaming_chat_manager",
  Badge? get badge;
  @override
  ChatTitle? get title;
  @override
  bool? get verifiedMark;
  @override
  List<ActivityBadge>? get activityBadges;
  @override
  StreamingProperty? get streamingProperty;
  @override
  @JsonKey(ignore: true)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Extras _$ExtrasFromJson(Map<String, dynamic> json) {
  return _Extras.fromJson(json);
}

/// @nodoc
mixin _$Extras {
  String? get chatType => throw _privateConstructorUsedError;
  String? get osType => throw _privateConstructorUsedError;
  String? get streamingChannelId => throw _privateConstructorUsedError;
  dynamic get emojis => throw _privateConstructorUsedError;
  String? get extraToken => throw _privateConstructorUsedError;
  int? get durationTime => throw _privateConstructorUsedError;
  int? get month => throw _privateConstructorUsedError;
  int? get tierNo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtrasCopyWith<Extras> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtrasCopyWith<$Res> {
  factory $ExtrasCopyWith(Extras value, $Res Function(Extras) then) =
      _$ExtrasCopyWithImpl<$Res, Extras>;
  @useResult
  $Res call(
      {String? chatType,
      String? osType,
      String? streamingChannelId,
      dynamic emojis,
      String? extraToken,
      int? durationTime,
      int? month,
      int? tierNo});
}

/// @nodoc
class _$ExtrasCopyWithImpl<$Res, $Val extends Extras>
    implements $ExtrasCopyWith<$Res> {
  _$ExtrasCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatType = freezed,
    Object? osType = freezed,
    Object? streamingChannelId = freezed,
    Object? emojis = freezed,
    Object? extraToken = freezed,
    Object? durationTime = freezed,
    Object? month = freezed,
    Object? tierNo = freezed,
  }) {
    return _then(_value.copyWith(
      chatType: freezed == chatType
          ? _value.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as String?,
      osType: freezed == osType
          ? _value.osType
          : osType // ignore: cast_nullable_to_non_nullable
              as String?,
      streamingChannelId: freezed == streamingChannelId
          ? _value.streamingChannelId
          : streamingChannelId // ignore: cast_nullable_to_non_nullable
              as String?,
      emojis: freezed == emojis
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as dynamic,
      extraToken: freezed == extraToken
          ? _value.extraToken
          : extraToken // ignore: cast_nullable_to_non_nullable
              as String?,
      durationTime: freezed == durationTime
          ? _value.durationTime
          : durationTime // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      tierNo: freezed == tierNo
          ? _value.tierNo
          : tierNo // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExtrasImplCopyWith<$Res> implements $ExtrasCopyWith<$Res> {
  factory _$$ExtrasImplCopyWith(
          _$ExtrasImpl value, $Res Function(_$ExtrasImpl) then) =
      __$$ExtrasImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? chatType,
      String? osType,
      String? streamingChannelId,
      dynamic emojis,
      String? extraToken,
      int? durationTime,
      int? month,
      int? tierNo});
}

/// @nodoc
class __$$ExtrasImplCopyWithImpl<$Res>
    extends _$ExtrasCopyWithImpl<$Res, _$ExtrasImpl>
    implements _$$ExtrasImplCopyWith<$Res> {
  __$$ExtrasImplCopyWithImpl(
      _$ExtrasImpl _value, $Res Function(_$ExtrasImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatType = freezed,
    Object? osType = freezed,
    Object? streamingChannelId = freezed,
    Object? emojis = freezed,
    Object? extraToken = freezed,
    Object? durationTime = freezed,
    Object? month = freezed,
    Object? tierNo = freezed,
  }) {
    return _then(_$ExtrasImpl(
      chatType: freezed == chatType
          ? _value.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as String?,
      osType: freezed == osType
          ? _value.osType
          : osType // ignore: cast_nullable_to_non_nullable
              as String?,
      streamingChannelId: freezed == streamingChannelId
          ? _value.streamingChannelId
          : streamingChannelId // ignore: cast_nullable_to_non_nullable
              as String?,
      emojis: freezed == emojis
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as dynamic,
      extraToken: freezed == extraToken
          ? _value.extraToken
          : extraToken // ignore: cast_nullable_to_non_nullable
              as String?,
      durationTime: freezed == durationTime
          ? _value.durationTime
          : durationTime // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      tierNo: freezed == tierNo
          ? _value.tierNo
          : tierNo // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtrasImpl implements _Extras {
  const _$ExtrasImpl(
      {required this.chatType,
      required this.osType,
      required this.streamingChannelId,
      required this.emojis,
      required this.extraToken,
      required this.durationTime,
      required this.month,
      required this.tierNo});

  factory _$ExtrasImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtrasImplFromJson(json);

  @override
  final String? chatType;
  @override
  final String? osType;
  @override
  final String? streamingChannelId;
  @override
  final dynamic emojis;
  @override
  final String? extraToken;
  @override
  final int? durationTime;
  @override
  final int? month;
  @override
  final int? tierNo;

  @override
  String toString() {
    return 'Extras(chatType: $chatType, osType: $osType, streamingChannelId: $streamingChannelId, emojis: $emojis, extraToken: $extraToken, durationTime: $durationTime, month: $month, tierNo: $tierNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtrasImpl &&
            (identical(other.chatType, chatType) ||
                other.chatType == chatType) &&
            (identical(other.osType, osType) || other.osType == osType) &&
            (identical(other.streamingChannelId, streamingChannelId) ||
                other.streamingChannelId == streamingChannelId) &&
            const DeepCollectionEquality().equals(other.emojis, emojis) &&
            (identical(other.extraToken, extraToken) ||
                other.extraToken == extraToken) &&
            (identical(other.durationTime, durationTime) ||
                other.durationTime == durationTime) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.tierNo, tierNo) || other.tierNo == tierNo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chatType,
      osType,
      streamingChannelId,
      const DeepCollectionEquality().hash(emojis),
      extraToken,
      durationTime,
      month,
      tierNo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtrasImplCopyWith<_$ExtrasImpl> get copyWith =>
      __$$ExtrasImplCopyWithImpl<_$ExtrasImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtrasImplToJson(
      this,
    );
  }
}

abstract class _Extras implements Extras {
  const factory _Extras(
      {required final String? chatType,
      required final String? osType,
      required final String? streamingChannelId,
      required final dynamic emojis,
      required final String? extraToken,
      required final int? durationTime,
      required final int? month,
      required final int? tierNo}) = _$ExtrasImpl;

  factory _Extras.fromJson(Map<String, dynamic> json) = _$ExtrasImpl.fromJson;

  @override
  String? get chatType;
  @override
  String? get osType;
  @override
  String? get streamingChannelId;
  @override
  dynamic get emojis;
  @override
  String? get extraToken;
  @override
  int? get durationTime;
  @override
  int? get month;
  @override
  int? get tierNo;
  @override
  @JsonKey(ignore: true)
  _$$ExtrasImplCopyWith<_$ExtrasImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatTitle _$ChatTitleFromJson(Map<String, dynamic> json) {
  return _ChatTitle.fromJson(json);
}

/// @nodoc
mixin _$ChatTitle {
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatTitleCopyWith<ChatTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatTitleCopyWith<$Res> {
  factory $ChatTitleCopyWith(ChatTitle value, $Res Function(ChatTitle) then) =
      _$ChatTitleCopyWithImpl<$Res, ChatTitle>;
  @useResult
  $Res call({String name, String color});
}

/// @nodoc
class _$ChatTitleCopyWithImpl<$Res, $Val extends ChatTitle>
    implements $ChatTitleCopyWith<$Res> {
  _$ChatTitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatTitleImplCopyWith<$Res>
    implements $ChatTitleCopyWith<$Res> {
  factory _$$ChatTitleImplCopyWith(
          _$ChatTitleImpl value, $Res Function(_$ChatTitleImpl) then) =
      __$$ChatTitleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String color});
}

/// @nodoc
class __$$ChatTitleImplCopyWithImpl<$Res>
    extends _$ChatTitleCopyWithImpl<$Res, _$ChatTitleImpl>
    implements _$$ChatTitleImplCopyWith<$Res> {
  __$$ChatTitleImplCopyWithImpl(
      _$ChatTitleImpl _value, $Res Function(_$ChatTitleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_$ChatTitleImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatTitleImpl implements _ChatTitle {
  const _$ChatTitleImpl({required this.name, required this.color});

  factory _$ChatTitleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatTitleImplFromJson(json);

  @override
  final String name;
  @override
  final String color;

  @override
  String toString() {
    return 'ChatTitle(name: $name, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatTitleImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatTitleImplCopyWith<_$ChatTitleImpl> get copyWith =>
      __$$ChatTitleImplCopyWithImpl<_$ChatTitleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatTitleImplToJson(
      this,
    );
  }
}

abstract class _ChatTitle implements ChatTitle {
  const factory _ChatTitle(
      {required final String name,
      required final String color}) = _$ChatTitleImpl;

  factory _ChatTitle.fromJson(Map<String, dynamic> json) =
      _$ChatTitleImpl.fromJson;

  @override
  String get name;
  @override
  String get color;
  @override
  @JsonKey(ignore: true)
  _$$ChatTitleImplCopyWith<_$ChatTitleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Badge _$BadgeFromJson(Map<String, dynamic> json) {
  return _Badge.fromJson(json);
}

/// @nodoc
mixin _$Badge {
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BadgeCopyWith<Badge> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeCopyWith<$Res> {
  factory $BadgeCopyWith(Badge value, $Res Function(Badge) then) =
      _$BadgeCopyWithImpl<$Res, Badge>;
  @useResult
  $Res call({String? imageUrl});
}

/// @nodoc
class _$BadgeCopyWithImpl<$Res, $Val extends Badge>
    implements $BadgeCopyWith<$Res> {
  _$BadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BadgeImplCopyWith<$Res> implements $BadgeCopyWith<$Res> {
  factory _$$BadgeImplCopyWith(
          _$BadgeImpl value, $Res Function(_$BadgeImpl) then) =
      __$$BadgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? imageUrl});
}

/// @nodoc
class __$$BadgeImplCopyWithImpl<$Res>
    extends _$BadgeCopyWithImpl<$Res, _$BadgeImpl>
    implements _$$BadgeImplCopyWith<$Res> {
  __$$BadgeImplCopyWithImpl(
      _$BadgeImpl _value, $Res Function(_$BadgeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
  }) {
    return _then(_$BadgeImpl(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BadgeImpl implements _Badge {
  const _$BadgeImpl({required this.imageUrl});

  factory _$BadgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$BadgeImplFromJson(json);

  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'Badge(imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadgeImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadgeImplCopyWith<_$BadgeImpl> get copyWith =>
      __$$BadgeImplCopyWithImpl<_$BadgeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BadgeImplToJson(
      this,
    );
  }
}

abstract class _Badge implements Badge {
  const factory _Badge({required final String? imageUrl}) = _$BadgeImpl;

  factory _Badge.fromJson(Map<String, dynamic> json) = _$BadgeImpl.fromJson;

  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$BadgeImplCopyWith<_$BadgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActivityBadge _$ActivityBadgeFromJson(Map<String, dynamic> json) {
  return _ActivityBadge.fromJson(json);
}

/// @nodoc
mixin _$ActivityBadge {
  int get badgeNo => throw _privateConstructorUsedError;
  String? get badgeId =>
      throw _privateConstructorUsedError; // "donation_newbie", "subscrption_founder"
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get activated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityBadgeCopyWith<ActivityBadge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityBadgeCopyWith<$Res> {
  factory $ActivityBadgeCopyWith(
          ActivityBadge value, $Res Function(ActivityBadge) then) =
      _$ActivityBadgeCopyWithImpl<$Res, ActivityBadge>;
  @useResult
  $Res call({int badgeNo, String? badgeId, String? imageUrl, bool activated});
}

/// @nodoc
class _$ActivityBadgeCopyWithImpl<$Res, $Val extends ActivityBadge>
    implements $ActivityBadgeCopyWith<$Res> {
  _$ActivityBadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badgeNo = null,
    Object? badgeId = freezed,
    Object? imageUrl = freezed,
    Object? activated = null,
  }) {
    return _then(_value.copyWith(
      badgeNo: null == badgeNo
          ? _value.badgeNo
          : badgeNo // ignore: cast_nullable_to_non_nullable
              as int,
      badgeId: freezed == badgeId
          ? _value.badgeId
          : badgeId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      activated: null == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityBadgeImplCopyWith<$Res>
    implements $ActivityBadgeCopyWith<$Res> {
  factory _$$ActivityBadgeImplCopyWith(
          _$ActivityBadgeImpl value, $Res Function(_$ActivityBadgeImpl) then) =
      __$$ActivityBadgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int badgeNo, String? badgeId, String? imageUrl, bool activated});
}

/// @nodoc
class __$$ActivityBadgeImplCopyWithImpl<$Res>
    extends _$ActivityBadgeCopyWithImpl<$Res, _$ActivityBadgeImpl>
    implements _$$ActivityBadgeImplCopyWith<$Res> {
  __$$ActivityBadgeImplCopyWithImpl(
      _$ActivityBadgeImpl _value, $Res Function(_$ActivityBadgeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badgeNo = null,
    Object? badgeId = freezed,
    Object? imageUrl = freezed,
    Object? activated = null,
  }) {
    return _then(_$ActivityBadgeImpl(
      badgeNo: null == badgeNo
          ? _value.badgeNo
          : badgeNo // ignore: cast_nullable_to_non_nullable
              as int,
      badgeId: freezed == badgeId
          ? _value.badgeId
          : badgeId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      activated: null == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityBadgeImpl implements _ActivityBadge {
  const _$ActivityBadgeImpl(
      {required this.badgeNo,
      required this.badgeId,
      required this.imageUrl,
      required this.activated});

  factory _$ActivityBadgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityBadgeImplFromJson(json);

  @override
  final int badgeNo;
  @override
  final String? badgeId;
// "donation_newbie", "subscrption_founder"
  @override
  final String? imageUrl;
  @override
  final bool activated;

  @override
  String toString() {
    return 'ActivityBadge(badgeNo: $badgeNo, badgeId: $badgeId, imageUrl: $imageUrl, activated: $activated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityBadgeImpl &&
            (identical(other.badgeNo, badgeNo) || other.badgeNo == badgeNo) &&
            (identical(other.badgeId, badgeId) || other.badgeId == badgeId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.activated, activated) ||
                other.activated == activated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, badgeNo, badgeId, imageUrl, activated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityBadgeImplCopyWith<_$ActivityBadgeImpl> get copyWith =>
      __$$ActivityBadgeImplCopyWithImpl<_$ActivityBadgeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityBadgeImplToJson(
      this,
    );
  }
}

abstract class _ActivityBadge implements ActivityBadge {
  const factory _ActivityBadge(
      {required final int badgeNo,
      required final String? badgeId,
      required final String? imageUrl,
      required final bool activated}) = _$ActivityBadgeImpl;

  factory _ActivityBadge.fromJson(Map<String, dynamic> json) =
      _$ActivityBadgeImpl.fromJson;

  @override
  int get badgeNo;
  @override
  String? get badgeId;
  @override // "donation_newbie", "subscrption_founder"
  String? get imageUrl;
  @override
  bool get activated;
  @override
  @JsonKey(ignore: true)
  _$$ActivityBadgeImplCopyWith<_$ActivityBadgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StreamingProperty _$StreamingPropertyFromJson(Map<String, dynamic> json) {
  return _StreamingProperty.fromJson(json);
}

/// @nodoc
mixin _$StreamingProperty {
  Subscription? get subscription => throw _privateConstructorUsedError;
  NicknameColor get nicknameColor => throw _privateConstructorUsedError;
  RealTimeDonationRanking? get realTimeDonationRanking =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreamingPropertyCopyWith<StreamingProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamingPropertyCopyWith<$Res> {
  factory $StreamingPropertyCopyWith(
          StreamingProperty value, $Res Function(StreamingProperty) then) =
      _$StreamingPropertyCopyWithImpl<$Res, StreamingProperty>;
  @useResult
  $Res call(
      {Subscription? subscription,
      NicknameColor nicknameColor,
      RealTimeDonationRanking? realTimeDonationRanking});

  $SubscriptionCopyWith<$Res>? get subscription;
  $NicknameColorCopyWith<$Res> get nicknameColor;
  $RealTimeDonationRankingCopyWith<$Res>? get realTimeDonationRanking;
}

/// @nodoc
class _$StreamingPropertyCopyWithImpl<$Res, $Val extends StreamingProperty>
    implements $StreamingPropertyCopyWith<$Res> {
  _$StreamingPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = freezed,
    Object? nicknameColor = null,
    Object? realTimeDonationRanking = freezed,
  }) {
    return _then(_value.copyWith(
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as Subscription?,
      nicknameColor: null == nicknameColor
          ? _value.nicknameColor
          : nicknameColor // ignore: cast_nullable_to_non_nullable
              as NicknameColor,
      realTimeDonationRanking: freezed == realTimeDonationRanking
          ? _value.realTimeDonationRanking
          : realTimeDonationRanking // ignore: cast_nullable_to_non_nullable
              as RealTimeDonationRanking?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubscriptionCopyWith<$Res>? get subscription {
    if (_value.subscription == null) {
      return null;
    }

    return $SubscriptionCopyWith<$Res>(_value.subscription!, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NicknameColorCopyWith<$Res> get nicknameColor {
    return $NicknameColorCopyWith<$Res>(_value.nicknameColor, (value) {
      return _then(_value.copyWith(nicknameColor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RealTimeDonationRankingCopyWith<$Res>? get realTimeDonationRanking {
    if (_value.realTimeDonationRanking == null) {
      return null;
    }

    return $RealTimeDonationRankingCopyWith<$Res>(
        _value.realTimeDonationRanking!, (value) {
      return _then(_value.copyWith(realTimeDonationRanking: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StreamingPropertyImplCopyWith<$Res>
    implements $StreamingPropertyCopyWith<$Res> {
  factory _$$StreamingPropertyImplCopyWith(_$StreamingPropertyImpl value,
          $Res Function(_$StreamingPropertyImpl) then) =
      __$$StreamingPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Subscription? subscription,
      NicknameColor nicknameColor,
      RealTimeDonationRanking? realTimeDonationRanking});

  @override
  $SubscriptionCopyWith<$Res>? get subscription;
  @override
  $NicknameColorCopyWith<$Res> get nicknameColor;
  @override
  $RealTimeDonationRankingCopyWith<$Res>? get realTimeDonationRanking;
}

/// @nodoc
class __$$StreamingPropertyImplCopyWithImpl<$Res>
    extends _$StreamingPropertyCopyWithImpl<$Res, _$StreamingPropertyImpl>
    implements _$$StreamingPropertyImplCopyWith<$Res> {
  __$$StreamingPropertyImplCopyWithImpl(_$StreamingPropertyImpl _value,
      $Res Function(_$StreamingPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = freezed,
    Object? nicknameColor = null,
    Object? realTimeDonationRanking = freezed,
  }) {
    return _then(_$StreamingPropertyImpl(
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as Subscription?,
      nicknameColor: null == nicknameColor
          ? _value.nicknameColor
          : nicknameColor // ignore: cast_nullable_to_non_nullable
              as NicknameColor,
      realTimeDonationRanking: freezed == realTimeDonationRanking
          ? _value.realTimeDonationRanking
          : realTimeDonationRanking // ignore: cast_nullable_to_non_nullable
              as RealTimeDonationRanking?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreamingPropertyImpl implements _StreamingProperty {
  const _$StreamingPropertyImpl(
      {required this.subscription,
      required this.nicknameColor,
      required this.realTimeDonationRanking});

  factory _$StreamingPropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreamingPropertyImplFromJson(json);

  @override
  final Subscription? subscription;
  @override
  final NicknameColor nicknameColor;
  @override
  final RealTimeDonationRanking? realTimeDonationRanking;

  @override
  String toString() {
    return 'StreamingProperty(subscription: $subscription, nicknameColor: $nicknameColor, realTimeDonationRanking: $realTimeDonationRanking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamingPropertyImpl &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription) &&
            (identical(other.nicknameColor, nicknameColor) ||
                other.nicknameColor == nicknameColor) &&
            (identical(
                    other.realTimeDonationRanking, realTimeDonationRanking) ||
                other.realTimeDonationRanking == realTimeDonationRanking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, subscription, nicknameColor, realTimeDonationRanking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamingPropertyImplCopyWith<_$StreamingPropertyImpl> get copyWith =>
      __$$StreamingPropertyImplCopyWithImpl<_$StreamingPropertyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreamingPropertyImplToJson(
      this,
    );
  }
}

abstract class _StreamingProperty implements StreamingProperty {
  const factory _StreamingProperty(
          {required final Subscription? subscription,
          required final NicknameColor nicknameColor,
          required final RealTimeDonationRanking? realTimeDonationRanking}) =
      _$StreamingPropertyImpl;

  factory _StreamingProperty.fromJson(Map<String, dynamic> json) =
      _$StreamingPropertyImpl.fromJson;

  @override
  Subscription? get subscription;
  @override
  NicknameColor get nicknameColor;
  @override
  RealTimeDonationRanking? get realTimeDonationRanking;
  @override
  @JsonKey(ignore: true)
  _$$StreamingPropertyImplCopyWith<_$StreamingPropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return _Subscription.fromJson(json);
}

/// @nodoc
mixin _$Subscription {
  int get accumulativeMonth => throw _privateConstructorUsedError;
  int get tier => throw _privateConstructorUsedError;
  Badge? get badge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionCopyWith<Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCopyWith<$Res> {
  factory $SubscriptionCopyWith(
          Subscription value, $Res Function(Subscription) then) =
      _$SubscriptionCopyWithImpl<$Res, Subscription>;
  @useResult
  $Res call({int accumulativeMonth, int tier, Badge? badge});

  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class _$SubscriptionCopyWithImpl<$Res, $Val extends Subscription>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accumulativeMonth = null,
    Object? tier = null,
    Object? badge = freezed,
  }) {
    return _then(_value.copyWith(
      accumulativeMonth: null == accumulativeMonth
          ? _value.accumulativeMonth
          : accumulativeMonth // ignore: cast_nullable_to_non_nullable
              as int,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as Badge?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BadgeCopyWith<$Res>? get badge {
    if (_value.badge == null) {
      return null;
    }

    return $BadgeCopyWith<$Res>(_value.badge!, (value) {
      return _then(_value.copyWith(badge: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubscriptionImplCopyWith<$Res>
    implements $SubscriptionCopyWith<$Res> {
  factory _$$SubscriptionImplCopyWith(
          _$SubscriptionImpl value, $Res Function(_$SubscriptionImpl) then) =
      __$$SubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int accumulativeMonth, int tier, Badge? badge});

  @override
  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class __$$SubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionCopyWithImpl<$Res, _$SubscriptionImpl>
    implements _$$SubscriptionImplCopyWith<$Res> {
  __$$SubscriptionImplCopyWithImpl(
      _$SubscriptionImpl _value, $Res Function(_$SubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accumulativeMonth = null,
    Object? tier = null,
    Object? badge = freezed,
  }) {
    return _then(_$SubscriptionImpl(
      accumulativeMonth: null == accumulativeMonth
          ? _value.accumulativeMonth
          : accumulativeMonth // ignore: cast_nullable_to_non_nullable
              as int,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as Badge?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionImpl implements _Subscription {
  const _$SubscriptionImpl(
      {required this.accumulativeMonth,
      required this.tier,
      required this.badge});

  factory _$SubscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionImplFromJson(json);

  @override
  final int accumulativeMonth;
  @override
  final int tier;
  @override
  final Badge? badge;

  @override
  String toString() {
    return 'Subscription(accumulativeMonth: $accumulativeMonth, tier: $tier, badge: $badge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionImpl &&
            (identical(other.accumulativeMonth, accumulativeMonth) ||
                other.accumulativeMonth == accumulativeMonth) &&
            (identical(other.tier, tier) || other.tier == tier) &&
            (identical(other.badge, badge) || other.badge == badge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accumulativeMonth, tier, badge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      __$$SubscriptionImplCopyWithImpl<_$SubscriptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionImplToJson(
      this,
    );
  }
}

abstract class _Subscription implements Subscription {
  const factory _Subscription(
      {required final int accumulativeMonth,
      required final int tier,
      required final Badge? badge}) = _$SubscriptionImpl;

  factory _Subscription.fromJson(Map<String, dynamic> json) =
      _$SubscriptionImpl.fromJson;

  @override
  int get accumulativeMonth;
  @override
  int get tier;
  @override
  Badge? get badge;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NicknameColor _$NicknameColorFromJson(Map<String, dynamic> json) {
  return _NicknameColor.fromJson(json);
}

/// @nodoc
mixin _$NicknameColor {
  String get colorCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NicknameColorCopyWith<NicknameColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NicknameColorCopyWith<$Res> {
  factory $NicknameColorCopyWith(
          NicknameColor value, $Res Function(NicknameColor) then) =
      _$NicknameColorCopyWithImpl<$Res, NicknameColor>;
  @useResult
  $Res call({String colorCode});
}

/// @nodoc
class _$NicknameColorCopyWithImpl<$Res, $Val extends NicknameColor>
    implements $NicknameColorCopyWith<$Res> {
  _$NicknameColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorCode = null,
  }) {
    return _then(_value.copyWith(
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NicknameColorImplCopyWith<$Res>
    implements $NicknameColorCopyWith<$Res> {
  factory _$$NicknameColorImplCopyWith(
          _$NicknameColorImpl value, $Res Function(_$NicknameColorImpl) then) =
      __$$NicknameColorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String colorCode});
}

/// @nodoc
class __$$NicknameColorImplCopyWithImpl<$Res>
    extends _$NicknameColorCopyWithImpl<$Res, _$NicknameColorImpl>
    implements _$$NicknameColorImplCopyWith<$Res> {
  __$$NicknameColorImplCopyWithImpl(
      _$NicknameColorImpl _value, $Res Function(_$NicknameColorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorCode = null,
  }) {
    return _then(_$NicknameColorImpl(
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NicknameColorImpl implements _NicknameColor {
  const _$NicknameColorImpl({required this.colorCode});

  factory _$NicknameColorImpl.fromJson(Map<String, dynamic> json) =>
      _$$NicknameColorImplFromJson(json);

  @override
  final String colorCode;

  @override
  String toString() {
    return 'NicknameColor(colorCode: $colorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NicknameColorImpl &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, colorCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NicknameColorImplCopyWith<_$NicknameColorImpl> get copyWith =>
      __$$NicknameColorImplCopyWithImpl<_$NicknameColorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NicknameColorImplToJson(
      this,
    );
  }
}

abstract class _NicknameColor implements NicknameColor {
  const factory _NicknameColor({required final String colorCode}) =
      _$NicknameColorImpl;

  factory _NicknameColor.fromJson(Map<String, dynamic> json) =
      _$NicknameColorImpl.fromJson;

  @override
  String get colorCode;
  @override
  @JsonKey(ignore: true)
  _$$NicknameColorImplCopyWith<_$NicknameColorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RealTimeDonationRanking _$RealTimeDonationRankingFromJson(
    Map<String, dynamic> json) {
  return _RealTimeDonationRanking.fromJson(json);
}

/// @nodoc
mixin _$RealTimeDonationRanking {
  Badge get badge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RealTimeDonationRankingCopyWith<RealTimeDonationRanking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealTimeDonationRankingCopyWith<$Res> {
  factory $RealTimeDonationRankingCopyWith(RealTimeDonationRanking value,
          $Res Function(RealTimeDonationRanking) then) =
      _$RealTimeDonationRankingCopyWithImpl<$Res, RealTimeDonationRanking>;
  @useResult
  $Res call({Badge badge});

  $BadgeCopyWith<$Res> get badge;
}

/// @nodoc
class _$RealTimeDonationRankingCopyWithImpl<$Res,
        $Val extends RealTimeDonationRanking>
    implements $RealTimeDonationRankingCopyWith<$Res> {
  _$RealTimeDonationRankingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badge = null,
  }) {
    return _then(_value.copyWith(
      badge: null == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as Badge,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BadgeCopyWith<$Res> get badge {
    return $BadgeCopyWith<$Res>(_value.badge, (value) {
      return _then(_value.copyWith(badge: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RealTimeDonationRankingImplCopyWith<$Res>
    implements $RealTimeDonationRankingCopyWith<$Res> {
  factory _$$RealTimeDonationRankingImplCopyWith(
          _$RealTimeDonationRankingImpl value,
          $Res Function(_$RealTimeDonationRankingImpl) then) =
      __$$RealTimeDonationRankingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Badge badge});

  @override
  $BadgeCopyWith<$Res> get badge;
}

/// @nodoc
class __$$RealTimeDonationRankingImplCopyWithImpl<$Res>
    extends _$RealTimeDonationRankingCopyWithImpl<$Res,
        _$RealTimeDonationRankingImpl>
    implements _$$RealTimeDonationRankingImplCopyWith<$Res> {
  __$$RealTimeDonationRankingImplCopyWithImpl(
      _$RealTimeDonationRankingImpl _value,
      $Res Function(_$RealTimeDonationRankingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badge = null,
  }) {
    return _then(_$RealTimeDonationRankingImpl(
      badge: null == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as Badge,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealTimeDonationRankingImpl implements _RealTimeDonationRanking {
  const _$RealTimeDonationRankingImpl({required this.badge});

  factory _$RealTimeDonationRankingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RealTimeDonationRankingImplFromJson(json);

  @override
  final Badge badge;

  @override
  String toString() {
    return 'RealTimeDonationRanking(badge: $badge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealTimeDonationRankingImpl &&
            (identical(other.badge, badge) || other.badge == badge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, badge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RealTimeDonationRankingImplCopyWith<_$RealTimeDonationRankingImpl>
      get copyWith => __$$RealTimeDonationRankingImplCopyWithImpl<
          _$RealTimeDonationRankingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RealTimeDonationRankingImplToJson(
      this,
    );
  }
}

abstract class _RealTimeDonationRanking implements RealTimeDonationRanking {
  const factory _RealTimeDonationRanking({required final Badge badge}) =
      _$RealTimeDonationRankingImpl;

  factory _RealTimeDonationRanking.fromJson(Map<String, dynamic> json) =
      _$RealTimeDonationRankingImpl.fromJson;

  @override
  Badge get badge;
  @override
  @JsonKey(ignore: true)
  _$$RealTimeDonationRankingImplCopyWith<_$RealTimeDonationRankingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WeeklyRank _$WeeklyRankFromJson(Map<String, dynamic> json) {
  return _WeeklyRank.fromJson(json);
}

/// @nodoc
mixin _$WeeklyRank {
  String get userIdHash => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  bool get verifiedMark => throw _privateConstructorUsedError;
  int get donationAmount => throw _privateConstructorUsedError;
  int get ranking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeeklyRankCopyWith<WeeklyRank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyRankCopyWith<$Res> {
  factory $WeeklyRankCopyWith(
          WeeklyRank value, $Res Function(WeeklyRank) then) =
      _$WeeklyRankCopyWithImpl<$Res, WeeklyRank>;
  @useResult
  $Res call(
      {String userIdHash,
      String nickName,
      bool verifiedMark,
      int donationAmount,
      int ranking});
}

/// @nodoc
class _$WeeklyRankCopyWithImpl<$Res, $Val extends WeeklyRank>
    implements $WeeklyRankCopyWith<$Res> {
  _$WeeklyRankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIdHash = null,
    Object? nickName = null,
    Object? verifiedMark = null,
    Object? donationAmount = null,
    Object? ranking = null,
  }) {
    return _then(_value.copyWith(
      userIdHash: null == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedMark: null == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool,
      donationAmount: null == donationAmount
          ? _value.donationAmount
          : donationAmount // ignore: cast_nullable_to_non_nullable
              as int,
      ranking: null == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyRankImplCopyWith<$Res>
    implements $WeeklyRankCopyWith<$Res> {
  factory _$$WeeklyRankImplCopyWith(
          _$WeeklyRankImpl value, $Res Function(_$WeeklyRankImpl) then) =
      __$$WeeklyRankImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userIdHash,
      String nickName,
      bool verifiedMark,
      int donationAmount,
      int ranking});
}

/// @nodoc
class __$$WeeklyRankImplCopyWithImpl<$Res>
    extends _$WeeklyRankCopyWithImpl<$Res, _$WeeklyRankImpl>
    implements _$$WeeklyRankImplCopyWith<$Res> {
  __$$WeeklyRankImplCopyWithImpl(
      _$WeeklyRankImpl _value, $Res Function(_$WeeklyRankImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIdHash = null,
    Object? nickName = null,
    Object? verifiedMark = null,
    Object? donationAmount = null,
    Object? ranking = null,
  }) {
    return _then(_$WeeklyRankImpl(
      userIdHash: null == userIdHash
          ? _value.userIdHash
          : userIdHash // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedMark: null == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool,
      donationAmount: null == donationAmount
          ? _value.donationAmount
          : donationAmount // ignore: cast_nullable_to_non_nullable
              as int,
      ranking: null == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyRankImpl implements _WeeklyRank {
  const _$WeeklyRankImpl(
      {required this.userIdHash,
      required this.nickName,
      required this.verifiedMark,
      required this.donationAmount,
      required this.ranking});

  factory _$WeeklyRankImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyRankImplFromJson(json);

  @override
  final String userIdHash;
  @override
  final String nickName;
  @override
  final bool verifiedMark;
  @override
  final int donationAmount;
  @override
  final int ranking;

  @override
  String toString() {
    return 'WeeklyRank(userIdHash: $userIdHash, nickName: $nickName, verifiedMark: $verifiedMark, donationAmount: $donationAmount, ranking: $ranking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyRankImpl &&
            (identical(other.userIdHash, userIdHash) ||
                other.userIdHash == userIdHash) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            (identical(other.donationAmount, donationAmount) ||
                other.donationAmount == donationAmount) &&
            (identical(other.ranking, ranking) || other.ranking == ranking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userIdHash, nickName, verifiedMark, donationAmount, ranking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyRankImplCopyWith<_$WeeklyRankImpl> get copyWith =>
      __$$WeeklyRankImplCopyWithImpl<_$WeeklyRankImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyRankImplToJson(
      this,
    );
  }
}

abstract class _WeeklyRank implements WeeklyRank {
  const factory _WeeklyRank(
      {required final String userIdHash,
      required final String nickName,
      required final bool verifiedMark,
      required final int donationAmount,
      required final int ranking}) = _$WeeklyRankImpl;

  factory _WeeklyRank.fromJson(Map<String, dynamic> json) =
      _$WeeklyRankImpl.fromJson;

  @override
  String get userIdHash;
  @override
  String get nickName;
  @override
  bool get verifiedMark;
  @override
  int get donationAmount;
  @override
  int get ranking;
  @override
  @JsonKey(ignore: true)
  _$$WeeklyRankImplCopyWith<_$WeeklyRankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
