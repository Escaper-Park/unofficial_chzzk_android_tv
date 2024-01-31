// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Following _$FollowingFromJson(Map<String, dynamic> json) {
  return _Following.fromJson(json);
}

/// @nodoc
mixin _$Following {
  Channel get channel => throw _privateConstructorUsedError;
  Streamer get streamer => throw _privateConstructorUsedError;
  LiveInfo get liveInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingCopyWith<Following> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingCopyWith<$Res> {
  factory $FollowingCopyWith(Following value, $Res Function(Following) then) =
      _$FollowingCopyWithImpl<$Res, Following>;
  @useResult
  $Res call({Channel channel, Streamer streamer, LiveInfo liveInfo});

  $ChannelCopyWith<$Res> get channel;
  $StreamerCopyWith<$Res> get streamer;
  $LiveInfoCopyWith<$Res> get liveInfo;
}

/// @nodoc
class _$FollowingCopyWithImpl<$Res, $Val extends Following>
    implements $FollowingCopyWith<$Res> {
  _$FollowingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? streamer = null,
    Object? liveInfo = null,
  }) {
    return _then(_value.copyWith(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
      streamer: null == streamer
          ? _value.streamer
          : streamer // ignore: cast_nullable_to_non_nullable
              as Streamer,
      liveInfo: null == liveInfo
          ? _value.liveInfo
          : liveInfo // ignore: cast_nullable_to_non_nullable
              as LiveInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChannelCopyWith<$Res> get channel {
    return $ChannelCopyWith<$Res>(_value.channel, (value) {
      return _then(_value.copyWith(channel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StreamerCopyWith<$Res> get streamer {
    return $StreamerCopyWith<$Res>(_value.streamer, (value) {
      return _then(_value.copyWith(streamer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LiveInfoCopyWith<$Res> get liveInfo {
    return $LiveInfoCopyWith<$Res>(_value.liveInfo, (value) {
      return _then(_value.copyWith(liveInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowingImplCopyWith<$Res>
    implements $FollowingCopyWith<$Res> {
  factory _$$FollowingImplCopyWith(
          _$FollowingImpl value, $Res Function(_$FollowingImpl) then) =
      __$$FollowingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Channel channel, Streamer streamer, LiveInfo liveInfo});

  @override
  $ChannelCopyWith<$Res> get channel;
  @override
  $StreamerCopyWith<$Res> get streamer;
  @override
  $LiveInfoCopyWith<$Res> get liveInfo;
}

/// @nodoc
class __$$FollowingImplCopyWithImpl<$Res>
    extends _$FollowingCopyWithImpl<$Res, _$FollowingImpl>
    implements _$$FollowingImplCopyWith<$Res> {
  __$$FollowingImplCopyWithImpl(
      _$FollowingImpl _value, $Res Function(_$FollowingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? streamer = null,
    Object? liveInfo = null,
  }) {
    return _then(_$FollowingImpl(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
      streamer: null == streamer
          ? _value.streamer
          : streamer // ignore: cast_nullable_to_non_nullable
              as Streamer,
      liveInfo: null == liveInfo
          ? _value.liveInfo
          : liveInfo // ignore: cast_nullable_to_non_nullable
              as LiveInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingImpl implements _Following {
  const _$FollowingImpl(
      {required this.channel, required this.streamer, required this.liveInfo});

  factory _$FollowingImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingImplFromJson(json);

  @override
  final Channel channel;
  @override
  final Streamer streamer;
  @override
  final LiveInfo liveInfo;

  @override
  String toString() {
    return 'Following(channel: $channel, streamer: $streamer, liveInfo: $liveInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingImpl &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.streamer, streamer) ||
                other.streamer == streamer) &&
            (identical(other.liveInfo, liveInfo) ||
                other.liveInfo == liveInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, channel, streamer, liveInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingImplCopyWith<_$FollowingImpl> get copyWith =>
      __$$FollowingImplCopyWithImpl<_$FollowingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingImplToJson(
      this,
    );
  }
}

abstract class _Following implements Following {
  const factory _Following(
      {required final Channel channel,
      required final Streamer streamer,
      required final LiveInfo liveInfo}) = _$FollowingImpl;

  factory _Following.fromJson(Map<String, dynamic> json) =
      _$FollowingImpl.fromJson;

  @override
  Channel get channel;
  @override
  Streamer get streamer;
  @override
  LiveInfo get liveInfo;
  @override
  @JsonKey(ignore: true)
  _$$FollowingImplCopyWith<_$FollowingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Streamer _$StreamerFromJson(Map<String, dynamic> json) {
  return _Streamer.fromJson(json);
}

/// @nodoc
mixin _$Streamer {
  bool get openLive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreamerCopyWith<Streamer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamerCopyWith<$Res> {
  factory $StreamerCopyWith(Streamer value, $Res Function(Streamer) then) =
      _$StreamerCopyWithImpl<$Res, Streamer>;
  @useResult
  $Res call({bool openLive});
}

/// @nodoc
class _$StreamerCopyWithImpl<$Res, $Val extends Streamer>
    implements $StreamerCopyWith<$Res> {
  _$StreamerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openLive = null,
  }) {
    return _then(_value.copyWith(
      openLive: null == openLive
          ? _value.openLive
          : openLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreamerImplCopyWith<$Res>
    implements $StreamerCopyWith<$Res> {
  factory _$$StreamerImplCopyWith(
          _$StreamerImpl value, $Res Function(_$StreamerImpl) then) =
      __$$StreamerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool openLive});
}

/// @nodoc
class __$$StreamerImplCopyWithImpl<$Res>
    extends _$StreamerCopyWithImpl<$Res, _$StreamerImpl>
    implements _$$StreamerImplCopyWith<$Res> {
  __$$StreamerImplCopyWithImpl(
      _$StreamerImpl _value, $Res Function(_$StreamerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openLive = null,
  }) {
    return _then(_$StreamerImpl(
      openLive: null == openLive
          ? _value.openLive
          : openLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreamerImpl implements _Streamer {
  const _$StreamerImpl({required this.openLive});

  factory _$StreamerImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreamerImplFromJson(json);

  @override
  final bool openLive;

  @override
  String toString() {
    return 'Streamer(openLive: $openLive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamerImpl &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, openLive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamerImplCopyWith<_$StreamerImpl> get copyWith =>
      __$$StreamerImplCopyWithImpl<_$StreamerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreamerImplToJson(
      this,
    );
  }
}

abstract class _Streamer implements Streamer {
  const factory _Streamer({required final bool openLive}) = _$StreamerImpl;

  factory _Streamer.fromJson(Map<String, dynamic> json) =
      _$StreamerImpl.fromJson;

  @override
  bool get openLive;
  @override
  @JsonKey(ignore: true)
  _$$StreamerImplCopyWith<_$StreamerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveInfo _$LiveInfoFromJson(Map<String, dynamic> json) {
  return _LiveInfo.fromJson(json);
}

/// @nodoc
mixin _$LiveInfo {
  String? get liveTitle => throw _privateConstructorUsedError;
  int get concurrentUserCount => throw _privateConstructorUsedError;
  String? get liveCategoryValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveInfoCopyWith<LiveInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveInfoCopyWith<$Res> {
  factory $LiveInfoCopyWith(LiveInfo value, $Res Function(LiveInfo) then) =
      _$LiveInfoCopyWithImpl<$Res, LiveInfo>;
  @useResult
  $Res call(
      {String? liveTitle, int concurrentUserCount, String? liveCategoryValue});
}

/// @nodoc
class _$LiveInfoCopyWithImpl<$Res, $Val extends LiveInfo>
    implements $LiveInfoCopyWith<$Res> {
  _$LiveInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveTitle = freezed,
    Object? concurrentUserCount = null,
    Object? liveCategoryValue = freezed,
  }) {
    return _then(_value.copyWith(
      liveTitle: freezed == liveTitle
          ? _value.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      liveCategoryValue: freezed == liveCategoryValue
          ? _value.liveCategoryValue
          : liveCategoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveInfoImplCopyWith<$Res>
    implements $LiveInfoCopyWith<$Res> {
  factory _$$LiveInfoImplCopyWith(
          _$LiveInfoImpl value, $Res Function(_$LiveInfoImpl) then) =
      __$$LiveInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? liveTitle, int concurrentUserCount, String? liveCategoryValue});
}

/// @nodoc
class __$$LiveInfoImplCopyWithImpl<$Res>
    extends _$LiveInfoCopyWithImpl<$Res, _$LiveInfoImpl>
    implements _$$LiveInfoImplCopyWith<$Res> {
  __$$LiveInfoImplCopyWithImpl(
      _$LiveInfoImpl _value, $Res Function(_$LiveInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveTitle = freezed,
    Object? concurrentUserCount = null,
    Object? liveCategoryValue = freezed,
  }) {
    return _then(_$LiveInfoImpl(
      liveTitle: freezed == liveTitle
          ? _value.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      liveCategoryValue: freezed == liveCategoryValue
          ? _value.liveCategoryValue
          : liveCategoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveInfoImpl implements _LiveInfo {
  const _$LiveInfoImpl(
      {required this.liveTitle,
      required this.concurrentUserCount,
      required this.liveCategoryValue});

  factory _$LiveInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveInfoImplFromJson(json);

  @override
  final String? liveTitle;
  @override
  final int concurrentUserCount;
  @override
  final String? liveCategoryValue;

  @override
  String toString() {
    return 'LiveInfo(liveTitle: $liveTitle, concurrentUserCount: $concurrentUserCount, liveCategoryValue: $liveCategoryValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveInfoImpl &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, liveTitle, concurrentUserCount, liveCategoryValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveInfoImplCopyWith<_$LiveInfoImpl> get copyWith =>
      __$$LiveInfoImplCopyWithImpl<_$LiveInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveInfoImplToJson(
      this,
    );
  }
}

abstract class _LiveInfo implements LiveInfo {
  const factory _LiveInfo(
      {required final String? liveTitle,
      required final int concurrentUserCount,
      required final String? liveCategoryValue}) = _$LiveInfoImpl;

  factory _LiveInfo.fromJson(Map<String, dynamic> json) =
      _$LiveInfoImpl.fromJson;

  @override
  String? get liveTitle;
  @override
  int get concurrentUserCount;
  @override
  String? get liveCategoryValue;
  @override
  @JsonKey(ignore: true)
  _$$LiveInfoImplCopyWith<_$LiveInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
