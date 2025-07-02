// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_rewind_playback_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiveRewindPlaybackJson _$LiveRewindPlaybackJsonFromJson(
    Map<String, dynamic> json) {
  return _LiveRewindPlaybackJson.fromJson(json);
}

/// @nodoc
mixin _$LiveRewindPlaybackJson {
  Meta get meta => throw _privateConstructorUsedError;
  List<Map<String, String>> get api => throw _privateConstructorUsedError;
  List<Media> get media => throw _privateConstructorUsedError;

  /// Serializes this LiveRewindPlaybackJson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveRewindPlaybackJson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveRewindPlaybackJsonCopyWith<LiveRewindPlaybackJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveRewindPlaybackJsonCopyWith<$Res> {
  factory $LiveRewindPlaybackJsonCopyWith(LiveRewindPlaybackJson value,
          $Res Function(LiveRewindPlaybackJson) then) =
      _$LiveRewindPlaybackJsonCopyWithImpl<$Res, LiveRewindPlaybackJson>;
  @useResult
  $Res call({Meta meta, List<Map<String, String>> api, List<Media> media});

  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$LiveRewindPlaybackJsonCopyWithImpl<$Res,
        $Val extends LiveRewindPlaybackJson>
    implements $LiveRewindPlaybackJsonCopyWith<$Res> {
  _$LiveRewindPlaybackJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveRewindPlaybackJson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? api = null,
    Object? media = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
      api: null == api
          ? _value.api
          : api // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<Media>,
    ) as $Val);
  }

  /// Create a copy of LiveRewindPlaybackJson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiveRewindPlaybackJsonImplCopyWith<$Res>
    implements $LiveRewindPlaybackJsonCopyWith<$Res> {
  factory _$$LiveRewindPlaybackJsonImplCopyWith(
          _$LiveRewindPlaybackJsonImpl value,
          $Res Function(_$LiveRewindPlaybackJsonImpl) then) =
      __$$LiveRewindPlaybackJsonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Meta meta, List<Map<String, String>> api, List<Media> media});

  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$LiveRewindPlaybackJsonImplCopyWithImpl<$Res>
    extends _$LiveRewindPlaybackJsonCopyWithImpl<$Res,
        _$LiveRewindPlaybackJsonImpl>
    implements _$$LiveRewindPlaybackJsonImplCopyWith<$Res> {
  __$$LiveRewindPlaybackJsonImplCopyWithImpl(
      _$LiveRewindPlaybackJsonImpl _value,
      $Res Function(_$LiveRewindPlaybackJsonImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveRewindPlaybackJson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? api = null,
    Object? media = null,
  }) {
    return _then(_$LiveRewindPlaybackJsonImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
      api: null == api
          ? _value._api
          : api // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      media: null == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<Media>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveRewindPlaybackJsonImpl implements _LiveRewindPlaybackJson {
  const _$LiveRewindPlaybackJsonImpl(
      {required this.meta,
      required final List<Map<String, String>> api,
      required final List<Media> media})
      : _api = api,
        _media = media;

  factory _$LiveRewindPlaybackJsonImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveRewindPlaybackJsonImplFromJson(json);

  @override
  final Meta meta;
  final List<Map<String, String>> _api;
  @override
  List<Map<String, String>> get api {
    if (_api is EqualUnmodifiableListView) return _api;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_api);
  }

  final List<Media> _media;
  @override
  List<Media> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  @override
  String toString() {
    return 'LiveRewindPlaybackJson(meta: $meta, api: $api, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveRewindPlaybackJsonImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other._api, _api) &&
            const DeepCollectionEquality().equals(other._media, _media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      meta,
      const DeepCollectionEquality().hash(_api),
      const DeepCollectionEquality().hash(_media));

  /// Create a copy of LiveRewindPlaybackJson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveRewindPlaybackJsonImplCopyWith<_$LiveRewindPlaybackJsonImpl>
      get copyWith => __$$LiveRewindPlaybackJsonImplCopyWithImpl<
          _$LiveRewindPlaybackJsonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveRewindPlaybackJsonImplToJson(
      this,
    );
  }
}

abstract class _LiveRewindPlaybackJson implements LiveRewindPlaybackJson {
  const factory _LiveRewindPlaybackJson(
      {required final Meta meta,
      required final List<Map<String, String>> api,
      required final List<Media> media}) = _$LiveRewindPlaybackJsonImpl;

  factory _LiveRewindPlaybackJson.fromJson(Map<String, dynamic> json) =
      _$LiveRewindPlaybackJsonImpl.fromJson;

  @override
  Meta get meta;
  @override
  List<Map<String, String>> get api;
  @override
  List<Media> get media;

  /// Create a copy of LiveRewindPlaybackJson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveRewindPlaybackJsonImplCopyWith<_$LiveRewindPlaybackJsonImpl>
      get copyWith => throw _privateConstructorUsedError;
}
