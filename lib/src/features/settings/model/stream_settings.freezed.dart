// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StreamSettings {
  int get resolutionIndex;
  int get multiviewResolutionIndex;
  int get vodResolutionIndex;
  int get liveChatWindowIndex;
  int get vodChatWindowIndex;
  int get latencyIndex;
  int get overlayControlsDisplayTime;
  int get vodPlaybackIntervalIndex;
  int get showGroupInVideoPlayer;

  /// Create a copy of StreamSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StreamSettingsCopyWith<StreamSettings> get copyWith =>
      _$StreamSettingsCopyWithImpl<StreamSettings>(
          this as StreamSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StreamSettings &&
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
                other.showGroupInVideoPlayer == showGroupInVideoPlayer));
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
      showGroupInVideoPlayer);

  @override
  String toString() {
    return 'StreamSettings(resolutionIndex: $resolutionIndex, multiviewResolutionIndex: $multiviewResolutionIndex, vodResolutionIndex: $vodResolutionIndex, liveChatWindowIndex: $liveChatWindowIndex, vodChatWindowIndex: $vodChatWindowIndex, latencyIndex: $latencyIndex, overlayControlsDisplayTime: $overlayControlsDisplayTime, vodPlaybackIntervalIndex: $vodPlaybackIntervalIndex, showGroupInVideoPlayer: $showGroupInVideoPlayer)';
  }
}

/// @nodoc
abstract mixin class $StreamSettingsCopyWith<$Res> {
  factory $StreamSettingsCopyWith(
          StreamSettings value, $Res Function(StreamSettings) _then) =
      _$StreamSettingsCopyWithImpl;
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
      int showGroupInVideoPlayer});
}

/// @nodoc
class _$StreamSettingsCopyWithImpl<$Res>
    implements $StreamSettingsCopyWith<$Res> {
  _$StreamSettingsCopyWithImpl(this._self, this._then);

  final StreamSettings _self;
  final $Res Function(StreamSettings) _then;

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
  }) {
    return _then(StreamSettings(
      resolutionIndex: null == resolutionIndex
          ? _self.resolutionIndex
          : resolutionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      multiviewResolutionIndex: null == multiviewResolutionIndex
          ? _self.multiviewResolutionIndex
          : multiviewResolutionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      vodResolutionIndex: null == vodResolutionIndex
          ? _self.vodResolutionIndex
          : vodResolutionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      liveChatWindowIndex: null == liveChatWindowIndex
          ? _self.liveChatWindowIndex
          : liveChatWindowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      vodChatWindowIndex: null == vodChatWindowIndex
          ? _self.vodChatWindowIndex
          : vodChatWindowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      latencyIndex: null == latencyIndex
          ? _self.latencyIndex
          : latencyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      overlayControlsDisplayTime: null == overlayControlsDisplayTime
          ? _self.overlayControlsDisplayTime
          : overlayControlsDisplayTime // ignore: cast_nullable_to_non_nullable
              as int,
      vodPlaybackIntervalIndex: null == vodPlaybackIntervalIndex
          ? _self.vodPlaybackIntervalIndex
          : vodPlaybackIntervalIndex // ignore: cast_nullable_to_non_nullable
              as int,
      showGroupInVideoPlayer: null == showGroupInVideoPlayer
          ? _self.showGroupInVideoPlayer
          : showGroupInVideoPlayer // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
