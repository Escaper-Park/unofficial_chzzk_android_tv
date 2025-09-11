// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StreamSettings _$StreamSettingsFromJson(Map<String, dynamic> json) {
  return _StreamSettings.fromJson(json);
}

/// @nodoc
mixin _$StreamSettings {
  /// The index of default resolution of single view live streaming.
  ///
  /// 0: 360p, 1: 480p, 2: 720p, 3: 1080p, 4: auto
  int get resolutionIndex => throw _privateConstructorUsedError;

  /// The index of default resolution of multi view live streaming.
  ///
  /// 0: 360p, 1: 480p, 2: 720p, 3: 1080p, 4: auto
  int get multiviewResolutionIndex => throw _privateConstructorUsedError;

  /// The index of default resolution of vod streaming.
  ///
  /// 0: 720p, 1: 1080p, 2: auto
  int get vodResolutionIndex => throw _privateConstructorUsedError;

  /// The index of default screen mode of single view live streaming.
  ///
  /// 0: off, 1: overlay, 2: side
  int get liveChatWindowIndex => throw _privateConstructorUsedError;

  /// The index of default screen mode of vod streaming.
  ///
  /// 0: off, 1: overlay, 2: side
  int get vodChatWindowIndex => throw _privateConstructorUsedError;

  /// 0: HLS, 1:LLHLS
  int get latencyIndex => throw _privateConstructorUsedError;

  /// The time(in seconds) that the overlay controls are displayed.
  int get overlayControlsDisplayTime => throw _privateConstructorUsedError;

  /// Interval of vod playback controls.
  ///
  /// 0: 5s, 1: 10s, 2: 30s
  int get vodPlaybackIntervalIndex => throw _privateConstructorUsedError;

  /// Show custom group in video player overlay to navigate other videos.
  ///
  /// 0: false, 1: true
  int get showGroupInVideoPlayer => throw _privateConstructorUsedError;

  /// Default playback speed for VOD.
  ///
  /// See `PlaybackSpeeds` in `lib/src/common/constants/playback_speeds.dart` for actual values.
  int get vodPlaybackSpeedIndex => throw _privateConstructorUsedError;

  /// Serializes this StreamSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StreamSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreamSettingsCopyWith<StreamSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamSettingsCopyWith<$Res> {
  factory $StreamSettingsCopyWith(
          StreamSettings value, $Res Function(StreamSettings) then) =
      _$StreamSettingsCopyWithImpl<$Res, StreamSettings>;
  @useResult
  $Res call(
      {int resolutionIndex,
      int multiviewResolutionIndex,
      int vodResolutionIndex,
      int liveChatWindowIndex,
      int vodChatWindowIndex,
      int latencyIndex,
      int overlayControlsDisplayTime,
      int vodPlaybackIntervalIndex,
      int showGroupInVideoPlayer,
      int vodPlaybackSpeedIndex});
}

/// @nodoc
class _$StreamSettingsCopyWithImpl<$Res, $Val extends StreamSettings>
    implements $StreamSettingsCopyWith<$Res> {
  _$StreamSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreamSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolutionIndex = null,
    Object? multiviewResolutionIndex = null,
    Object? vodResolutionIndex = null,
    Object? liveChatWindowIndex = null,
    Object? vodChatWindowIndex = null,
    Object? latencyIndex = null,
    Object? overlayControlsDisplayTime = null,
    Object? vodPlaybackIntervalIndex = null,
    Object? showGroupInVideoPlayer = null,
    Object? vodPlaybackSpeedIndex = null,
  }) {
    return _then(_value.copyWith(
      resolutionIndex: null == resolutionIndex
          ? _value.resolutionIndex
          : resolutionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      multiviewResolutionIndex: null == multiviewResolutionIndex
          ? _value.multiviewResolutionIndex
          : multiviewResolutionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      vodResolutionIndex: null == vodResolutionIndex
          ? _value.vodResolutionIndex
          : vodResolutionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      liveChatWindowIndex: null == liveChatWindowIndex
          ? _value.liveChatWindowIndex
          : liveChatWindowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      vodChatWindowIndex: null == vodChatWindowIndex
          ? _value.vodChatWindowIndex
          : vodChatWindowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      latencyIndex: null == latencyIndex
          ? _value.latencyIndex
          : latencyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      overlayControlsDisplayTime: null == overlayControlsDisplayTime
          ? _value.overlayControlsDisplayTime
          : overlayControlsDisplayTime // ignore: cast_nullable_to_non_nullable
              as int,
      vodPlaybackIntervalIndex: null == vodPlaybackIntervalIndex
          ? _value.vodPlaybackIntervalIndex
          : vodPlaybackIntervalIndex // ignore: cast_nullable_to_non_nullable
              as int,
      showGroupInVideoPlayer: null == showGroupInVideoPlayer
          ? _value.showGroupInVideoPlayer
          : showGroupInVideoPlayer // ignore: cast_nullable_to_non_nullable
              as int,
      vodPlaybackSpeedIndex: null == vodPlaybackSpeedIndex
          ? _value.vodPlaybackSpeedIndex
          : vodPlaybackSpeedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreamSettingsImplCopyWith<$Res>
    implements $StreamSettingsCopyWith<$Res> {
  factory _$$StreamSettingsImplCopyWith(_$StreamSettingsImpl value,
          $Res Function(_$StreamSettingsImpl) then) =
      __$$StreamSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int resolutionIndex,
      int multiviewResolutionIndex,
      int vodResolutionIndex,
      int liveChatWindowIndex,
      int vodChatWindowIndex,
      int latencyIndex,
      int overlayControlsDisplayTime,
      int vodPlaybackIntervalIndex,
      int showGroupInVideoPlayer,
      int vodPlaybackSpeedIndex});
}

/// @nodoc
class __$$StreamSettingsImplCopyWithImpl<$Res>
    extends _$StreamSettingsCopyWithImpl<$Res, _$StreamSettingsImpl>
    implements _$$StreamSettingsImplCopyWith<$Res> {
  __$$StreamSettingsImplCopyWithImpl(
      _$StreamSettingsImpl _value, $Res Function(_$StreamSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StreamSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolutionIndex = null,
    Object? multiviewResolutionIndex = null,
    Object? vodResolutionIndex = null,
    Object? liveChatWindowIndex = null,
    Object? vodChatWindowIndex = null,
    Object? latencyIndex = null,
    Object? overlayControlsDisplayTime = null,
    Object? vodPlaybackIntervalIndex = null,
    Object? showGroupInVideoPlayer = null,
    Object? vodPlaybackSpeedIndex = null,
  }) {
    return _then(_$StreamSettingsImpl(
      resolutionIndex: null == resolutionIndex
          ? _value.resolutionIndex
          : resolutionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      multiviewResolutionIndex: null == multiviewResolutionIndex
          ? _value.multiviewResolutionIndex
          : multiviewResolutionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      vodResolutionIndex: null == vodResolutionIndex
          ? _value.vodResolutionIndex
          : vodResolutionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      liveChatWindowIndex: null == liveChatWindowIndex
          ? _value.liveChatWindowIndex
          : liveChatWindowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      vodChatWindowIndex: null == vodChatWindowIndex
          ? _value.vodChatWindowIndex
          : vodChatWindowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      latencyIndex: null == latencyIndex
          ? _value.latencyIndex
          : latencyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      overlayControlsDisplayTime: null == overlayControlsDisplayTime
          ? _value.overlayControlsDisplayTime
          : overlayControlsDisplayTime // ignore: cast_nullable_to_non_nullable
              as int,
      vodPlaybackIntervalIndex: null == vodPlaybackIntervalIndex
          ? _value.vodPlaybackIntervalIndex
          : vodPlaybackIntervalIndex // ignore: cast_nullable_to_non_nullable
              as int,
      showGroupInVideoPlayer: null == showGroupInVideoPlayer
          ? _value.showGroupInVideoPlayer
          : showGroupInVideoPlayer // ignore: cast_nullable_to_non_nullable
              as int,
      vodPlaybackSpeedIndex: null == vodPlaybackSpeedIndex
          ? _value.vodPlaybackSpeedIndex
          : vodPlaybackSpeedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreamSettingsImpl implements _StreamSettings {
  const _$StreamSettingsImpl(
      {required this.resolutionIndex,
      required this.multiviewResolutionIndex,
      required this.vodResolutionIndex,
      required this.liveChatWindowIndex,
      required this.vodChatWindowIndex,
      required this.latencyIndex,
      required this.overlayControlsDisplayTime,
      required this.vodPlaybackIntervalIndex,
      required this.showGroupInVideoPlayer,
      required this.vodPlaybackSpeedIndex});

  factory _$StreamSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreamSettingsImplFromJson(json);

  /// The index of default resolution of single view live streaming.
  ///
  /// 0: 360p, 1: 480p, 2: 720p, 3: 1080p, 4: auto
  @override
  final int resolutionIndex;

  /// The index of default resolution of multi view live streaming.
  ///
  /// 0: 360p, 1: 480p, 2: 720p, 3: 1080p, 4: auto
  @override
  final int multiviewResolutionIndex;

  /// The index of default resolution of vod streaming.
  ///
  /// 0: 720p, 1: 1080p, 2: auto
  @override
  final int vodResolutionIndex;

  /// The index of default screen mode of single view live streaming.
  ///
  /// 0: off, 1: overlay, 2: side
  @override
  final int liveChatWindowIndex;

  /// The index of default screen mode of vod streaming.
  ///
  /// 0: off, 1: overlay, 2: side
  @override
  final int vodChatWindowIndex;

  /// 0: HLS, 1:LLHLS
  @override
  final int latencyIndex;

  /// The time(in seconds) that the overlay controls are displayed.
  @override
  final int overlayControlsDisplayTime;

  /// Interval of vod playback controls.
  ///
  /// 0: 5s, 1: 10s, 2: 30s
  @override
  final int vodPlaybackIntervalIndex;

  /// Show custom group in video player overlay to navigate other videos.
  ///
  /// 0: false, 1: true
  @override
  final int showGroupInVideoPlayer;

  /// Default playback speed for VOD.
  ///
  /// See `PlaybackSpeeds` in `lib/src/common/constants/playback_speeds.dart` for actual values.
  @override
  final int vodPlaybackSpeedIndex;

  @override
  String toString() {
    return 'StreamSettings(resolutionIndex: $resolutionIndex, multiviewResolutionIndex: $multiviewResolutionIndex, vodResolutionIndex: $vodResolutionIndex, liveChatWindowIndex: $liveChatWindowIndex, vodChatWindowIndex: $vodChatWindowIndex, latencyIndex: $latencyIndex, overlayControlsDisplayTime: $overlayControlsDisplayTime, vodPlaybackIntervalIndex: $vodPlaybackIntervalIndex, showGroupInVideoPlayer: $showGroupInVideoPlayer, vodPlaybackSpeedIndex: $vodPlaybackSpeedIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamSettingsImpl &&
            (identical(other.resolutionIndex, resolutionIndex) ||
                other.resolutionIndex == resolutionIndex) &&
            (identical(
                    other.multiviewResolutionIndex, multiviewResolutionIndex) ||
                other.multiviewResolutionIndex == multiviewResolutionIndex) &&
            (identical(other.vodResolutionIndex, vodResolutionIndex) ||
                other.vodResolutionIndex == vodResolutionIndex) &&
            (identical(other.liveChatWindowIndex, liveChatWindowIndex) ||
                other.liveChatWindowIndex == liveChatWindowIndex) &&
            (identical(other.vodChatWindowIndex, vodChatWindowIndex) ||
                other.vodChatWindowIndex == vodChatWindowIndex) &&
            (identical(other.latencyIndex, latencyIndex) ||
                other.latencyIndex == latencyIndex) &&
            (identical(other.overlayControlsDisplayTime,
                    overlayControlsDisplayTime) ||
                other.overlayControlsDisplayTime ==
                    overlayControlsDisplayTime) &&
            (identical(
                    other.vodPlaybackIntervalIndex, vodPlaybackIntervalIndex) ||
                other.vodPlaybackIntervalIndex == vodPlaybackIntervalIndex) &&
            (identical(other.showGroupInVideoPlayer, showGroupInVideoPlayer) ||
                other.showGroupInVideoPlayer == showGroupInVideoPlayer) &&
            (identical(other.vodPlaybackSpeedIndex, vodPlaybackSpeedIndex) ||
                other.vodPlaybackSpeedIndex == vodPlaybackSpeedIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      resolutionIndex,
      multiviewResolutionIndex,
      vodResolutionIndex,
      liveChatWindowIndex,
      vodChatWindowIndex,
      latencyIndex,
      overlayControlsDisplayTime,
      vodPlaybackIntervalIndex,
      showGroupInVideoPlayer,
      vodPlaybackSpeedIndex);

  /// Create a copy of StreamSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamSettingsImplCopyWith<_$StreamSettingsImpl> get copyWith =>
      __$$StreamSettingsImplCopyWithImpl<_$StreamSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreamSettingsImplToJson(
      this,
    );
  }
}

abstract class _StreamSettings implements StreamSettings {
  const factory _StreamSettings(
      {required final int resolutionIndex,
      required final int multiviewResolutionIndex,
      required final int vodResolutionIndex,
      required final int liveChatWindowIndex,
      required final int vodChatWindowIndex,
      required final int latencyIndex,
      required final int overlayControlsDisplayTime,
      required final int vodPlaybackIntervalIndex,
      required final int showGroupInVideoPlayer,
      required final int vodPlaybackSpeedIndex}) = _$StreamSettingsImpl;

  factory _StreamSettings.fromJson(Map<String, dynamic> json) =
      _$StreamSettingsImpl.fromJson;

  /// The index of default resolution of single view live streaming.
  ///
  /// 0: 360p, 1: 480p, 2: 720p, 3: 1080p, 4: auto
  @override
  int get resolutionIndex;

  /// The index of default resolution of multi view live streaming.
  ///
  /// 0: 360p, 1: 480p, 2: 720p, 3: 1080p, 4: auto
  @override
  int get multiviewResolutionIndex;

  /// The index of default resolution of vod streaming.
  ///
  /// 0: 720p, 1: 1080p, 2: auto
  @override
  int get vodResolutionIndex;

  /// The index of default screen mode of single view live streaming.
  ///
  /// 0: off, 1: overlay, 2: side
  @override
  int get liveChatWindowIndex;

  /// The index of default screen mode of vod streaming.
  ///
  /// 0: off, 1: overlay, 2: side
  @override
  int get vodChatWindowIndex;

  /// 0: HLS, 1:LLHLS
  @override
  int get latencyIndex;

  /// The time(in seconds) that the overlay controls are displayed.
  @override
  int get overlayControlsDisplayTime;

  /// Interval of vod playback controls.
  ///
  /// 0: 5s, 1: 10s, 2: 30s
  @override
  int get vodPlaybackIntervalIndex;

  /// Show custom group in video player overlay to navigate other videos.
  ///
  /// 0: false, 1: true
  @override
  int get showGroupInVideoPlayer;

  /// Default playback speed for VOD.
  ///
  /// See `PlaybackSpeeds` in `lib/src/common/constants/playback_speeds.dart` for actual values.
  @override
  int get vodPlaybackSpeedIndex;

  /// Create a copy of StreamSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreamSettingsImplCopyWith<_$StreamSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
