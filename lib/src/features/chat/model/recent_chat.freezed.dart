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
  List<RecentChatBdy> get bdy => throw _privateConstructorUsedError;
  int get cmd => throw _privateConstructorUsedError;
  int get retCode => throw _privateConstructorUsedError;
  String? get retMsg => throw _privateConstructorUsedError;
  String? get tid => throw _privateConstructorUsedError;
  String? get cid => throw _privateConstructorUsedError;

  /// Serializes this RecentChat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentChat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      List<RecentChatBdy> bdy,
      int cmd,
      int retCode,
      String? retMsg,
      String? tid,
      String? cid});
}

/// @nodoc
class _$RecentChatCopyWithImpl<$Res, $Val extends RecentChat>
    implements $RecentChatCopyWith<$Res> {
  _$RecentChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      svcid: null == svcid
          ? _value.svcid
          : svcid // ignore: cast_nullable_to_non_nullable
              as String,
      bdy: null == bdy
          ? _value.bdy
          : bdy // ignore: cast_nullable_to_non_nullable
              as List<RecentChatBdy>,
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as int,
      retCode: null == retCode
          ? _value.retCode
          : retCode // ignore: cast_nullable_to_non_nullable
              as int,
      retMsg: freezed == retMsg
          ? _value.retMsg
          : retMsg // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$RecentChatImplCopyWith<$Res>
    implements $RecentChatCopyWith<$Res> {
  factory _$$RecentChatImplCopyWith(
          _$RecentChatImpl value, $Res Function(_$RecentChatImpl) then) =
      __$$RecentChatImplCopyWithImpl<$Res>;
  @override
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
class __$$RecentChatImplCopyWithImpl<$Res>
    extends _$RecentChatCopyWithImpl<$Res, _$RecentChatImpl>
    implements _$$RecentChatImplCopyWith<$Res> {
  __$$RecentChatImplCopyWithImpl(
      _$RecentChatImpl _value, $Res Function(_$RecentChatImpl) _then)
      : super(_value, _then);

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
    return _then(_$RecentChatImpl(
      svcid: null == svcid
          ? _value.svcid
          : svcid // ignore: cast_nullable_to_non_nullable
              as String,
      bdy: null == bdy
          ? _value._bdy
          : bdy // ignore: cast_nullable_to_non_nullable
              as List<RecentChatBdy>,
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as int,
      retCode: null == retCode
          ? _value.retCode
          : retCode // ignore: cast_nullable_to_non_nullable
              as int,
      retMsg: freezed == retMsg
          ? _value.retMsg
          : retMsg // ignore: cast_nullable_to_non_nullable
              as String?,
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
  const _$RecentChatImpl(
      {required this.svcid,
      required final List<RecentChatBdy> bdy,
      required this.cmd,
      required this.retCode,
      this.retMsg,
      this.tid,
      this.cid})
      : _bdy = bdy;

  factory _$RecentChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentChatImplFromJson(json);

  @override
  final String svcid;
  final List<RecentChatBdy> _bdy;
  @override
  List<RecentChatBdy> get bdy {
    if (_bdy is EqualUnmodifiableListView) return _bdy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bdy);
  }

  @override
  final int cmd;
  @override
  final int retCode;
  @override
  final String? retMsg;
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
            const DeepCollectionEquality().equals(other._bdy, _bdy) &&
            (identical(other.cmd, cmd) || other.cmd == cmd) &&
            (identical(other.retCode, retCode) || other.retCode == retCode) &&
            (identical(other.retMsg, retMsg) || other.retMsg == retMsg) &&
            (identical(other.tid, tid) || other.tid == tid) &&
            (identical(other.cid, cid) || other.cid == cid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      svcid,
      const DeepCollectionEquality().hash(_bdy),
      cmd,
      retCode,
      retMsg,
      tid,
      cid);

  /// Create a copy of RecentChat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  const factory _RecentChat(
      {required final String svcid,
      required final List<RecentChatBdy> bdy,
      required final int cmd,
      required final int retCode,
      final String? retMsg,
      final String? tid,
      final String? cid}) = _$RecentChatImpl;

  factory _RecentChat.fromJson(Map<String, dynamic> json) =
      _$RecentChatImpl.fromJson;

  @override
  String get svcid;
  @override
  List<RecentChatBdy> get bdy;
  @override
  int get cmd;
  @override
  int get retCode;
  @override
  String? get retMsg;
  @override
  String? get tid;
  @override
  String? get cid;

  /// Create a copy of RecentChat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this RecentChatBdy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentChatBdy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentChatBdyCopyWith<RecentChatBdy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentChatBdyCopyWith<$Res> {
  factory $RecentChatBdyCopyWith(
          RecentChatBdy value, $Res Function(RecentChatBdy) then) =
      _$RecentChatBdyCopyWithImpl<$Res, RecentChatBdy>;
  @useResult
  $Res call({List<RecentChatMsg> messageList, int? userCount});
}

/// @nodoc
class _$RecentChatBdyCopyWithImpl<$Res, $Val extends RecentChatBdy>
    implements $RecentChatBdyCopyWith<$Res> {
  _$RecentChatBdyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentChatBdy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageList = null,
    Object? userCount = freezed,
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
    ) as $Val);
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
  $Res call({List<RecentChatMsg> messageList, int? userCount});
}

/// @nodoc
class __$$RecentChatBdyImplCopyWithImpl<$Res>
    extends _$RecentChatBdyCopyWithImpl<$Res, _$RecentChatBdyImpl>
    implements _$$RecentChatBdyImplCopyWith<$Res> {
  __$$RecentChatBdyImplCopyWithImpl(
      _$RecentChatBdyImpl _value, $Res Function(_$RecentChatBdyImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentChatBdy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageList = null,
    Object? userCount = freezed,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentChatBdyImpl implements _RecentChatBdy {
  const _$RecentChatBdyImpl(
      {required final List<RecentChatMsg> messageList, this.userCount})
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
  String toString() {
    return 'RecentChatBdy(messageList: $messageList, userCount: $userCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentChatBdyImpl &&
            const DeepCollectionEquality()
                .equals(other._messageList, _messageList) &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_messageList), userCount);

  /// Create a copy of RecentChatBdy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  const factory _RecentChatBdy(
      {required final List<RecentChatMsg> messageList,
      final int? userCount}) = _$RecentChatBdyImpl;

  factory _RecentChatBdy.fromJson(Map<String, dynamic> json) =
      _$RecentChatBdyImpl.fromJson;

  @override
  List<RecentChatMsg> get messageList;
  @override
  int? get userCount;

  /// Create a copy of RecentChatBdy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  @ProfileConverter()
  Profile? get profile => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @ExtrasConverter()
  Extras? get extras => throw _privateConstructorUsedError;
  int get memberCount => throw _privateConstructorUsedError;
  int get messageTypeCode => throw _privateConstructorUsedError;
  String get messageStatusType => throw _privateConstructorUsedError;
  int get createTime => throw _privateConstructorUsedError;
  int get updateTime => throw _privateConstructorUsedError;

  /// Serializes this RecentChatMsg to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentChatMsg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @ProfileConverter() Profile? profile,
      String content,
      @ExtrasConverter() Extras? extras,
      int memberCount,
      int messageTypeCode,
      String messageStatusType,
      int createTime,
      int updateTime});

  $ProfileCopyWith<$Res>? get profile;
  $ExtrasCopyWith<$Res>? get extras;
}

/// @nodoc
class _$RecentChatMsgCopyWithImpl<$Res, $Val extends RecentChatMsg>
    implements $RecentChatMsgCopyWith<$Res> {
  _$RecentChatMsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras?,
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
    ) as $Val);
  }

  /// Create a copy of RecentChatMsg
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

  /// Create a copy of RecentChatMsg
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
      @ProfileConverter() Profile? profile,
      String content,
      @ExtrasConverter() Extras? extras,
      int memberCount,
      int messageTypeCode,
      String messageStatusType,
      int createTime,
      int updateTime});

  @override
  $ProfileCopyWith<$Res>? get profile;
  @override
  $ExtrasCopyWith<$Res>? get extras;
}

/// @nodoc
class __$$RecentChatMsgImplCopyWithImpl<$Res>
    extends _$RecentChatMsgCopyWithImpl<$Res, _$RecentChatMsgImpl>
    implements _$$RecentChatMsgImplCopyWith<$Res> {
  __$$RecentChatMsgImplCopyWithImpl(
      _$RecentChatMsgImpl _value, $Res Function(_$RecentChatMsgImpl) _then)
      : super(_value, _then);

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
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as Extras?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentChatMsgImpl implements _RecentChatMsg {
  const _$RecentChatMsgImpl(
      {required this.serviceId,
      required this.channelId,
      required this.messageTime,
      required this.userId,
      @ProfileConverter() this.profile,
      required this.content,
      @ExtrasConverter() this.extras,
      required this.memberCount,
      required this.messageTypeCode,
      required this.messageStatusType,
      required this.createTime,
      required this.updateTime});

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
  @ProfileConverter()
  final Profile? profile;
  @override
  final String content;
  @override
  @ExtrasConverter()
  final Extras? extras;
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
  String toString() {
    return 'RecentChatMsg(serviceId: $serviceId, channelId: $channelId, messageTime: $messageTime, userId: $userId, profile: $profile, content: $content, extras: $extras, memberCount: $memberCount, messageTypeCode: $messageTypeCode, messageStatusType: $messageStatusType, createTime: $createTime, updateTime: $updateTime)';
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

  /// Create a copy of RecentChatMsg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  const factory _RecentChatMsg(
      {required final String serviceId,
      required final String channelId,
      required final int messageTime,
      required final String userId,
      @ProfileConverter() final Profile? profile,
      required final String content,
      @ExtrasConverter() final Extras? extras,
      required final int memberCount,
      required final int messageTypeCode,
      required final String messageStatusType,
      required final int createTime,
      required final int updateTime}) = _$RecentChatMsgImpl;

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
  @ProfileConverter()
  Profile? get profile;
  @override
  String get content;
  @override
  @ExtrasConverter()
  Extras? get extras;
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

  /// Create a copy of RecentChatMsg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentChatMsgImplCopyWith<_$RecentChatMsgImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
