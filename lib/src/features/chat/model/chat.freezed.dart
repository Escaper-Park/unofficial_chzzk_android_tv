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
  int get cmd =>
      throw _privateConstructorUsedError; // only use 93101, 93102. Don't accept 93006 to avoid duplicated displaying missions.
  String? get tid => throw _privateConstructorUsedError;
  String? get cid => throw _privateConstructorUsedError;

  /// Serializes this Chat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      this.tid,
      this.cid})
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
// only use 93101, 93102. Don't accept 93006 to avoid duplicated displaying missions.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, svcid, ver,
      const DeepCollectionEquality().hash(_bdy), cmd, tid, cid);

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      final String? tid,
      final String? cid}) = _$ChatImpl;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$ChatImpl.fromJson;

  @override
  String get svcid;
  @override
  String get ver;
  @override
  List<ChatBdy> get bdy;
  @override
  int get cmd; // only use 93101, 93102. Don't accept 93006 to avoid duplicated displaying missions.
  @override
  String? get tid;
  @override
  String? get cid;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  @ProfileConverter()
  Profile? get profile => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  int get msgTypeCode => throw _privateConstructorUsedError;
  String get msgStatusType => throw _privateConstructorUsedError;
  @ExtrasConverter()
  Extras? get extras => throw _privateConstructorUsedError;
  int get ctime => throw _privateConstructorUsedError;
  int get utime => throw _privateConstructorUsedError;
  int get msgTime => throw _privateConstructorUsedError;

  /// Serializes this ChatBdy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatBdy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @ProfileConverter() Profile? profile,
      String msg,
      int msgTypeCode,
      String msgStatusType,
      @ExtrasConverter() Extras? extras,
      int ctime,
      int utime,
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
      msgTime: null == msgTime
          ? _value.msgTime
          : msgTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of ChatBdy
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

  /// Create a copy of ChatBdy
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
      @ProfileConverter() Profile? profile,
      String msg,
      int msgTypeCode,
      String msgStatusType,
      @ExtrasConverter() Extras? extras,
      int ctime,
      int utime,
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
      @ProfileConverter() this.profile,
      required this.msg,
      required this.msgTypeCode,
      required this.msgStatusType,
      @ExtrasConverter() this.extras,
      required this.ctime,
      required this.utime,
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
  @ProfileConverter()
  final Profile? profile;
  @override
  final String msg;
  @override
  final int msgTypeCode;
  @override
  final String msgStatusType;
  @override
  @ExtrasConverter()
  final Extras? extras;
  @override
  final int ctime;
  @override
  final int utime;
  @override
  final int msgTime;

  @override
  String toString() {
    return 'ChatBdy(svcid: $svcid, cid: $cid, mbrCnt: $mbrCnt, uid: $uid, profile: $profile, msg: $msg, msgTypeCode: $msgTypeCode, msgStatusType: $msgStatusType, extras: $extras, ctime: $ctime, utime: $utime, msgTime: $msgTime)';
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
            (identical(other.msgTime, msgTime) || other.msgTime == msgTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, svcid, cid, mbrCnt, uid, profile,
      msg, msgTypeCode, msgStatusType, extras, ctime, utime, msgTime);

  /// Create a copy of ChatBdy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @ProfileConverter() final Profile? profile,
      required final String msg,
      required final int msgTypeCode,
      required final String msgStatusType,
      @ExtrasConverter() final Extras? extras,
      required final int ctime,
      required final int utime,
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
  @ProfileConverter()
  Profile? get profile;
  @override
  String get msg;
  @override
  int get msgTypeCode;
  @override
  String get msgStatusType;
  @override
  @ExtrasConverter()
  Extras? get extras;
  @override
  int get ctime;
  @override
  int get utime;
  @override
  int get msgTime;

  /// Create a copy of ChatBdy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatBdyImplCopyWith<_$ChatBdyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
