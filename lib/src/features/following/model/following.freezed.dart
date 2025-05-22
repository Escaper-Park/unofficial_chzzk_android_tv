// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Following {
  String get channelId;
  Channel get channel;
  Streamer get streamer;
  LiveInfo get liveInfo;

  /// Create a copy of Following
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingCopyWith<Following> get copyWith =>
      _$FollowingCopyWithImpl<Following>(this as Following, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Following &&
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

  @override
  String toString() {
    return 'Following(channelId: $channelId, channel: $channel, streamer: $streamer, liveInfo: $liveInfo)';
  }
}

/// @nodoc
abstract mixin class $FollowingCopyWith<$Res> {
  factory $FollowingCopyWith(Following value, $Res Function(Following) _then) =
      _$FollowingCopyWithImpl;
  @useResult
  $Res call(
      {String channelId,
      Channel channel,
      Streamer streamer,
      LiveInfo liveInfo});
}

/// @nodoc
class _$FollowingCopyWithImpl<$Res> implements $FollowingCopyWith<$Res> {
  _$FollowingCopyWithImpl(this._self, this._then);

  final Following _self;
  final $Res Function(Following) _then;

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
    return _then(Following(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
      streamer: null == streamer
          ? _self.streamer
          : streamer // ignore: cast_nullable_to_non_nullable
              as Streamer,
      liveInfo: null == liveInfo
          ? _self.liveInfo
          : liveInfo // ignore: cast_nullable_to_non_nullable
              as LiveInfo,
    ));
  }
}

/// @nodoc
mixin _$Streamer {
  bool get openLive;

  /// Create a copy of Streamer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StreamerCopyWith<Streamer> get copyWith =>
      _$StreamerCopyWithImpl<Streamer>(this as Streamer, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Streamer &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, openLive);

  @override
  String toString() {
    return 'Streamer(openLive: $openLive)';
  }
}

/// @nodoc
abstract mixin class $StreamerCopyWith<$Res> {
  factory $StreamerCopyWith(Streamer value, $Res Function(Streamer) _then) =
      _$StreamerCopyWithImpl;
  @useResult
  $Res call({bool openLive});
}

/// @nodoc
class _$StreamerCopyWithImpl<$Res> implements $StreamerCopyWith<$Res> {
  _$StreamerCopyWithImpl(this._self, this._then);

  final Streamer _self;
  final $Res Function(Streamer) _then;

  /// Create a copy of Streamer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openLive = null,
  }) {
    return _then(Streamer(
      openLive: null == openLive
          ? _self.openLive
          : openLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
