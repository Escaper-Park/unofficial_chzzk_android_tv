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
  String get videoType => throw _privateConstructorUsedError;
  String get publishDate => throw _privateConstructorUsedError;
  String? get thumbnailImageUrl => throw _privateConstructorUsedError;
  String? get trailerUrl => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get readCount => throw _privateConstructorUsedError;
  int get publishDateAt => throw _privateConstructorUsedError;
  String? get categoryType => throw _privateConstructorUsedError;
  String? get videoCategory => throw _privateConstructorUsedError;
  String? get videoCategoryValue => throw _privateConstructorUsedError;
  bool? get exposure => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  bool? get clipActive => throw _privateConstructorUsedError;
  int? get livePv =>
      throw _privateConstructorUsedError; // accumulated live count
  List<String>? get tags => throw _privateConstructorUsedError;
  Channel? get channel => throw _privateConstructorUsedError;
  String? get blindType => throw _privateConstructorUsedError;
  int? get watchTimeline =>
      throw _privateConstructorUsedError; // user last seen
/* vod detail*/
  bool? get paidPromotion => throw _privateConstructorUsedError;
  String? get inKey => throw _privateConstructorUsedError;
  String? get liveOpenDate => throw _privateConstructorUsedError;
  String? get vodStatus => throw _privateConstructorUsedError;
  @LiveRewindPlaybackConverter()
  LiveRewindPlaybackJson? get liveRewindPlaybackJson =>
      throw _privateConstructorUsedError;
  String? get userAdultStatus => throw _privateConstructorUsedError;
  bool? get videoChatEnabled => throw _privateConstructorUsedError;
  String? get videoChatChannelId => throw _privateConstructorUsedError;

  /// Serializes this Vod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      String videoType,
      String publishDate,
      String? thumbnailImageUrl,
      String? trailerUrl,
      int duration,
      int readCount,
      int publishDateAt,
      String? categoryType,
      String? videoCategory,
      String? videoCategoryValue,
      bool? exposure,
      bool adult,
      bool? clipActive,
      int? livePv,
      List<String>? tags,
      Channel? channel,
      String? blindType,
      int? watchTimeline,
      bool? paidPromotion,
      String? inKey,
      String? liveOpenDate,
      String? vodStatus,
      @LiveRewindPlaybackConverter()
      LiveRewindPlaybackJson? liveRewindPlaybackJson,
      String? userAdultStatus,
      bool? videoChatEnabled,
      String? videoChatChannelId});

  $ChannelCopyWith<$Res>? get channel;
  $LiveRewindPlaybackJsonCopyWith<$Res>? get liveRewindPlaybackJson;
}

/// @nodoc
class _$VodCopyWithImpl<$Res, $Val extends Vod> implements $VodCopyWith<$Res> {
  _$VodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoNo = null,
    Object? videoId = freezed,
    Object? videoTitle = null,
    Object? videoType = null,
    Object? publishDate = null,
    Object? thumbnailImageUrl = freezed,
    Object? trailerUrl = freezed,
    Object? duration = null,
    Object? readCount = null,
    Object? publishDateAt = null,
    Object? categoryType = freezed,
    Object? videoCategory = freezed,
    Object? videoCategoryValue = freezed,
    Object? exposure = freezed,
    Object? adult = null,
    Object? clipActive = freezed,
    Object? livePv = freezed,
    Object? tags = freezed,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchTimeline = freezed,
    Object? paidPromotion = freezed,
    Object? inKey = freezed,
    Object? liveOpenDate = freezed,
    Object? vodStatus = freezed,
    Object? liveRewindPlaybackJson = freezed,
    Object? userAdultStatus = freezed,
    Object? videoChatEnabled = freezed,
    Object? videoChatChannelId = freezed,
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
      videoType: null == videoType
          ? _value.videoType
          : videoType // ignore: cast_nullable_to_non_nullable
              as String,
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
      readCount: null == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int,
      publishDateAt: null == publishDateAt
          ? _value.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      videoCategory: freezed == videoCategory
          ? _value.videoCategory
          : videoCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      videoCategoryValue: freezed == videoCategoryValue
          ? _value.videoCategoryValue
          : videoCategoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      exposure: freezed == exposure
          ? _value.exposure
          : exposure // ignore: cast_nullable_to_non_nullable
              as bool?,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      clipActive: freezed == clipActive
          ? _value.clipActive
          : clipActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      livePv: freezed == livePv
          ? _value.livePv
          : livePv // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      blindType: freezed == blindType
          ? _value.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
      watchTimeline: freezed == watchTimeline
          ? _value.watchTimeline
          : watchTimeline // ignore: cast_nullable_to_non_nullable
              as int?,
      paidPromotion: freezed == paidPromotion
          ? _value.paidPromotion
          : paidPromotion // ignore: cast_nullable_to_non_nullable
              as bool?,
      inKey: freezed == inKey
          ? _value.inKey
          : inKey // ignore: cast_nullable_to_non_nullable
              as String?,
      liveOpenDate: freezed == liveOpenDate
          ? _value.liveOpenDate
          : liveOpenDate // ignore: cast_nullable_to_non_nullable
              as String?,
      vodStatus: freezed == vodStatus
          ? _value.vodStatus
          : vodStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      liveRewindPlaybackJson: freezed == liveRewindPlaybackJson
          ? _value.liveRewindPlaybackJson
          : liveRewindPlaybackJson // ignore: cast_nullable_to_non_nullable
              as LiveRewindPlaybackJson?,
      userAdultStatus: freezed == userAdultStatus
          ? _value.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      videoChatEnabled: freezed == videoChatEnabled
          ? _value.videoChatEnabled
          : videoChatEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      videoChatChannelId: freezed == videoChatChannelId
          ? _value.videoChatChannelId
          : videoChatChannelId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Vod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelCopyWith<$Res>? get channel {
    if (_value.channel == null) {
      return null;
    }

    return $ChannelCopyWith<$Res>(_value.channel!, (value) {
      return _then(_value.copyWith(channel: value) as $Val);
    });
  }

  /// Create a copy of Vod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveRewindPlaybackJsonCopyWith<$Res>? get liveRewindPlaybackJson {
    if (_value.liveRewindPlaybackJson == null) {
      return null;
    }

    return $LiveRewindPlaybackJsonCopyWith<$Res>(_value.liveRewindPlaybackJson!,
        (value) {
      return _then(_value.copyWith(liveRewindPlaybackJson: value) as $Val);
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
      String videoType,
      String publishDate,
      String? thumbnailImageUrl,
      String? trailerUrl,
      int duration,
      int readCount,
      int publishDateAt,
      String? categoryType,
      String? videoCategory,
      String? videoCategoryValue,
      bool? exposure,
      bool adult,
      bool? clipActive,
      int? livePv,
      List<String>? tags,
      Channel? channel,
      String? blindType,
      int? watchTimeline,
      bool? paidPromotion,
      String? inKey,
      String? liveOpenDate,
      String? vodStatus,
      @LiveRewindPlaybackConverter()
      LiveRewindPlaybackJson? liveRewindPlaybackJson,
      String? userAdultStatus,
      bool? videoChatEnabled,
      String? videoChatChannelId});

  @override
  $ChannelCopyWith<$Res>? get channel;
  @override
  $LiveRewindPlaybackJsonCopyWith<$Res>? get liveRewindPlaybackJson;
}

/// @nodoc
class __$$VodImplCopyWithImpl<$Res> extends _$VodCopyWithImpl<$Res, _$VodImpl>
    implements _$$VodImplCopyWith<$Res> {
  __$$VodImplCopyWithImpl(_$VodImpl _value, $Res Function(_$VodImpl) _then)
      : super(_value, _then);

  /// Create a copy of Vod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoNo = null,
    Object? videoId = freezed,
    Object? videoTitle = null,
    Object? videoType = null,
    Object? publishDate = null,
    Object? thumbnailImageUrl = freezed,
    Object? trailerUrl = freezed,
    Object? duration = null,
    Object? readCount = null,
    Object? publishDateAt = null,
    Object? categoryType = freezed,
    Object? videoCategory = freezed,
    Object? videoCategoryValue = freezed,
    Object? exposure = freezed,
    Object? adult = null,
    Object? clipActive = freezed,
    Object? livePv = freezed,
    Object? tags = freezed,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchTimeline = freezed,
    Object? paidPromotion = freezed,
    Object? inKey = freezed,
    Object? liveOpenDate = freezed,
    Object? vodStatus = freezed,
    Object? liveRewindPlaybackJson = freezed,
    Object? userAdultStatus = freezed,
    Object? videoChatEnabled = freezed,
    Object? videoChatChannelId = freezed,
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
      videoType: null == videoType
          ? _value.videoType
          : videoType // ignore: cast_nullable_to_non_nullable
              as String,
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
      readCount: null == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int,
      publishDateAt: null == publishDateAt
          ? _value.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      videoCategory: freezed == videoCategory
          ? _value.videoCategory
          : videoCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      videoCategoryValue: freezed == videoCategoryValue
          ? _value.videoCategoryValue
          : videoCategoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      exposure: freezed == exposure
          ? _value.exposure
          : exposure // ignore: cast_nullable_to_non_nullable
              as bool?,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      clipActive: freezed == clipActive
          ? _value.clipActive
          : clipActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      livePv: freezed == livePv
          ? _value.livePv
          : livePv // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      blindType: freezed == blindType
          ? _value.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
      watchTimeline: freezed == watchTimeline
          ? _value.watchTimeline
          : watchTimeline // ignore: cast_nullable_to_non_nullable
              as int?,
      paidPromotion: freezed == paidPromotion
          ? _value.paidPromotion
          : paidPromotion // ignore: cast_nullable_to_non_nullable
              as bool?,
      inKey: freezed == inKey
          ? _value.inKey
          : inKey // ignore: cast_nullable_to_non_nullable
              as String?,
      liveOpenDate: freezed == liveOpenDate
          ? _value.liveOpenDate
          : liveOpenDate // ignore: cast_nullable_to_non_nullable
              as String?,
      vodStatus: freezed == vodStatus
          ? _value.vodStatus
          : vodStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      liveRewindPlaybackJson: freezed == liveRewindPlaybackJson
          ? _value.liveRewindPlaybackJson
          : liveRewindPlaybackJson // ignore: cast_nullable_to_non_nullable
              as LiveRewindPlaybackJson?,
      userAdultStatus: freezed == userAdultStatus
          ? _value.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      videoChatEnabled: freezed == videoChatEnabled
          ? _value.videoChatEnabled
          : videoChatEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      videoChatChannelId: freezed == videoChatChannelId
          ? _value.videoChatChannelId
          : videoChatChannelId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VodImpl implements _Vod {
  const _$VodImpl(
      {required this.videoNo,
      this.videoId,
      required this.videoTitle,
      required this.videoType,
      required this.publishDate,
      this.thumbnailImageUrl,
      this.trailerUrl,
      required this.duration,
      required this.readCount,
      required this.publishDateAt,
      this.categoryType,
      this.videoCategory,
      this.videoCategoryValue,
      this.exposure,
      required this.adult,
      this.clipActive,
      this.livePv,
      final List<String>? tags,
      this.channel,
      this.blindType,
      this.watchTimeline,
      this.paidPromotion,
      this.inKey,
      this.liveOpenDate,
      this.vodStatus,
      @LiveRewindPlaybackConverter() this.liveRewindPlaybackJson,
      this.userAdultStatus,
      this.videoChatEnabled,
      this.videoChatChannelId})
      : _tags = tags;

  factory _$VodImpl.fromJson(Map<String, dynamic> json) =>
      _$$VodImplFromJson(json);

  @override
  final int videoNo;
  @override
  final String? videoId;
  @override
  final String videoTitle;
  @override
  final String videoType;
  @override
  final String publishDate;
  @override
  final String? thumbnailImageUrl;
  @override
  final String? trailerUrl;
  @override
  final int duration;
  @override
  final int readCount;
  @override
  final int publishDateAt;
  @override
  final String? categoryType;
  @override
  final String? videoCategory;
  @override
  final String? videoCategoryValue;
  @override
  final bool? exposure;
  @override
  final bool adult;
  @override
  final bool? clipActive;
  @override
  final int? livePv;
// accumulated live count
  final List<String>? _tags;
// accumulated live count
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Channel? channel;
  @override
  final String? blindType;
  @override
  final int? watchTimeline;
// user last seen
/* vod detail*/
  @override
  final bool? paidPromotion;
  @override
  final String? inKey;
  @override
  final String? liveOpenDate;
  @override
  final String? vodStatus;
  @override
  @LiveRewindPlaybackConverter()
  final LiveRewindPlaybackJson? liveRewindPlaybackJson;
  @override
  final String? userAdultStatus;
  @override
  final bool? videoChatEnabled;
  @override
  final String? videoChatChannelId;

  @override
  String toString() {
    return 'Vod(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, trailerUrl: $trailerUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryType: $categoryType, videoCategory: $videoCategory, videoCategoryValue: $videoCategoryValue, exposure: $exposure, adult: $adult, clipActive: $clipActive, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline, paidPromotion: $paidPromotion, inKey: $inKey, liveOpenDate: $liveOpenDate, vodStatus: $vodStatus, liveRewindPlaybackJson: $liveRewindPlaybackJson, userAdultStatus: $userAdultStatus, videoChatEnabled: $videoChatEnabled, videoChatChannelId: $videoChatChannelId)';
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
            (identical(other.readCount, readCount) ||
                other.readCount == readCount) &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.videoCategory, videoCategory) ||
                other.videoCategory == videoCategory) &&
            (identical(other.videoCategoryValue, videoCategoryValue) ||
                other.videoCategoryValue == videoCategoryValue) &&
            (identical(other.exposure, exposure) ||
                other.exposure == exposure) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.clipActive, clipActive) ||
                other.clipActive == clipActive) &&
            (identical(other.livePv, livePv) || other.livePv == livePv) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchTimeline, watchTimeline) ||
                other.watchTimeline == watchTimeline) &&
            (identical(other.paidPromotion, paidPromotion) ||
                other.paidPromotion == paidPromotion) &&
            (identical(other.inKey, inKey) || other.inKey == inKey) &&
            (identical(other.liveOpenDate, liveOpenDate) ||
                other.liveOpenDate == liveOpenDate) &&
            (identical(other.vodStatus, vodStatus) ||
                other.vodStatus == vodStatus) &&
            (identical(other.liveRewindPlaybackJson, liveRewindPlaybackJson) ||
                other.liveRewindPlaybackJson == liveRewindPlaybackJson) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.videoChatEnabled, videoChatEnabled) ||
                other.videoChatEnabled == videoChatEnabled) &&
            (identical(other.videoChatChannelId, videoChatChannelId) ||
                other.videoChatChannelId == videoChatChannelId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        videoNo,
        videoId,
        videoTitle,
        videoType,
        publishDate,
        thumbnailImageUrl,
        trailerUrl,
        duration,
        readCount,
        publishDateAt,
        categoryType,
        videoCategory,
        videoCategoryValue,
        exposure,
        adult,
        clipActive,
        livePv,
        const DeepCollectionEquality().hash(_tags),
        channel,
        blindType,
        watchTimeline,
        paidPromotion,
        inKey,
        liveOpenDate,
        vodStatus,
        liveRewindPlaybackJson,
        userAdultStatus,
        videoChatEnabled,
        videoChatChannelId
      ]);

  /// Create a copy of Vod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      final String? videoId,
      required final String videoTitle,
      required final String videoType,
      required final String publishDate,
      final String? thumbnailImageUrl,
      final String? trailerUrl,
      required final int duration,
      required final int readCount,
      required final int publishDateAt,
      final String? categoryType,
      final String? videoCategory,
      final String? videoCategoryValue,
      final bool? exposure,
      required final bool adult,
      final bool? clipActive,
      final int? livePv,
      final List<String>? tags,
      final Channel? channel,
      final String? blindType,
      final int? watchTimeline,
      final bool? paidPromotion,
      final String? inKey,
      final String? liveOpenDate,
      final String? vodStatus,
      @LiveRewindPlaybackConverter()
      final LiveRewindPlaybackJson? liveRewindPlaybackJson,
      final String? userAdultStatus,
      final bool? videoChatEnabled,
      final String? videoChatChannelId}) = _$VodImpl;

  factory _Vod.fromJson(Map<String, dynamic> json) = _$VodImpl.fromJson;

  @override
  int get videoNo;
  @override
  String? get videoId;
  @override
  String get videoTitle;
  @override
  String get videoType;
  @override
  String get publishDate;
  @override
  String? get thumbnailImageUrl;
  @override
  String? get trailerUrl;
  @override
  int get duration;
  @override
  int get readCount;
  @override
  int get publishDateAt;
  @override
  String? get categoryType;
  @override
  String? get videoCategory;
  @override
  String? get videoCategoryValue;
  @override
  bool? get exposure;
  @override
  bool get adult;
  @override
  bool? get clipActive;
  @override
  int? get livePv; // accumulated live count
  @override
  List<String>? get tags;
  @override
  Channel? get channel;
  @override
  String? get blindType;
  @override
  int? get watchTimeline; // user last seen
/* vod detail*/
  @override
  bool? get paidPromotion;
  @override
  String? get inKey;
  @override
  String? get liveOpenDate;
  @override
  String? get vodStatus;
  @override
  @LiveRewindPlaybackConverter()
  LiveRewindPlaybackJson? get liveRewindPlaybackJson;
  @override
  String? get userAdultStatus;
  @override
  bool? get videoChatEnabled;
  @override
  String? get videoChatChannelId;

  /// Create a copy of Vod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VodImplCopyWith<_$VodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
