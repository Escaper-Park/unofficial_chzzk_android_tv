// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_rewind_playback_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveRewindPlaybackJson {
  Meta get meta;
  List<Map<String, String>> get api;
  List<Media> get media;

  /// Create a copy of LiveRewindPlaybackJson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveRewindPlaybackJsonCopyWith<LiveRewindPlaybackJson> get copyWith =>
      _$LiveRewindPlaybackJsonCopyWithImpl<LiveRewindPlaybackJson>(
          this as LiveRewindPlaybackJson, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveRewindPlaybackJson &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other.api, api) &&
            const DeepCollectionEquality().equals(other.media, media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      meta,
      const DeepCollectionEquality().hash(api),
      const DeepCollectionEquality().hash(media));

  @override
  String toString() {
    return 'LiveRewindPlaybackJson(meta: $meta, api: $api, media: $media)';
  }
}

/// @nodoc
abstract mixin class $LiveRewindPlaybackJsonCopyWith<$Res> {
  factory $LiveRewindPlaybackJsonCopyWith(LiveRewindPlaybackJson value,
          $Res Function(LiveRewindPlaybackJson) _then) =
      _$LiveRewindPlaybackJsonCopyWithImpl;
  @useResult
  $Res call({Meta meta, List<Map<String, String>> api, List<Media> media});
}

/// @nodoc
class _$LiveRewindPlaybackJsonCopyWithImpl<$Res>
    implements $LiveRewindPlaybackJsonCopyWith<$Res> {
  _$LiveRewindPlaybackJsonCopyWithImpl(this._self, this._then);

  final LiveRewindPlaybackJson _self;
  final $Res Function(LiveRewindPlaybackJson) _then;

  /// Create a copy of LiveRewindPlaybackJson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? api = null,
    Object? media = null,
  }) {
    return _then(LiveRewindPlaybackJson(
      meta: null == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
      api: null == api
          ? _self.api
          : api // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      media: null == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<Media>,
    ));
  }
}

// dart format on
