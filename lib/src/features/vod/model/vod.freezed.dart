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
  bool get exposure => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  bool get clipActive => throw _privateConstructorUsedError;
  Channel get channel => throw _privateConstructorUsedError;
  Object? get blindType =>
      throw _privateConstructorUsedError; // accumulated live count
  int? get livePv => throw _privateConstructorUsedError; // Last seen timeline
  int? get watchTimeline => throw _privateConstructorUsedError; // Detailed
  bool? get paidPromotion => throw _privateConstructorUsedError;
  String? get inKey => throw _privateConstructorUsedError;
  String? get liveOpenDate => throw _privateConstructorUsedError;
  String? get vodStatus => throw _privateConstructorUsedError; // vod playback
  @LiveRewindPlaybackConverter()
  LiveRewindPlaybackJson? get liveRewindPlaybackJson =>
      throw _privateConstructorUsedError;
  String? get userAdultStatus => throw _privateConstructorUsedError;
  bool? get videoChatEnabled => throw _privateConstructorUsedError;
  String? get videoChatChannelId => throw _privateConstructorUsedError;

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
      bool exposure,
      bool adult,
      bool clipActive,
      Channel channel,
      Object? blindType,
      int? livePv,
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

  $ChannelCopyWith<$Res> get channel;
  $LiveRewindPlaybackJsonCopyWith<$Res>? get liveRewindPlaybackJson;
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
    Object? exposure = null,
    Object? adult = null,
    Object? clipActive = null,
    Object? channel = null,
    Object? blindType = freezed,
    Object? livePv = freezed,
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
      exposure: null == exposure
          ? _value.exposure
          : exposure // ignore: cast_nullable_to_non_nullable
              as bool,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      clipActive: null == clipActive
          ? _value.clipActive
          : clipActive // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
      blindType: freezed == blindType ? _value.blindType : blindType,
      livePv: freezed == livePv
          ? _value.livePv
          : livePv // ignore: cast_nullable_to_non_nullable
              as int?,
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

  @override
  @pragma('vm:prefer-inline')
  $ChannelCopyWith<$Res> get channel {
    return $ChannelCopyWith<$Res>(_value.channel, (value) {
      return _then(_value.copyWith(channel: value) as $Val);
    });
  }

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
      bool exposure,
      bool adult,
      bool clipActive,
      Channel channel,
      Object? blindType,
      int? livePv,
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
  $ChannelCopyWith<$Res> get channel;
  @override
  $LiveRewindPlaybackJsonCopyWith<$Res>? get liveRewindPlaybackJson;
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
    Object? exposure = null,
    Object? adult = null,
    Object? clipActive = null,
    Object? channel = null,
    Object? blindType = freezed,
    Object? livePv = freezed,
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
      exposure: null == exposure
          ? _value.exposure
          : exposure // ignore: cast_nullable_to_non_nullable
              as bool,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      clipActive: null == clipActive
          ? _value.clipActive
          : clipActive // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
      blindType: freezed == blindType ? _value.blindType : blindType,
      livePv: freezed == livePv
          ? _value.livePv
          : livePv // ignore: cast_nullable_to_non_nullable
              as int?,
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
  _$VodImpl(
      {required this.videoNo,
      required this.videoId,
      required this.videoTitle,
      required this.videoType,
      required this.publishDate,
      required this.thumbnailImageUrl,
      required this.trailerUrl,
      required this.duration,
      required this.readCount,
      required this.publishDateAt,
      required this.categoryType,
      required this.videoCategory,
      required this.videoCategoryValue,
      required this.exposure,
      required this.adult,
      required this.clipActive,
      required this.channel,
      required this.blindType,
      required this.livePv,
      required this.watchTimeline,
      required this.paidPromotion,
      required this.inKey,
      required this.liveOpenDate,
      required this.vodStatus,
      @LiveRewindPlaybackConverter() required this.liveRewindPlaybackJson,
      required this.userAdultStatus,
      required this.videoChatEnabled,
      required this.videoChatChannelId});

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
  final bool exposure;
  @override
  final bool adult;
  @override
  final bool clipActive;
  @override
  final Channel channel;
  @override
  final Object? blindType;
// accumulated live count
  @override
  final int? livePv;
// Last seen timeline
  @override
  final int? watchTimeline;
// Detailed
  @override
  final bool? paidPromotion;
  @override
  final String? inKey;
  @override
  final String? liveOpenDate;
  @override
  final String? vodStatus;
// vod playback
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
    return 'Vod(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, trailerUrl: $trailerUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryType: $categoryType, videoCategory: $videoCategory, videoCategoryValue: $videoCategoryValue, exposure: $exposure, adult: $adult, clipActive: $clipActive, channel: $channel, blindType: $blindType, livePv: $livePv, watchTimeline: $watchTimeline, paidPromotion: $paidPromotion, inKey: $inKey, liveOpenDate: $liveOpenDate, vodStatus: $vodStatus, liveRewindPlaybackJson: $liveRewindPlaybackJson, userAdultStatus: $userAdultStatus, videoChatEnabled: $videoChatEnabled, videoChatChannelId: $videoChatChannelId)';
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
            (identical(other.channel, channel) || other.channel == channel) &&
            const DeepCollectionEquality().equals(other.blindType, blindType) &&
            (identical(other.livePv, livePv) || other.livePv == livePv) &&
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

  @JsonKey(ignore: true)
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
        channel,
        const DeepCollectionEquality().hash(blindType),
        livePv,
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
  factory _Vod(
      {required final int videoNo,
      required final String? videoId,
      required final String videoTitle,
      required final String videoType,
      required final String publishDate,
      required final String? thumbnailImageUrl,
      required final String? trailerUrl,
      required final int duration,
      required final int readCount,
      required final int publishDateAt,
      required final String? categoryType,
      required final String? videoCategory,
      required final String? videoCategoryValue,
      required final bool exposure,
      required final bool adult,
      required final bool clipActive,
      required final Channel channel,
      required final Object? blindType,
      required final int? livePv,
      required final int? watchTimeline,
      required final bool? paidPromotion,
      required final String? inKey,
      required final String? liveOpenDate,
      required final String? vodStatus,
      @LiveRewindPlaybackConverter()
      required final LiveRewindPlaybackJson? liveRewindPlaybackJson,
      required final String? userAdultStatus,
      required final bool? videoChatEnabled,
      required final String? videoChatChannelId}) = _$VodImpl;

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
  bool get exposure;
  @override
  bool get adult;
  @override
  bool get clipActive;
  @override
  Channel get channel;
  @override
  Object? get blindType;
  @override // accumulated live count
  int? get livePv;
  @override // Last seen timeline
  int? get watchTimeline;
  @override // Detailed
  bool? get paidPromotion;
  @override
  String? get inKey;
  @override
  String? get liveOpenDate;
  @override
  String? get vodStatus;
  @override // vod playback
  @LiveRewindPlaybackConverter()
  LiveRewindPlaybackJson? get liveRewindPlaybackJson;
  @override
  String? get userAdultStatus;
  @override
  bool? get videoChatEnabled;
  @override
  String? get videoChatChannelId;
  @override
  @JsonKey(ignore: true)
  _$$VodImplCopyWith<_$VodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChannelVodResponse _$ChannelVodResponseFromJson(Map<String, dynamic> json) {
  return _ChannelVodResponse.fromJson(json);
}

/// @nodoc
mixin _$ChannelVodResponse {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  List<Vod> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelVodResponseCopyWith<ChannelVodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelVodResponseCopyWith<$Res> {
  factory $ChannelVodResponseCopyWith(
          ChannelVodResponse value, $Res Function(ChannelVodResponse) then) =
      _$ChannelVodResponseCopyWithImpl<$Res, ChannelVodResponse>;
  @useResult
  $Res call(
      {int page, int size, int totalCount, int totalPages, List<Vod> data});
}

/// @nodoc
class _$ChannelVodResponseCopyWithImpl<$Res, $Val extends ChannelVodResponse>
    implements $ChannelVodResponseCopyWith<$Res> {
  _$ChannelVodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelVodResponseImplCopyWith<$Res>
    implements $ChannelVodResponseCopyWith<$Res> {
  factory _$$ChannelVodResponseImplCopyWith(_$ChannelVodResponseImpl value,
          $Res Function(_$ChannelVodResponseImpl) then) =
      __$$ChannelVodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page, int size, int totalCount, int totalPages, List<Vod> data});
}

/// @nodoc
class __$$ChannelVodResponseImplCopyWithImpl<$Res>
    extends _$ChannelVodResponseCopyWithImpl<$Res, _$ChannelVodResponseImpl>
    implements _$$ChannelVodResponseImplCopyWith<$Res> {
  __$$ChannelVodResponseImplCopyWithImpl(_$ChannelVodResponseImpl _value,
      $Res Function(_$ChannelVodResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(_$ChannelVodResponseImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelVodResponseImpl implements _ChannelVodResponse {
  const _$ChannelVodResponseImpl(
      {required this.page,
      required this.size,
      required this.totalCount,
      required this.totalPages,
      required final List<Vod> data})
      : _data = data;

  factory _$ChannelVodResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelVodResponseImplFromJson(json);

  @override
  final int page;
  @override
  final int size;
  @override
  final int totalCount;
  @override
  final int totalPages;
  final List<Vod> _data;
  @override
  List<Vod> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ChannelVodResponse(page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelVodResponseImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, size, totalCount,
      totalPages, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelVodResponseImplCopyWith<_$ChannelVodResponseImpl> get copyWith =>
      __$$ChannelVodResponseImplCopyWithImpl<_$ChannelVodResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelVodResponseImplToJson(
      this,
    );
  }
}

abstract class _ChannelVodResponse implements ChannelVodResponse {
  const factory _ChannelVodResponse(
      {required final int page,
      required final int size,
      required final int totalCount,
      required final int totalPages,
      required final List<Vod> data}) = _$ChannelVodResponseImpl;

  factory _ChannelVodResponse.fromJson(Map<String, dynamic> json) =
      _$ChannelVodResponseImpl.fromJson;

  @override
  int get page;
  @override
  int get size;
  @override
  int get totalCount;
  @override
  int get totalPages;
  @override
  List<Vod> get data;
  @override
  @JsonKey(ignore: true)
  _$$ChannelVodResponseImplCopyWith<_$ChannelVodResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowingVod _$FollowingVodFromJson(Map<String, dynamic> json) {
  return _FollowingVod.fromJson(json);
}

/// @nodoc
mixin _$FollowingVod {
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  Vod get vod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingVodCopyWith<FollowingVod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingVodCopyWith<$Res> {
  factory $FollowingVodCopyWith(
          FollowingVod value, $Res Function(FollowingVod) then) =
      _$FollowingVodCopyWithImpl<$Res, FollowingVod>;
  @useResult
  $Res call({String type, @JsonKey(name: 'content') Vod vod});

  $VodCopyWith<$Res> get vod;
}

/// @nodoc
class _$FollowingVodCopyWithImpl<$Res, $Val extends FollowingVod>
    implements $FollowingVodCopyWith<$Res> {
  _$FollowingVodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? vod = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      vod: null == vod
          ? _value.vod
          : vod // ignore: cast_nullable_to_non_nullable
              as Vod,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VodCopyWith<$Res> get vod {
    return $VodCopyWith<$Res>(_value.vod, (value) {
      return _then(_value.copyWith(vod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowingVodImplCopyWith<$Res>
    implements $FollowingVodCopyWith<$Res> {
  factory _$$FollowingVodImplCopyWith(
          _$FollowingVodImpl value, $Res Function(_$FollowingVodImpl) then) =
      __$$FollowingVodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, @JsonKey(name: 'content') Vod vod});

  @override
  $VodCopyWith<$Res> get vod;
}

/// @nodoc
class __$$FollowingVodImplCopyWithImpl<$Res>
    extends _$FollowingVodCopyWithImpl<$Res, _$FollowingVodImpl>
    implements _$$FollowingVodImplCopyWith<$Res> {
  __$$FollowingVodImplCopyWithImpl(
      _$FollowingVodImpl _value, $Res Function(_$FollowingVodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? vod = null,
  }) {
    return _then(_$FollowingVodImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      vod: null == vod
          ? _value.vod
          : vod // ignore: cast_nullable_to_non_nullable
              as Vod,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingVodImpl implements _FollowingVod {
  const _$FollowingVodImpl(
      {required this.type, @JsonKey(name: 'content') required this.vod});

  factory _$FollowingVodImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingVodImplFromJson(json);

  @override
  final String type;
  @override
  @JsonKey(name: 'content')
  final Vod vod;

  @override
  String toString() {
    return 'FollowingVod(type: $type, vod: $vod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingVodImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.vod, vod) || other.vod == vod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, vod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingVodImplCopyWith<_$FollowingVodImpl> get copyWith =>
      __$$FollowingVodImplCopyWithImpl<_$FollowingVodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingVodImplToJson(
      this,
    );
  }
}

abstract class _FollowingVod implements FollowingVod {
  const factory _FollowingVod(
      {required final String type,
      @JsonKey(name: 'content') required final Vod vod}) = _$FollowingVodImpl;

  factory _FollowingVod.fromJson(Map<String, dynamic> json) =
      _$FollowingVodImpl.fromJson;

  @override
  String get type;
  @override
  @JsonKey(name: 'content')
  Vod get vod;
  @override
  @JsonKey(ignore: true)
  _$$FollowingVodImplCopyWith<_$FollowingVodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowingVodResponse _$FollowingVodResponseFromJson(Map<String, dynamic> json) {
  return _FollowingVodResponse.fromJson(json);
}

/// @nodoc
mixin _$FollowingVodResponse {
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'page', fromJson: _followingVodPageFromJson)
  int get next => throw _privateConstructorUsedError;
  List<FollowingVod> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingVodResponseCopyWith<FollowingVodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingVodResponseCopyWith<$Res> {
  factory $FollowingVodResponseCopyWith(FollowingVodResponse value,
          $Res Function(FollowingVodResponse) then) =
      _$FollowingVodResponseCopyWithImpl<$Res, FollowingVodResponse>;
  @useResult
  $Res call(
      {int size,
      @JsonKey(name: 'page', fromJson: _followingVodPageFromJson) int next,
      List<FollowingVod> data});
}

/// @nodoc
class _$FollowingVodResponseCopyWithImpl<$Res,
        $Val extends FollowingVodResponse>
    implements $FollowingVodResponseCopyWith<$Res> {
  _$FollowingVodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? next = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FollowingVod>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingVodResponseImplCopyWith<$Res>
    implements $FollowingVodResponseCopyWith<$Res> {
  factory _$$FollowingVodResponseImplCopyWith(_$FollowingVodResponseImpl value,
          $Res Function(_$FollowingVodResponseImpl) then) =
      __$$FollowingVodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int size,
      @JsonKey(name: 'page', fromJson: _followingVodPageFromJson) int next,
      List<FollowingVod> data});
}

/// @nodoc
class __$$FollowingVodResponseImplCopyWithImpl<$Res>
    extends _$FollowingVodResponseCopyWithImpl<$Res, _$FollowingVodResponseImpl>
    implements _$$FollowingVodResponseImplCopyWith<$Res> {
  __$$FollowingVodResponseImplCopyWithImpl(_$FollowingVodResponseImpl _value,
      $Res Function(_$FollowingVodResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? next = null,
    Object? data = null,
  }) {
    return _then(_$FollowingVodResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FollowingVod>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingVodResponseImpl implements _FollowingVodResponse {
  const _$FollowingVodResponseImpl(
      {required this.size,
      @JsonKey(name: 'page', fromJson: _followingVodPageFromJson)
      required this.next,
      required final List<FollowingVod> data})
      : _data = data;

  factory _$FollowingVodResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingVodResponseImplFromJson(json);

  @override
  final int size;
  @override
  @JsonKey(name: 'page', fromJson: _followingVodPageFromJson)
  final int next;
  final List<FollowingVod> _data;
  @override
  List<FollowingVod> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FollowingVodResponse(size: $size, next: $next, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingVodResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.next, next) || other.next == next) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, next, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingVodResponseImplCopyWith<_$FollowingVodResponseImpl>
      get copyWith =>
          __$$FollowingVodResponseImplCopyWithImpl<_$FollowingVodResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingVodResponseImplToJson(
      this,
    );
  }
}

abstract class _FollowingVodResponse implements FollowingVodResponse {
  const factory _FollowingVodResponse(
      {required final int size,
      @JsonKey(name: 'page', fromJson: _followingVodPageFromJson)
      required final int next,
      required final List<FollowingVod> data}) = _$FollowingVodResponseImpl;

  factory _FollowingVodResponse.fromJson(Map<String, dynamic> json) =
      _$FollowingVodResponseImpl.fromJson;

  @override
  int get size;
  @override
  @JsonKey(name: 'page', fromJson: _followingVodPageFromJson)
  int get next;
  @override
  List<FollowingVod> get data;
  @override
  @JsonKey(ignore: true)
  _$$FollowingVodResponseImplCopyWith<_$FollowingVodResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PopularVodResponse _$PopularVodResponseFromJson(Map<String, dynamic> json) {
  return _PopularVodResponse.fromJson(json);
}

/// @nodoc
mixin _$PopularVodResponse {
  List<Vod> get videos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PopularVodResponseCopyWith<PopularVodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularVodResponseCopyWith<$Res> {
  factory $PopularVodResponseCopyWith(
          PopularVodResponse value, $Res Function(PopularVodResponse) then) =
      _$PopularVodResponseCopyWithImpl<$Res, PopularVodResponse>;
  @useResult
  $Res call({List<Vod> videos});
}

/// @nodoc
class _$PopularVodResponseCopyWithImpl<$Res, $Val extends PopularVodResponse>
    implements $PopularVodResponseCopyWith<$Res> {
  _$PopularVodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videos = null,
  }) {
    return _then(_value.copyWith(
      videos: null == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopularVodResponseImplCopyWith<$Res>
    implements $PopularVodResponseCopyWith<$Res> {
  factory _$$PopularVodResponseImplCopyWith(_$PopularVodResponseImpl value,
          $Res Function(_$PopularVodResponseImpl) then) =
      __$$PopularVodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Vod> videos});
}

/// @nodoc
class __$$PopularVodResponseImplCopyWithImpl<$Res>
    extends _$PopularVodResponseCopyWithImpl<$Res, _$PopularVodResponseImpl>
    implements _$$PopularVodResponseImplCopyWith<$Res> {
  __$$PopularVodResponseImplCopyWithImpl(_$PopularVodResponseImpl _value,
      $Res Function(_$PopularVodResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videos = null,
  }) {
    return _then(_$PopularVodResponseImpl(
      videos: null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularVodResponseImpl implements _PopularVodResponse {
  const _$PopularVodResponseImpl({required final List<Vod> videos})
      : _videos = videos;

  factory _$PopularVodResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularVodResponseImplFromJson(json);

  final List<Vod> _videos;
  @override
  List<Vod> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  @override
  String toString() {
    return 'PopularVodResponse(videos: $videos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularVodResponseImpl &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_videos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularVodResponseImplCopyWith<_$PopularVodResponseImpl> get copyWith =>
      __$$PopularVodResponseImplCopyWithImpl<_$PopularVodResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularVodResponseImplToJson(
      this,
    );
  }
}

abstract class _PopularVodResponse implements PopularVodResponse {
  const factory _PopularVodResponse({required final List<Vod> videos}) =
      _$PopularVodResponseImpl;

  factory _PopularVodResponse.fromJson(Map<String, dynamic> json) =
      _$PopularVodResponseImpl.fromJson;

  @override
  List<Vod> get videos;
  @override
  @JsonKey(ignore: true)
  _$$PopularVodResponseImplCopyWith<_$PopularVodResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryVodResponse _$CategoryVodResponseFromJson(Map<String, dynamic> json) {
  return _CategoryVodResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryVodResponse {
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'page', fromJson: _categoryVodPageFromJson)
  CategoryVodPage? get next => throw _privateConstructorUsedError;
  List<Vod> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryVodResponseCopyWith<CategoryVodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryVodResponseCopyWith<$Res> {
  factory $CategoryVodResponseCopyWith(
          CategoryVodResponse value, $Res Function(CategoryVodResponse) then) =
      _$CategoryVodResponseCopyWithImpl<$Res, CategoryVodResponse>;
  @useResult
  $Res call(
      {int size,
      @JsonKey(name: 'page', fromJson: _categoryVodPageFromJson)
      CategoryVodPage? next,
      List<Vod> data});

  $CategoryVodPageCopyWith<$Res>? get next;
}

/// @nodoc
class _$CategoryVodResponseCopyWithImpl<$Res, $Val extends CategoryVodResponse>
    implements $CategoryVodResponseCopyWith<$Res> {
  _$CategoryVodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? next = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as CategoryVodPage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryVodPageCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $CategoryVodPageCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryVodResponseImplCopyWith<$Res>
    implements $CategoryVodResponseCopyWith<$Res> {
  factory _$$CategoryVodResponseImplCopyWith(_$CategoryVodResponseImpl value,
          $Res Function(_$CategoryVodResponseImpl) then) =
      __$$CategoryVodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int size,
      @JsonKey(name: 'page', fromJson: _categoryVodPageFromJson)
      CategoryVodPage? next,
      List<Vod> data});

  @override
  $CategoryVodPageCopyWith<$Res>? get next;
}

/// @nodoc
class __$$CategoryVodResponseImplCopyWithImpl<$Res>
    extends _$CategoryVodResponseCopyWithImpl<$Res, _$CategoryVodResponseImpl>
    implements _$$CategoryVodResponseImplCopyWith<$Res> {
  __$$CategoryVodResponseImplCopyWithImpl(_$CategoryVodResponseImpl _value,
      $Res Function(_$CategoryVodResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? next = freezed,
    Object? data = null,
  }) {
    return _then(_$CategoryVodResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as CategoryVodPage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryVodResponseImpl implements _CategoryVodResponse {
  const _$CategoryVodResponseImpl(
      {required this.size,
      @JsonKey(name: 'page', fromJson: _categoryVodPageFromJson)
      required this.next,
      required final List<Vod> data})
      : _data = data;

  factory _$CategoryVodResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryVodResponseImplFromJson(json);

  @override
  final int size;
  @override
  @JsonKey(name: 'page', fromJson: _categoryVodPageFromJson)
  final CategoryVodPage? next;
  final List<Vod> _data;
  @override
  List<Vod> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CategoryVodResponse(size: $size, next: $next, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryVodResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.next, next) || other.next == next) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, next, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryVodResponseImplCopyWith<_$CategoryVodResponseImpl> get copyWith =>
      __$$CategoryVodResponseImplCopyWithImpl<_$CategoryVodResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryVodResponseImplToJson(
      this,
    );
  }
}

abstract class _CategoryVodResponse implements CategoryVodResponse {
  const factory _CategoryVodResponse(
      {required final int size,
      @JsonKey(name: 'page', fromJson: _categoryVodPageFromJson)
      required final CategoryVodPage? next,
      required final List<Vod> data}) = _$CategoryVodResponseImpl;

  factory _CategoryVodResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryVodResponseImpl.fromJson;

  @override
  int get size;
  @override
  @JsonKey(name: 'page', fromJson: _categoryVodPageFromJson)
  CategoryVodPage? get next;
  @override
  List<Vod> get data;
  @override
  @JsonKey(ignore: true)
  _$$CategoryVodResponseImplCopyWith<_$CategoryVodResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryVodPage _$CategoryVodPageFromJson(Map<String, dynamic> json) {
  return _CategoryVodPage.fromJson(json);
}

/// @nodoc
mixin _$CategoryVodPage {
  int get publishDateAt => throw _privateConstructorUsedError;
  int get readCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryVodPageCopyWith<CategoryVodPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryVodPageCopyWith<$Res> {
  factory $CategoryVodPageCopyWith(
          CategoryVodPage value, $Res Function(CategoryVodPage) then) =
      _$CategoryVodPageCopyWithImpl<$Res, CategoryVodPage>;
  @useResult
  $Res call({int publishDateAt, int readCount});
}

/// @nodoc
class _$CategoryVodPageCopyWithImpl<$Res, $Val extends CategoryVodPage>
    implements $CategoryVodPageCopyWith<$Res> {
  _$CategoryVodPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishDateAt = null,
    Object? readCount = null,
  }) {
    return _then(_value.copyWith(
      publishDateAt: null == publishDateAt
          ? _value.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int,
      readCount: null == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryVodPageImplCopyWith<$Res>
    implements $CategoryVodPageCopyWith<$Res> {
  factory _$$CategoryVodPageImplCopyWith(_$CategoryVodPageImpl value,
          $Res Function(_$CategoryVodPageImpl) then) =
      __$$CategoryVodPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int publishDateAt, int readCount});
}

/// @nodoc
class __$$CategoryVodPageImplCopyWithImpl<$Res>
    extends _$CategoryVodPageCopyWithImpl<$Res, _$CategoryVodPageImpl>
    implements _$$CategoryVodPageImplCopyWith<$Res> {
  __$$CategoryVodPageImplCopyWithImpl(
      _$CategoryVodPageImpl _value, $Res Function(_$CategoryVodPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishDateAt = null,
    Object? readCount = null,
  }) {
    return _then(_$CategoryVodPageImpl(
      publishDateAt: null == publishDateAt
          ? _value.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int,
      readCount: null == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryVodPageImpl implements _CategoryVodPage {
  const _$CategoryVodPageImpl(
      {required this.publishDateAt, required this.readCount});

  factory _$CategoryVodPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryVodPageImplFromJson(json);

  @override
  final int publishDateAt;
  @override
  final int readCount;

  @override
  String toString() {
    return 'CategoryVodPage(publishDateAt: $publishDateAt, readCount: $readCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryVodPageImpl &&
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
  _$$CategoryVodPageImplCopyWith<_$CategoryVodPageImpl> get copyWith =>
      __$$CategoryVodPageImplCopyWithImpl<_$CategoryVodPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryVodPageImplToJson(
      this,
    );
  }
}

abstract class _CategoryVodPage implements CategoryVodPage {
  const factory _CategoryVodPage(
      {required final int publishDateAt,
      required final int readCount}) = _$CategoryVodPageImpl;

  factory _CategoryVodPage.fromJson(Map<String, dynamic> json) =
      _$CategoryVodPageImpl.fromJson;

  @override
  int get publishDateAt;
  @override
  int get readCount;
  @override
  @JsonKey(ignore: true)
  _$$CategoryVodPageImplCopyWith<_$CategoryVodPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
