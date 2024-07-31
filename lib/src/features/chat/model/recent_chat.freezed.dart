// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecentChat _$RecentChatFromJson(Map<String, dynamic> json) {
  return _RecentChat.fromJson(json);
}

/// @nodoc
mixin _$RecentChat {
  String get svcid => throw _privateConstructorUsedError;
  RecentChatBdy get bdy => throw _privateConstructorUsedError;
  int get cmd => throw _privateConstructorUsedError;
  int get retCode => throw _privateConstructorUsedError;
  int get retMsg => throw _privateConstructorUsedError;
  String? get tid => throw _privateConstructorUsedError;
  String? get cid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentChatCopyWith<RecentChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentChatCopyWith<$Res> {
  factory $RecentChatCopyWith(
          RecentChat value, $Res Function(RecentChat) then) =
      _$RecentChatCopyWithImpl<$Res, RecentChat>;
  @useResult
  $Res call(
      {String svcid,
      RecentChatBdy bdy,
      int cmd,
      int retCode,
      int retMsg,
      String? tid,
      String? cid});

  $RecentChatBdyCopyWith<$Res> get bdy;
}

/// @nodoc
class _$RecentChatCopyWithImpl<$Res, $Val extends RecentChat>
    implements $RecentChatCopyWith<$Res> {
  _$RecentChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? svcid = null,
    Object? bdy = null,
    Object? cmd = null,
    Object? retCode = null,
    Object? retMsg = null,
    Object? tid = freezed,
    Object? cid = freezed,
  }) {
    return _then(_value.copyWith(
      svcid: null == svcid
          ? _value.svcid
          : svcid // ignore: cast_nullable_to_non_nullable
              as String,
      bdy: null == bdy
          ? _value.bdy
          : bdy // ignore: cast_nullable_to_non_nullable
              as RecentChatBdy,
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as int,
      retCode: null == retCode
          ? _value.retCode
          : retCode // ignore: cast_nullable_to_non_nullable
              as int,
      retMsg: null == retMsg
          ? _value.retMsg
          : retMsg // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $RecentChatBdyCopyWith<$Res> get bdy {
    return $RecentChatBdyCopyWith<$Res>(_value.bdy, (value) {
      return _then(_value.copyWith(bdy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecentChatImplCopyWith<$Res>
    implements $RecentChatCopyWith<$Res> {
  factory _$$RecentChatImplCopyWith(
          _$RecentChatImpl value, $Res Function(_$RecentChatImpl) then) =
      __$$RecentChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String svcid,
      RecentChatBdy bdy,
      int cmd,
      int retCode,
      int retMsg,
      String? tid,
      String? cid});

  @override
  $RecentChatBdyCopyWith<$Res> get bdy;
}

/// @nodoc
class __$$RecentChatImplCopyWithImpl<$Res>
    extends _$RecentChatCopyWithImpl<$Res, _$RecentChatImpl>
    implements _$$RecentChatImplCopyWith<$Res> {
  __$$RecentChatImplCopyWithImpl(
      _$RecentChatImpl _value, $Res Function(_$RecentChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? svcid = null,
    Object? bdy = null,
    Object? cmd = null,
    Object? retCode = null,
    Object? retMsg = null,
    Object? tid = freezed,
    Object? cid = freezed,
  }) {
    return _then(_$RecentChatImpl(
      svcid: null == svcid
          ? _value.svcid
          : svcid // ignore: cast_nullable_to_non_nullable
              as String,
      bdy: null == bdy
          ? _value.bdy
          : bdy // ignore: cast_nullable_to_non_nullable
              as RecentChatBdy,
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as int,
      retCode: null == retCode
          ? _value.retCode
          : retCode // ignore: cast_nullable_to_non_nullable
              as int,
      retMsg: null == retMsg
          ? _value.retMsg
          : retMsg // ignore: cast_nullable_to_non_nullable
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
class _$RecentChatImpl implements _RecentChat {
  _$RecentChatImpl(
      {required this.svcid,
      required this.bdy,
      required this.cmd,
      required this.retCode,
      required this.retMsg,
      required this.tid,
      required this.cid});

  factory _$RecentChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentChatImplFromJson(json);

  @override
  final String svcid;
  @override
  final RecentChatBdy bdy;
  @override
  final int cmd;
  @override
  final int retCode;
  @override
  final int retMsg;
  @override
  final String? tid;
  @override
  final String? cid;

  @override
  String toString() {
    return 'RecentChat(svcid: $svcid, bdy: $bdy, cmd: $cmd, retCode: $retCode, retMsg: $retMsg, tid: $tid, cid: $cid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentChatImpl &&
            (identical(other.svcid, svcid) || other.svcid == svcid) &&
            (identical(other.bdy, bdy) || other.bdy == bdy) &&
            (identical(other.cmd, cmd) || other.cmd == cmd) &&
            (identical(other.retCode, retCode) || other.retCode == retCode) &&
            (identical(other.retMsg, retMsg) || other.retMsg == retMsg) &&
            (identical(other.tid, tid) || other.tid == tid) &&
            (identical(other.cid, cid) || other.cid == cid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, svcid, bdy, cmd, retCode, retMsg, tid, cid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentChatImplCopyWith<_$RecentChatImpl> get copyWith =>
      __$$RecentChatImplCopyWithImpl<_$RecentChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentChatImplToJson(
      this,
    );
  }
}

abstract class _RecentChat implements RecentChat {
  factory _RecentChat(
      {required final String svcid,
      required final RecentChatBdy bdy,
      required final int cmd,
      required final int retCode,
      required final int retMsg,
      required final String? tid,
      required final String? cid}) = _$RecentChatImpl;

  factory _RecentChat.fromJson(Map<String, dynamic> json) =
      _$RecentChatImpl.fromJson;

  @override
  String get svcid;
  @override
  RecentChatBdy get bdy;
  @override
  int get cmd;
  @override
  int get retCode;
  @override
  int get retMsg;
  @override
  String? get tid;
  @override
  String? get cid;
  @override
  @JsonKey(ignore: true)
  _$$RecentChatImplCopyWith<_$RecentChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentChatBdy _$RecentChatBdyFromJson(Map<String, dynamic> json) {
  return _RecentChatBdy.fromJson(json);
}

/// @nodoc
mixin _$RecentChatBdy {
  List<RecentChatMsg> get messageList => throw _privateConstructorUsedError;
  int? get userCount => throw _privateConstructorUsedError;
  Notice? get notice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentChatBdyCopyWith<RecentChatBdy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentChatBdyCopyWith<$Res> {
  factory $RecentChatBdyCopyWith(
          RecentChatBdy value, $Res Function(RecentChatBdy) then) =
      _$RecentChatBdyCopyWithImpl<$Res, RecentChatBdy>;
  @useResult
  $Res call({List<RecentChatMsg> messageList, int? userCount, Notice? notice});

  $NoticeCopyWith<$Res>? get notice;
}

/// @nodoc
class _$RecentChatBdyCopyWithImpl<$Res, $Val extends RecentChatBdy>
    implements $RecentChatBdyCopyWith<$Res> {
  _$RecentChatBdyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageList = null,
    Object? userCount = freezed,
    Object? notice = freezed,
  }) {
    return _then(_value.copyWith(
      messageList: null == messageList
          ? _value.messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<RecentChatMsg>,
      userCount: freezed == userCount
          ? _value.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int?,
      notice: freezed == notice
          ? _value.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as Notice?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NoticeCopyWith<$Res>? get notice {
    if (_value.notice == null) {
      return null;
    }

    return $NoticeCopyWith<$Res>(_value.notice!, (value) {
      return _then(_value.copyWith(notice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecentChatBdyImplCopyWith<$Res>
    implements $RecentChatBdyCopyWith<$Res> {
  factory _$$RecentChatBdyImplCopyWith(
          _$RecentChatBdyImpl value, $Res Function(_$RecentChatBdyImpl) then) =
      __$$RecentChatBdyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RecentChatMsg> messageList, int? userCount, Notice? notice});

  @override
  $NoticeCopyWith<$Res>? get notice;
}

/// @nodoc
class __$$RecentChatBdyImplCopyWithImpl<$Res>
    extends _$RecentChatBdyCopyWithImpl<$Res, _$RecentChatBdyImpl>
    implements _$$RecentChatBdyImplCopyWith<$Res> {
  __$$RecentChatBdyImplCopyWithImpl(
      _$RecentChatBdyImpl _value, $Res Function(_$RecentChatBdyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageList = null,
    Object? userCount = freezed,
    Object? notice = freezed,
  }) {
    return _then(_$RecentChatBdyImpl(
      messageList: null == messageList
          ? _value._messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<RecentChatMsg>,
      userCount: freezed == userCount
          ? _value.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int?,
      notice: freezed == notice
          ? _value.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as Notice?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentChatBdyImpl implements _RecentChatBdy {
  _$RecentChatBdyImpl(
      {required final List<RecentChatMsg> messageList,
      required this.userCount,
      required this.notice})
      : _messageList = messageList;

  factory _$RecentChatBdyImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentChatBdyImplFromJson(json);

  final List<RecentChatMsg> _messageList;
  @override
  List<RecentChatMsg> get messageList {
    if (_messageList is EqualUnmodifiableListView) return _messageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messageList);
  }

  @override
  final int? userCount;
  @override
  final Notice? notice;

  @override
  String toString() {
    return 'RecentChatBdy(messageList: $messageList, userCount: $userCount, notice: $notice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentChatBdyImpl &&
            const DeepCollectionEquality()
                .equals(other._messageList, _messageList) &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount) &&
            (identical(other.notice, notice) || other.notice == notice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_messageList), userCount, notice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentChatBdyImplCopyWith<_$RecentChatBdyImpl> get copyWith =>
      __$$RecentChatBdyImplCopyWithImpl<_$RecentChatBdyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentChatBdyImplToJson(
      this,
    );
  }
}

abstract class _RecentChatBdy implements RecentChatBdy {
  factory _RecentChatBdy(
      {required final List<RecentChatMsg> messageList,
      required final int? userCount,
      required final Notice? notice}) = _$RecentChatBdyImpl;

  factory _RecentChatBdy.fromJson(Map<String, dynamic> json) =
      _$RecentChatBdyImpl.fromJson;

  @override
  List<RecentChatMsg> get messageList;
  @override
  int? get userCount;
  @override
  Notice? get notice;
  @override
  @JsonKey(ignore: true)
  _$$RecentChatBdyImplCopyWith<_$RecentChatBdyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentChatMsg _$RecentChatMsgFromJson(Map<String, dynamic> json) {
  return _RecentChatMsg.fromJson(json);
}

/// @nodoc
mixin _$RecentChatMsg {
  String get serviceId => throw _privateConstructorUsedError;
  String get channelId => throw _privateConstructorUsedError;
  int get messageTime => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  Profile get profile => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  Extras get extras => throw _privateConstructorUsedError;
  int get memberCount => throw _privateConstructorUsedError;
  int get messageTypeCode => throw _privateConstructorUsedError;
  String get messageStatusType => throw _privateConstructorUsedError;
  int get createTime => throw _privateConstructorUsedError;
  int get updateTime => throw _privateConstructorUsedError;
  Object? get msgTid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentChatMsgCopyWith<RecentChatMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentChatMsgCopyWith<$Res> {
  factory $RecentChatMsgCopyWith(
          RecentChatMsg value, $Res Function(RecentChatMsg) then) =
      _$RecentChatMsgCopyWithImpl<$Res, RecentChatMsg>;
  @useResult
  $Res call(
      {String serviceId,
      String channelId,
      int messageTime,
      String userId,
      Profile profile,
      String content,
      Extras extras,
      int memberCount,
      int messageTypeCode,
      String messageStatusType,
      int createTime,
      int updateTime,
      Object? msgTid});

  $ProfileCopyWith<$Res> get profile;
  $ExtrasCopyWith<$Res> get extras;
}

/// @nodoc
class _$RecentChatMsgCopyWithImpl<$Res, $Val extends RecentChatMsg>
    implements $RecentChatMsgCopyWith<$Res> {
  _$RecentChatMsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? channelId = null,
    Object? messageTime = null,
    Object? userId = null,
    Object? profile = null,
    Object? content = null,
    Object? extras = null,
    Object? memberCount = null,
    Object? messageTypeCode = null,
    Object? messageStatusType = null,
    Object? createTime = null,
    Object? updateTime = null,
    Object? msgTid = freezed,
  }) {
    return _then(_value.copyWith(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      messageTime: null == messageTime
          ? _value.messageTime
          : messageTime // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      extras: null == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras,
      memberCount: null == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      messageTypeCode: null == messageTypeCode
          ? _value.messageTypeCode
          : messageTypeCode // ignore: cast_nullable_to_non_nullable
              as int,
      messageStatusType: null == messageStatusType
          ? _value.messageStatusType
          : messageStatusType // ignore: cast_nullable_to_non_nullable
              as String,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as int,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as int,
      msgTid: freezed == msgTid ? _value.msgTid : msgTid,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExtrasCopyWith<$Res> get extras {
    return $ExtrasCopyWith<$Res>(_value.extras, (value) {
      return _then(_value.copyWith(extras: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecentChatMsgImplCopyWith<$Res>
    implements $RecentChatMsgCopyWith<$Res> {
  factory _$$RecentChatMsgImplCopyWith(
          _$RecentChatMsgImpl value, $Res Function(_$RecentChatMsgImpl) then) =
      __$$RecentChatMsgImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String serviceId,
      String channelId,
      int messageTime,
      String userId,
      Profile profile,
      String content,
      Extras extras,
      int memberCount,
      int messageTypeCode,
      String messageStatusType,
      int createTime,
      int updateTime,
      Object? msgTid});

  @override
  $ProfileCopyWith<$Res> get profile;
  @override
  $ExtrasCopyWith<$Res> get extras;
}

/// @nodoc
class __$$RecentChatMsgImplCopyWithImpl<$Res>
    extends _$RecentChatMsgCopyWithImpl<$Res, _$RecentChatMsgImpl>
    implements _$$RecentChatMsgImplCopyWith<$Res> {
  __$$RecentChatMsgImplCopyWithImpl(
      _$RecentChatMsgImpl _value, $Res Function(_$RecentChatMsgImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? channelId = null,
    Object? messageTime = null,
    Object? userId = null,
    Object? profile = null,
    Object? content = null,
    Object? extras = null,
    Object? memberCount = null,
    Object? messageTypeCode = null,
    Object? messageStatusType = null,
    Object? createTime = null,
    Object? updateTime = null,
    Object? msgTid = freezed,
  }) {
    return _then(_$RecentChatMsgImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      messageTime: null == messageTime
          ? _value.messageTime
          : messageTime // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      extras: null == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras,
      memberCount: null == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      messageTypeCode: null == messageTypeCode
          ? _value.messageTypeCode
          : messageTypeCode // ignore: cast_nullable_to_non_nullable
              as int,
      messageStatusType: null == messageStatusType
          ? _value.messageStatusType
          : messageStatusType // ignore: cast_nullable_to_non_nullable
              as String,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as int,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as int,
      msgTid: freezed == msgTid ? _value.msgTid : msgTid,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentChatMsgImpl implements _RecentChatMsg {
  _$RecentChatMsgImpl(
      {required this.serviceId,
      required this.channelId,
      required this.messageTime,
      required this.userId,
      required this.profile,
      required this.content,
      required this.extras,
      required this.memberCount,
      required this.messageTypeCode,
      required this.messageStatusType,
      required this.createTime,
      required this.updateTime,
      required this.msgTid});

  factory _$RecentChatMsgImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentChatMsgImplFromJson(json);

  @override
  final String serviceId;
  @override
  final String channelId;
  @override
  final int messageTime;
  @override
  final String userId;
  @override
  final Profile profile;
  @override
  final String content;
  @override
  final Extras extras;
  @override
  final int memberCount;
  @override
  final int messageTypeCode;
  @override
  final String messageStatusType;
  @override
  final int createTime;
  @override
  final int updateTime;
  @override
  final Object? msgTid;

  @override
  String toString() {
    return 'RecentChatMsg(serviceId: $serviceId, channelId: $channelId, messageTime: $messageTime, userId: $userId, profile: $profile, content: $content, extras: $extras, memberCount: $memberCount, messageTypeCode: $messageTypeCode, messageStatusType: $messageStatusType, createTime: $createTime, updateTime: $updateTime, msgTid: $msgTid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentChatMsgImpl &&
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
                other.updateTime == updateTime) &&
            const DeepCollectionEquality().equals(other.msgTid, msgTid));
  }

  @JsonKey(ignore: true)
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
      updateTime,
      const DeepCollectionEquality().hash(msgTid));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentChatMsgImplCopyWith<_$RecentChatMsgImpl> get copyWith =>
      __$$RecentChatMsgImplCopyWithImpl<_$RecentChatMsgImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentChatMsgImplToJson(
      this,
    );
  }
}

abstract class _RecentChatMsg implements RecentChatMsg {
  factory _RecentChatMsg(
      {required final String serviceId,
      required final String channelId,
      required final int messageTime,
      required final String userId,
      required final Profile profile,
      required final String content,
      required final Extras extras,
      required final int memberCount,
      required final int messageTypeCode,
      required final String messageStatusType,
      required final int createTime,
      required final int updateTime,
      required final Object? msgTid}) = _$RecentChatMsgImpl;

  factory _RecentChatMsg.fromJson(Map<String, dynamic> json) =
      _$RecentChatMsgImpl.fromJson;

  @override
  String get serviceId;
  @override
  String get channelId;
  @override
  int get messageTime;
  @override
  String get userId;
  @override
  Profile get profile;
  @override
  String get content;
  @override
  Extras get extras;
  @override
  int get memberCount;
  @override
  int get messageTypeCode;
  @override
  String get messageStatusType;
  @override
  int get createTime;
  @override
  int get updateTime;
  @override
  Object? get msgTid;
  @override
  @JsonKey(ignore: true)
  _$$RecentChatMsgImplCopyWith<_$RecentChatMsgImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Notice _$NoticeFromJson(Map<String, dynamic> json) {
  return _Notice.fromJson(json);
}

/// @nodoc
mixin _$Notice {
  String get serviceId => throw _privateConstructorUsedError;
  String get channelId => throw _privateConstructorUsedError;
  int get messageTime => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  Profile get profile => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  Extras get extras => throw _privateConstructorUsedError;
  int get messageTypeCode => throw _privateConstructorUsedError;
  int get createTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeCopyWith<Notice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeCopyWith<$Res> {
  factory $NoticeCopyWith(Notice value, $Res Function(Notice) then) =
      _$NoticeCopyWithImpl<$Res, Notice>;
  @useResult
  $Res call(
      {String serviceId,
      String channelId,
      int messageTime,
      String userId,
      Profile profile,
      String content,
      Extras extras,
      int messageTypeCode,
      int createTime});

  $ProfileCopyWith<$Res> get profile;
  $ExtrasCopyWith<$Res> get extras;
}

/// @nodoc
class _$NoticeCopyWithImpl<$Res, $Val extends Notice>
    implements $NoticeCopyWith<$Res> {
  _$NoticeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? channelId = null,
    Object? messageTime = null,
    Object? userId = null,
    Object? profile = null,
    Object? content = null,
    Object? extras = null,
    Object? messageTypeCode = null,
    Object? createTime = null,
  }) {
    return _then(_value.copyWith(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      messageTime: null == messageTime
          ? _value.messageTime
          : messageTime // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      extras: null == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras,
      messageTypeCode: null == messageTypeCode
          ? _value.messageTypeCode
          : messageTypeCode // ignore: cast_nullable_to_non_nullable
              as int,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExtrasCopyWith<$Res> get extras {
    return $ExtrasCopyWith<$Res>(_value.extras, (value) {
      return _then(_value.copyWith(extras: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NoticeImplCopyWith<$Res> implements $NoticeCopyWith<$Res> {
  factory _$$NoticeImplCopyWith(
          _$NoticeImpl value, $Res Function(_$NoticeImpl) then) =
      __$$NoticeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String serviceId,
      String channelId,
      int messageTime,
      String userId,
      Profile profile,
      String content,
      Extras extras,
      int messageTypeCode,
      int createTime});

  @override
  $ProfileCopyWith<$Res> get profile;
  @override
  $ExtrasCopyWith<$Res> get extras;
}

/// @nodoc
class __$$NoticeImplCopyWithImpl<$Res>
    extends _$NoticeCopyWithImpl<$Res, _$NoticeImpl>
    implements _$$NoticeImplCopyWith<$Res> {
  __$$NoticeImplCopyWithImpl(
      _$NoticeImpl _value, $Res Function(_$NoticeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? channelId = null,
    Object? messageTime = null,
    Object? userId = null,
    Object? profile = null,
    Object? content = null,
    Object? extras = null,
    Object? messageTypeCode = null,
    Object? createTime = null,
  }) {
    return _then(_$NoticeImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      messageTime: null == messageTime
          ? _value.messageTime
          : messageTime // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      extras: null == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras,
      messageTypeCode: null == messageTypeCode
          ? _value.messageTypeCode
          : messageTypeCode // ignore: cast_nullable_to_non_nullable
              as int,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeImpl implements _Notice {
  _$NoticeImpl(
      {required this.serviceId,
      required this.channelId,
      required this.messageTime,
      required this.userId,
      required this.profile,
      required this.content,
      required this.extras,
      required this.messageTypeCode,
      required this.createTime});

  factory _$NoticeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeImplFromJson(json);

  @override
  final String serviceId;
  @override
  final String channelId;
  @override
  final int messageTime;
  @override
  final String userId;
  @override
  final Profile profile;
  @override
  final String content;
  @override
  final Extras extras;
  @override
  final int messageTypeCode;
  @override
  final int createTime;

  @override
  String toString() {
    return 'Notice(serviceId: $serviceId, channelId: $channelId, messageTime: $messageTime, userId: $userId, profile: $profile, content: $content, extras: $extras, messageTypeCode: $messageTypeCode, createTime: $createTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeImpl &&
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
            (identical(other.messageTypeCode, messageTypeCode) ||
                other.messageTypeCode == messageTypeCode) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime));
  }

  @JsonKey(ignore: true)
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
      messageTypeCode,
      createTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeImplCopyWith<_$NoticeImpl> get copyWith =>
      __$$NoticeImplCopyWithImpl<_$NoticeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeImplToJson(
      this,
    );
  }
}

abstract class _Notice implements Notice {
  factory _Notice(
      {required final String serviceId,
      required final String channelId,
      required final int messageTime,
      required final String userId,
      required final Profile profile,
      required final String content,
      required final Extras extras,
      required final int messageTypeCode,
      required final int createTime}) = _$NoticeImpl;

  factory _Notice.fromJson(Map<String, dynamic> json) = _$NoticeImpl.fromJson;

  @override
  String get serviceId;
  @override
  String get channelId;
  @override
  int get messageTime;
  @override
  String get userId;
  @override
  Profile get profile;
  @override
  String get content;
  @override
  Extras get extras;
  @override
  int get messageTypeCode;
  @override
  int get createTime;
  @override
  @JsonKey(ignore: true)
  _$$NoticeImplCopyWith<_$NoticeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
