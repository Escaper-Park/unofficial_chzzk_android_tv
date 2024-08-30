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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Following _$FollowingFromJson(Map<String, dynamic> json) {
  return _Following.fromJson(json);
}

/// @nodoc
mixin _$Following {
  String get channelId => throw _privateConstructorUsedError;
  Channel get channel => throw _privateConstructorUsedError;
  Streamer get streamer => throw _privateConstructorUsedError;
  LiveInfo get liveInfo => throw _privateConstructorUsedError;

  /// Serializes this Following to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Following
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowingCopyWith<Following> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingCopyWith<$Res> {
  factory $FollowingCopyWith(Following value, $Res Function(Following) then) =
      _$FollowingCopyWithImpl<$Res, Following>;
  @useResult
  $Res call(
      {String channelId,
      Channel channel,
      Streamer streamer,
      LiveInfo liveInfo});

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

  /// Create a copy of Following
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channel = null,
    Object? streamer = null,
    Object? liveInfo = null,
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
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

  /// Create a copy of Following
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelCopyWith<$Res> get channel {
    return $ChannelCopyWith<$Res>(_value.channel, (value) {
      return _then(_value.copyWith(channel: value) as $Val);
    });
  }

  /// Create a copy of Following
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StreamerCopyWith<$Res> get streamer {
    return $StreamerCopyWith<$Res>(_value.streamer, (value) {
      return _then(_value.copyWith(streamer: value) as $Val);
    });
  }

  /// Create a copy of Following
  /// with the given fields replaced by the non-null parameter values.
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
  $Res call(
      {String channelId,
      Channel channel,
      Streamer streamer,
      LiveInfo liveInfo});

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

  /// Create a copy of Following
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channel = null,
    Object? streamer = null,
    Object? liveInfo = null,
  }) {
    return _then(_$FollowingImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
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
      {required this.channelId,
      required this.channel,
      required this.streamer,
      required this.liveInfo});

  factory _$FollowingImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingImplFromJson(json);

  @override
  final String channelId;
  @override
  final Channel channel;
  @override
  final Streamer streamer;
  @override
  final LiveInfo liveInfo;

  @override
  String toString() {
    return 'Following(channelId: $channelId, channel: $channel, streamer: $streamer, liveInfo: $liveInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingImpl &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.streamer, streamer) ||
                other.streamer == streamer) &&
            (identical(other.liveInfo, liveInfo) ||
                other.liveInfo == liveInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, channelId, channel, streamer, liveInfo);

  /// Create a copy of Following
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {required final String channelId,
      required final Channel channel,
      required final Streamer streamer,
      required final LiveInfo liveInfo}) = _$FollowingImpl;

  factory _Following.fromJson(Map<String, dynamic> json) =
      _$FollowingImpl.fromJson;

  @override
  String get channelId;
  @override
  Channel get channel;
  @override
  Streamer get streamer;
  @override
  LiveInfo get liveInfo;

  /// Create a copy of Following
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowingImplCopyWith<_$FollowingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Streamer _$StreamerFromJson(Map<String, dynamic> json) {
  return _Streamer.fromJson(json);
}

/// @nodoc
mixin _$Streamer {
  bool get openLive => throw _privateConstructorUsedError;

  /// Serializes this Streamer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Streamer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Streamer
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of Streamer
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, openLive);

  /// Create a copy of Streamer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Streamer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreamerImplCopyWith<_$StreamerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowingResponse _$FollowingResponseFromJson(Map<String, dynamic> json) {
  return _FollowingResponse.fromJson(json);
}

/// @nodoc
mixin _$FollowingResponse {
  int get totalCount => throw _privateConstructorUsedError;
  int? get totalPage => throw _privateConstructorUsedError;
  List<Following> get followingList => throw _privateConstructorUsedError;

  /// Serializes this FollowingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowingResponseCopyWith<FollowingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingResponseCopyWith<$Res> {
  factory $FollowingResponseCopyWith(
          FollowingResponse value, $Res Function(FollowingResponse) then) =
      _$FollowingResponseCopyWithImpl<$Res, FollowingResponse>;
  @useResult
  $Res call({int totalCount, int? totalPage, List<Following> followingList});
}

/// @nodoc
class _$FollowingResponseCopyWithImpl<$Res, $Val extends FollowingResponse>
    implements $FollowingResponseCopyWith<$Res> {
  _$FollowingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? totalPage = freezed,
    Object? followingList = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      followingList: null == followingList
          ? _value.followingList
          : followingList // ignore: cast_nullable_to_non_nullable
              as List<Following>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingResponseImplCopyWith<$Res>
    implements $FollowingResponseCopyWith<$Res> {
  factory _$$FollowingResponseImplCopyWith(_$FollowingResponseImpl value,
          $Res Function(_$FollowingResponseImpl) then) =
      __$$FollowingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalCount, int? totalPage, List<Following> followingList});
}

/// @nodoc
class __$$FollowingResponseImplCopyWithImpl<$Res>
    extends _$FollowingResponseCopyWithImpl<$Res, _$FollowingResponseImpl>
    implements _$$FollowingResponseImplCopyWith<$Res> {
  __$$FollowingResponseImplCopyWithImpl(_$FollowingResponseImpl _value,
      $Res Function(_$FollowingResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? totalPage = freezed,
    Object? followingList = null,
  }) {
    return _then(_$FollowingResponseImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      followingList: null == followingList
          ? _value._followingList
          : followingList // ignore: cast_nullable_to_non_nullable
              as List<Following>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingResponseImpl implements _FollowingResponse {
  const _$FollowingResponseImpl(
      {required this.totalCount,
      required this.totalPage,
      required final List<Following> followingList})
      : _followingList = followingList;

  factory _$FollowingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingResponseImplFromJson(json);

  @override
  final int totalCount;
  @override
  final int? totalPage;
  final List<Following> _followingList;
  @override
  List<Following> get followingList {
    if (_followingList is EqualUnmodifiableListView) return _followingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followingList);
  }

  @override
  String toString() {
    return 'FollowingResponse(totalCount: $totalCount, totalPage: $totalPage, followingList: $followingList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingResponseImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            const DeepCollectionEquality()
                .equals(other._followingList, _followingList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, totalPage,
      const DeepCollectionEquality().hash(_followingList));

  /// Create a copy of FollowingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingResponseImplCopyWith<_$FollowingResponseImpl> get copyWith =>
      __$$FollowingResponseImplCopyWithImpl<_$FollowingResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingResponseImplToJson(
      this,
    );
  }
}

abstract class _FollowingResponse implements FollowingResponse {
  const factory _FollowingResponse(
      {required final int totalCount,
      required final int? totalPage,
      required final List<Following> followingList}) = _$FollowingResponseImpl;

  factory _FollowingResponse.fromJson(Map<String, dynamic> json) =
      _$FollowingResponseImpl.fromJson;

  @override
  int get totalCount;
  @override
  int? get totalPage;
  @override
  List<Following> get followingList;

  /// Create a copy of FollowingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowingResponseImplCopyWith<_$FollowingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowingCategoryResponse _$FollowingCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return _FollowingCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$FollowingCategoryResponse {
  List<Category>? get followingList => throw _privateConstructorUsedError;

  /// Serializes this FollowingCategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowingCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowingCategoryResponseCopyWith<FollowingCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingCategoryResponseCopyWith<$Res> {
  factory $FollowingCategoryResponseCopyWith(FollowingCategoryResponse value,
          $Res Function(FollowingCategoryResponse) then) =
      _$FollowingCategoryResponseCopyWithImpl<$Res, FollowingCategoryResponse>;
  @useResult
  $Res call({List<Category>? followingList});
}

/// @nodoc
class _$FollowingCategoryResponseCopyWithImpl<$Res,
        $Val extends FollowingCategoryResponse>
    implements $FollowingCategoryResponseCopyWith<$Res> {
  _$FollowingCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowingCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingList = freezed,
  }) {
    return _then(_value.copyWith(
      followingList: freezed == followingList
          ? _value.followingList
          : followingList // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingCategoryResponseImplCopyWith<$Res>
    implements $FollowingCategoryResponseCopyWith<$Res> {
  factory _$$FollowingCategoryResponseImplCopyWith(
          _$FollowingCategoryResponseImpl value,
          $Res Function(_$FollowingCategoryResponseImpl) then) =
      __$$FollowingCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Category>? followingList});
}

/// @nodoc
class __$$FollowingCategoryResponseImplCopyWithImpl<$Res>
    extends _$FollowingCategoryResponseCopyWithImpl<$Res,
        _$FollowingCategoryResponseImpl>
    implements _$$FollowingCategoryResponseImplCopyWith<$Res> {
  __$$FollowingCategoryResponseImplCopyWithImpl(
      _$FollowingCategoryResponseImpl _value,
      $Res Function(_$FollowingCategoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowingCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingList = freezed,
  }) {
    return _then(_$FollowingCategoryResponseImpl(
      followingList: freezed == followingList
          ? _value._followingList
          : followingList // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingCategoryResponseImpl implements _FollowingCategoryResponse {
  const _$FollowingCategoryResponseImpl(
      {required final List<Category>? followingList})
      : _followingList = followingList;

  factory _$FollowingCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingCategoryResponseImplFromJson(json);

  final List<Category>? _followingList;
  @override
  List<Category>? get followingList {
    final value = _followingList;
    if (value == null) return null;
    if (_followingList is EqualUnmodifiableListView) return _followingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowingCategoryResponse(followingList: $followingList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingCategoryResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._followingList, _followingList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_followingList));

  /// Create a copy of FollowingCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingCategoryResponseImplCopyWith<_$FollowingCategoryResponseImpl>
      get copyWith => __$$FollowingCategoryResponseImplCopyWithImpl<
          _$FollowingCategoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _FollowingCategoryResponse implements FollowingCategoryResponse {
  const factory _FollowingCategoryResponse(
          {required final List<Category>? followingList}) =
      _$FollowingCategoryResponseImpl;

  factory _FollowingCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$FollowingCategoryResponseImpl.fromJson;

  @override
  List<Category>? get followingList;

  /// Create a copy of FollowingCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowingCategoryResponseImplCopyWith<_$FollowingCategoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
