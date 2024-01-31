// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Video _$VideoFromJson(Map<String, dynamic> json) {
  return _Video.fromJson(json);
}

/// @nodoc
mixin _$Video {
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
  String? get userAdultStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoCopyWith<Video> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCopyWith<$Res> {
  factory $VideoCopyWith(Video value, $Res Function(Video) then) =
      _$VideoCopyWithImpl<$Res, Video>;
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
      String? userAdultStatus});

  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class _$VideoCopyWithImpl<$Res, $Val extends Video>
    implements $VideoCopyWith<$Res> {
  _$VideoCopyWithImpl(this._value, this._then);

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
    Object? userAdultStatus = freezed,
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
      userAdultStatus: freezed == userAdultStatus
          ? _value.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$VideoImplCopyWith<$Res> implements $VideoCopyWith<$Res> {
  factory _$$VideoImplCopyWith(
          _$VideoImpl value, $Res Function(_$VideoImpl) then) =
      __$$VideoImplCopyWithImpl<$Res>;
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
      String? userAdultStatus});

  @override
  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class __$$VideoImplCopyWithImpl<$Res>
    extends _$VideoCopyWithImpl<$Res, _$VideoImpl>
    implements _$$VideoImplCopyWith<$Res> {
  __$$VideoImplCopyWithImpl(
      _$VideoImpl _value, $Res Function(_$VideoImpl) _then)
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
    Object? userAdultStatus = freezed,
  }) {
    return _then(_$VideoImpl(
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
      userAdultStatus: freezed == userAdultStatus
          ? _value.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoImpl implements _Video {
  _$VideoImpl(
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
      required this.userAdultStatus});

  factory _$VideoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoImplFromJson(json);

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
  final String? userAdultStatus;

  @override
  String toString() {
    return 'Video(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, trailerUrl: $trailerUrl, duration: $duration, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, channel: $channel, inKey: $inKey, liveOpenDate: $liveOpenDate, userAdultStatus: $userAdultStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoImpl &&
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
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus));
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
      userAdultStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoImplCopyWith<_$VideoImpl> get copyWith =>
      __$$VideoImplCopyWithImpl<_$VideoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoImplToJson(
      this,
    );
  }
}

abstract class _Video implements Video {
  factory _Video(
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
      required final String? userAdultStatus}) = _$VideoImpl;

  factory _Video.fromJson(Map<String, dynamic> json) = _$VideoImpl.fromJson;

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
  String? get userAdultStatus;
  @override
  @JsonKey(ignore: true)
  _$$VideoImplCopyWith<_$VideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
