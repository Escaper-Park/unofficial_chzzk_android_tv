// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vod _$VodFromJson(Map<String, dynamic> json) {
  return _Vod.fromJson(json);
}

/// @nodoc
mixin _$Vod {
  int get videoNo => throw _privateConstructorUsedError;
  String? get videoId => throw _privateConstructorUsedError;
  String get videoTitle => throw _privateConstructorUsedError;
  String? get videoType => throw _privateConstructorUsedError;
  String get publishDate => throw _privateConstructorUsedError;
  String? get thumbnailImageUrl => throw _privateConstructorUsedError;
  String? get trailerUrl => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get publishDateAt => throw _privateConstructorUsedError;
  String? get videoCategoryValue => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  Channel get channel => throw _privateConstructorUsedError;
  String? get inKey => throw _privateConstructorUsedError;
  String? get liveOpenDate => throw _privateConstructorUsedError;
  int? get readCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VodCopyWith<Vod> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodCopyWith<$Res> {
  factory $VodCopyWith(Vod value, $Res Function(Vod) then) =
      _$VodCopyWithImpl<$Res, Vod>;
  @useResult
  $Res call(
      {int videoNo,
      String? videoId,
      String videoTitle,
      String? videoType,
      String publishDate,
      String? thumbnailImageUrl,
      String? trailerUrl,
      int duration,
      int publishDateAt,
      String? videoCategoryValue,
      bool adult,
      Channel channel,
      String? inKey,
      String? liveOpenDate,
      int? readCount});

  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class _$VodCopyWithImpl<$Res, $Val extends Vod> implements $VodCopyWith<$Res> {
  _$VodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoNo = null,
    Object? videoId = freezed,
    Object? videoTitle = null,
    Object? videoType = freezed,
    Object? publishDate = null,
    Object? thumbnailImageUrl = freezed,
    Object? trailerUrl = freezed,
    Object? duration = null,
    Object? publishDateAt = null,
    Object? videoCategoryValue = freezed,
    Object? adult = null,
    Object? channel = null,
    Object? inKey = freezed,
    Object? liveOpenDate = freezed,
    Object? readCount = freezed,
  }) {
    return _then(_value.copyWith(
      videoNo: null == videoNo
          ? _value.videoNo
          : videoNo // ignore: cast_nullable_to_non_nullable
              as int,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoTitle: null == videoTitle
          ? _value.videoTitle
          : videoTitle // ignore: cast_nullable_to_non_nullable
              as String,
      videoType: freezed == videoType
          ? _value.videoType
          : videoType // ignore: cast_nullable_to_non_nullable
              as String?,
      publishDate: null == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImageUrl: freezed == thumbnailImageUrl
          ? _value.thumbnailImageUrl
          : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      trailerUrl: freezed == trailerUrl
          ? _value.trailerUrl
          : trailerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      publishDateAt: null == publishDateAt
          ? _value.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int,
      videoCategoryValue: freezed == videoCategoryValue
          ? _value.videoCategoryValue
          : videoCategoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
      inKey: freezed == inKey
          ? _value.inKey
          : inKey // ignore: cast_nullable_to_non_nullable
              as String?,
      liveOpenDate: freezed == liveOpenDate
          ? _value.liveOpenDate
          : liveOpenDate // ignore: cast_nullable_to_non_nullable
              as String?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChannelCopyWith<$Res> get channel {
    return $ChannelCopyWith<$Res>(_value.channel, (value) {
      return _then(_value.copyWith(channel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VodImplCopyWith<$Res> implements $VodCopyWith<$Res> {
  factory _$$VodImplCopyWith(_$VodImpl value, $Res Function(_$VodImpl) then) =
      __$$VodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int videoNo,
      String? videoId,
      String videoTitle,
      String? videoType,
      String publishDate,
      String? thumbnailImageUrl,
      String? trailerUrl,
      int duration,
      int publishDateAt,
      String? videoCategoryValue,
      bool adult,
      Channel channel,
      String? inKey,
      String? liveOpenDate,
      int? readCount});

  @override
  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class __$$VodImplCopyWithImpl<$Res> extends _$VodCopyWithImpl<$Res, _$VodImpl>
    implements _$$VodImplCopyWith<$Res> {
  __$$VodImplCopyWithImpl(_$VodImpl _value, $Res Function(_$VodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoNo = null,
    Object? videoId = freezed,
    Object? videoTitle = null,
    Object? videoType = freezed,
    Object? publishDate = null,
    Object? thumbnailImageUrl = freezed,
    Object? trailerUrl = freezed,
    Object? duration = null,
    Object? publishDateAt = null,
    Object? videoCategoryValue = freezed,
    Object? adult = null,
    Object? channel = null,
    Object? inKey = freezed,
    Object? liveOpenDate = freezed,
    Object? readCount = freezed,
  }) {
    return _then(_$VodImpl(
      videoNo: null == videoNo
          ? _value.videoNo
          : videoNo // ignore: cast_nullable_to_non_nullable
              as int,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoTitle: null == videoTitle
          ? _value.videoTitle
          : videoTitle // ignore: cast_nullable_to_non_nullable
              as String,
      videoType: freezed == videoType
          ? _value.videoType
          : videoType // ignore: cast_nullable_to_non_nullable
              as String?,
      publishDate: null == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImageUrl: freezed == thumbnailImageUrl
          ? _value.thumbnailImageUrl
          : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      trailerUrl: freezed == trailerUrl
          ? _value.trailerUrl
          : trailerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      publishDateAt: null == publishDateAt
          ? _value.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int,
      videoCategoryValue: freezed == videoCategoryValue
          ? _value.videoCategoryValue
          : videoCategoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
      inKey: freezed == inKey
          ? _value.inKey
          : inKey // ignore: cast_nullable_to_non_nullable
              as String?,
      liveOpenDate: freezed == liveOpenDate
          ? _value.liveOpenDate
          : liveOpenDate // ignore: cast_nullable_to_non_nullable
              as String?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VodImpl implements _Vod {
  const _$VodImpl(
      {required this.videoNo,
      required this.videoId,
      required this.videoTitle,
      required this.videoType,
      required this.publishDate,
      required this.thumbnailImageUrl,
      required this.trailerUrl,
      required this.duration,
      required this.publishDateAt,
      required this.videoCategoryValue,
      required this.adult,
      required this.channel,
      required this.inKey,
      required this.liveOpenDate,
      required this.readCount});

  factory _$VodImpl.fromJson(Map<String, dynamic> json) =>
      _$$VodImplFromJson(json);

  @override
  final int videoNo;
  @override
  final String? videoId;
  @override
  final String videoTitle;
  @override
  final String? videoType;
  @override
  final String publishDate;
  @override
  final String? thumbnailImageUrl;
  @override
  final String? trailerUrl;
  @override
  final int duration;
  @override
  final int publishDateAt;
  @override
  final String? videoCategoryValue;
  @override
  final bool adult;
  @override
  final Channel channel;
  @override
  final String? inKey;
  @override
  final String? liveOpenDate;
  @override
  final int? readCount;

  @override
  String toString() {
    return 'Vod(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, trailerUrl: $trailerUrl, duration: $duration, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, channel: $channel, inKey: $inKey, liveOpenDate: $liveOpenDate, readCount: $readCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodImpl &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.videoTitle, videoTitle) ||
                other.videoTitle == videoTitle) &&
            (identical(other.videoType, videoType) ||
                other.videoType == videoType) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            (identical(other.thumbnailImageUrl, thumbnailImageUrl) ||
                other.thumbnailImageUrl == thumbnailImageUrl) &&
            (identical(other.trailerUrl, trailerUrl) ||
                other.trailerUrl == trailerUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.videoCategoryValue, videoCategoryValue) ||
                other.videoCategoryValue == videoCategoryValue) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.inKey, inKey) || other.inKey == inKey) &&
            (identical(other.liveOpenDate, liveOpenDate) ||
                other.liveOpenDate == liveOpenDate) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoNo,
      videoId,
      videoTitle,
      videoType,
      publishDate,
      thumbnailImageUrl,
      trailerUrl,
      duration,
      publishDateAt,
      videoCategoryValue,
      adult,
      channel,
      inKey,
      liveOpenDate,
      readCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VodImplCopyWith<_$VodImpl> get copyWith =>
      __$$VodImplCopyWithImpl<_$VodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VodImplToJson(
      this,
    );
  }
}

abstract class _Vod implements Vod {
  const factory _Vod(
      {required final int videoNo,
      required final String? videoId,
      required final String videoTitle,
      required final String? videoType,
      required final String publishDate,
      required final String? thumbnailImageUrl,
      required final String? trailerUrl,
      required final int duration,
      required final int publishDateAt,
      required final String? videoCategoryValue,
      required final bool adult,
      required final Channel channel,
      required final String? inKey,
      required final String? liveOpenDate,
      required final int? readCount}) = _$VodImpl;

  factory _Vod.fromJson(Map<String, dynamic> json) = _$VodImpl.fromJson;

  @override
  int get videoNo;
  @override
  String? get videoId;
  @override
  String get videoTitle;
  @override
  String? get videoType;
  @override
  String get publishDate;
  @override
  String? get thumbnailImageUrl;
  @override
  String? get trailerUrl;
  @override
  int get duration;
  @override
  int get publishDateAt;
  @override
  String? get videoCategoryValue;
  @override
  bool get adult;
  @override
  Channel get channel;
  @override
  String? get inKey;
  @override
  String? get liveOpenDate;
  @override
  int? get readCount;
  @override
  @JsonKey(ignore: true)
  _$$VodImplCopyWith<_$VodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VodPage _$VodPageFromJson(Map<String, dynamic> json) {
  return _VodPage.fromJson(json);
}

/// @nodoc
mixin _$VodPage {
  int? get publishDateAt => throw _privateConstructorUsedError;
  int? get readCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VodPageCopyWith<VodPage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodPageCopyWith<$Res> {
  factory $VodPageCopyWith(VodPage value, $Res Function(VodPage) then) =
      _$VodPageCopyWithImpl<$Res, VodPage>;
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class _$VodPageCopyWithImpl<$Res, $Val extends VodPage>
    implements $VodPageCopyWith<$Res> {
  _$VodPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishDateAt = freezed,
    Object? readCount = freezed,
  }) {
    return _then(_value.copyWith(
      publishDateAt: freezed == publishDateAt
          ? _value.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VodPageImplCopyWith<$Res> implements $VodPageCopyWith<$Res> {
  factory _$$VodPageImplCopyWith(
          _$VodPageImpl value, $Res Function(_$VodPageImpl) then) =
      __$$VodPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class __$$VodPageImplCopyWithImpl<$Res>
    extends _$VodPageCopyWithImpl<$Res, _$VodPageImpl>
    implements _$$VodPageImplCopyWith<$Res> {
  __$$VodPageImplCopyWithImpl(
      _$VodPageImpl _value, $Res Function(_$VodPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishDateAt = freezed,
    Object? readCount = freezed,
  }) {
    return _then(_$VodPageImpl(
      publishDateAt: freezed == publishDateAt
          ? _value.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VodPageImpl implements _VodPage {
  _$VodPageImpl({required this.publishDateAt, required this.readCount});

  factory _$VodPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$VodPageImplFromJson(json);

  @override
  final int? publishDateAt;
  @override
  final int? readCount;

  @override
  String toString() {
    return 'VodPage(publishDateAt: $publishDateAt, readCount: $readCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodPageImpl &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, publishDateAt, readCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VodPageImplCopyWith<_$VodPageImpl> get copyWith =>
      __$$VodPageImplCopyWithImpl<_$VodPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VodPageImplToJson(
      this,
    );
  }
}

abstract class _VodPage implements VodPage {
  factory _VodPage(
      {required final int? publishDateAt,
      required final int? readCount}) = _$VodPageImpl;

  factory _VodPage.fromJson(Map<String, dynamic> json) = _$VodPageImpl.fromJson;

  @override
  int? get publishDateAt;
  @override
  int? get readCount;
  @override
  @JsonKey(ignore: true)
  _$$VodPageImplCopyWith<_$VodPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VodResponse {
  List<Vod>? get vods => throw _privateConstructorUsedError;
  VodPage? get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VodResponseCopyWith<VodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodResponseCopyWith<$Res> {
  factory $VodResponseCopyWith(
          VodResponse value, $Res Function(VodResponse) then) =
      _$VodResponseCopyWithImpl<$Res, VodResponse>;
  @useResult
  $Res call({List<Vod>? vods, VodPage? page});

  $VodPageCopyWith<$Res>? get page;
}

/// @nodoc
class _$VodResponseCopyWithImpl<$Res, $Val extends VodResponse>
    implements $VodResponseCopyWith<$Res> {
  _$VodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vods = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      vods: freezed == vods
          ? _value.vods
          : vods // ignore: cast_nullable_to_non_nullable
              as List<Vod>?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as VodPage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VodPageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $VodPageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VodResponseImplCopyWith<$Res>
    implements $VodResponseCopyWith<$Res> {
  factory _$$VodResponseImplCopyWith(
          _$VodResponseImpl value, $Res Function(_$VodResponseImpl) then) =
      __$$VodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Vod>? vods, VodPage? page});

  @override
  $VodPageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$VodResponseImplCopyWithImpl<$Res>
    extends _$VodResponseCopyWithImpl<$Res, _$VodResponseImpl>
    implements _$$VodResponseImplCopyWith<$Res> {
  __$$VodResponseImplCopyWithImpl(
      _$VodResponseImpl _value, $Res Function(_$VodResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vods = freezed,
    Object? page = freezed,
  }) {
    return _then(_$VodResponseImpl(
      vods: freezed == vods
          ? _value._vods
          : vods // ignore: cast_nullable_to_non_nullable
              as List<Vod>?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as VodPage?,
    ));
  }
}

/// @nodoc

class _$VodResponseImpl implements _VodResponse {
  _$VodResponseImpl({required final List<Vod>? vods, required this.page})
      : _vods = vods;

  final List<Vod>? _vods;
  @override
  List<Vod>? get vods {
    final value = _vods;
    if (value == null) return null;
    if (_vods is EqualUnmodifiableListView) return _vods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final VodPage? page;

  @override
  String toString() {
    return 'VodResponse(vods: $vods, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodResponseImpl &&
            const DeepCollectionEquality().equals(other._vods, _vods) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_vods), page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VodResponseImplCopyWith<_$VodResponseImpl> get copyWith =>
      __$$VodResponseImplCopyWithImpl<_$VodResponseImpl>(this, _$identity);
}

abstract class _VodResponse implements VodResponse {
  factory _VodResponse(
      {required final List<Vod>? vods,
      required final VodPage? page}) = _$VodResponseImpl;

  @override
  List<Vod>? get vods;
  @override
  VodPage? get page;
  @override
  @JsonKey(ignore: true)
  _$$VodResponseImplCopyWith<_$VodResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
