// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Vod {
  int get videoNo;
  String? get videoId;
  String get videoTitle;
  String get videoType;
  String get publishDate;
  String? get thumbnailImageUrl;
  String? get trailerUrl;
  int get duration;
  int get readCount;
  int get publishDateAt;
  String? get categoryType;
  String? get videoCategory;
  String? get videoCategoryValue;
  bool? get exposure;
  bool get adult;
  bool? get clipActive;
  int? get livePv; // accumulated live count
  List<String>? get tags;
  Channel? get channel;
  String? get blindType;
  int? get watchTimeline; // user last seen
/* vod detail*/
  bool? get paidPromotion;
  String? get inKey;
  String? get liveOpenDate;
  String? get vodStatus;
  LiveRewindPlaybackJson? get liveRewindPlaybackJson;
  String? get userAdultStatus;
  bool? get videoChatEnabled;
  String? get videoChatChannelId;

  /// Create a copy of Vod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodCopyWith<Vod> get copyWith =>
      _$VodCopyWithImpl<Vod>(this as Vod, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Vod &&
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
            const DeepCollectionEquality().equals(other.tags, tags) &&
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
        const DeepCollectionEquality().hash(tags),
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

  @override
  String toString() {
    return 'Vod(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, trailerUrl: $trailerUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryType: $categoryType, videoCategory: $videoCategory, videoCategoryValue: $videoCategoryValue, exposure: $exposure, adult: $adult, clipActive: $clipActive, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline, paidPromotion: $paidPromotion, inKey: $inKey, liveOpenDate: $liveOpenDate, vodStatus: $vodStatus, liveRewindPlaybackJson: $liveRewindPlaybackJson, userAdultStatus: $userAdultStatus, videoChatEnabled: $videoChatEnabled, videoChatChannelId: $videoChatChannelId)';
  }
}

/// @nodoc
abstract mixin class $VodCopyWith<$Res> {
  factory $VodCopyWith(Vod value, $Res Function(Vod) _then) = _$VodCopyWithImpl;
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
      LiveRewindPlaybackJson? liveRewindPlaybackJson,
      String? userAdultStatus,
      bool? videoChatEnabled,
      String? videoChatChannelId});
}

/// @nodoc
class _$VodCopyWithImpl<$Res> implements $VodCopyWith<$Res> {
  _$VodCopyWithImpl(this._self, this._then);

  final Vod _self;
  final $Res Function(Vod) _then;

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
    return _then(Vod(
      videoNo: null == videoNo
          ? _self.videoNo
          : videoNo // ignore: cast_nullable_to_non_nullable
              as int,
      videoId: freezed == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoTitle: null == videoTitle
          ? _self.videoTitle
          : videoTitle // ignore: cast_nullable_to_non_nullable
              as String,
      videoType: null == videoType
          ? _self.videoType
          : videoType // ignore: cast_nullable_to_non_nullable
              as String,
      publishDate: null == publishDate
          ? _self.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImageUrl: freezed == thumbnailImageUrl
          ? _self.thumbnailImageUrl
          : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      trailerUrl: freezed == trailerUrl
          ? _self.trailerUrl
          : trailerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      readCount: null == readCount
          ? _self.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int,
      publishDateAt: null == publishDateAt
          ? _self.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int,
      categoryType: freezed == categoryType
          ? _self.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      videoCategory: freezed == videoCategory
          ? _self.videoCategory
          : videoCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      videoCategoryValue: freezed == videoCategoryValue
          ? _self.videoCategoryValue
          : videoCategoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      exposure: freezed == exposure
          ? _self.exposure
          : exposure // ignore: cast_nullable_to_non_nullable
              as bool?,
      adult: null == adult
          ? _self.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      clipActive: freezed == clipActive
          ? _self.clipActive
          : clipActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      livePv: freezed == livePv
          ? _self.livePv
          : livePv // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      channel: freezed == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      blindType: freezed == blindType
          ? _self.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
      watchTimeline: freezed == watchTimeline
          ? _self.watchTimeline
          : watchTimeline // ignore: cast_nullable_to_non_nullable
              as int?,
      paidPromotion: freezed == paidPromotion
          ? _self.paidPromotion
          : paidPromotion // ignore: cast_nullable_to_non_nullable
              as bool?,
      inKey: freezed == inKey
          ? _self.inKey
          : inKey // ignore: cast_nullable_to_non_nullable
              as String?,
      liveOpenDate: freezed == liveOpenDate
          ? _self.liveOpenDate
          : liveOpenDate // ignore: cast_nullable_to_non_nullable
              as String?,
      vodStatus: freezed == vodStatus
          ? _self.vodStatus
          : vodStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      liveRewindPlaybackJson: freezed == liveRewindPlaybackJson
          ? _self.liveRewindPlaybackJson
          : liveRewindPlaybackJson // ignore: cast_nullable_to_non_nullable
              as LiveRewindPlaybackJson?,
      userAdultStatus: freezed == userAdultStatus
          ? _self.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      videoChatEnabled: freezed == videoChatEnabled
          ? _self.videoChatEnabled
          : videoChatEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      videoChatChannelId: freezed == videoChatChannelId
          ? _self.videoChatChannelId
          : videoChatChannelId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
