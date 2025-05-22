// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_playback_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LivePlaybackJson {
  Meta get meta;
  ServiceMeta get serviceMeta;
  Live get live;
  List<Map<String, String>> get api;
  List<Media> get media;
  Thumbnail get thumbnail;

  /// Create a copy of LivePlaybackJson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LivePlaybackJsonCopyWith<LivePlaybackJson> get copyWith =>
      _$LivePlaybackJsonCopyWithImpl<LivePlaybackJson>(
          this as LivePlaybackJson, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LivePlaybackJson &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.serviceMeta, serviceMeta) ||
                other.serviceMeta == serviceMeta) &&
            (identical(other.live, live) || other.live == live) &&
            const DeepCollectionEquality().equals(other.api, api) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      meta,
      serviceMeta,
      live,
      const DeepCollectionEquality().hash(api),
      const DeepCollectionEquality().hash(media),
      thumbnail);

  @override
  String toString() {
    return 'LivePlaybackJson(meta: $meta, serviceMeta: $serviceMeta, live: $live, api: $api, media: $media, thumbnail: $thumbnail)';
  }
}

/// @nodoc
abstract mixin class $LivePlaybackJsonCopyWith<$Res> {
  factory $LivePlaybackJsonCopyWith(
          LivePlaybackJson value, $Res Function(LivePlaybackJson) _then) =
      _$LivePlaybackJsonCopyWithImpl;
  @useResult
  $Res call(
      {Meta meta,
      ServiceMeta serviceMeta,
      Live live,
      List<Map<String, String>> api,
      List<Media> media,
      Thumbnail thumbnail});
}

/// @nodoc
class _$LivePlaybackJsonCopyWithImpl<$Res>
    implements $LivePlaybackJsonCopyWith<$Res> {
  _$LivePlaybackJsonCopyWithImpl(this._self, this._then);

  final LivePlaybackJson _self;
  final $Res Function(LivePlaybackJson) _then;

  /// Create a copy of LivePlaybackJson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? serviceMeta = null,
    Object? live = null,
    Object? api = null,
    Object? media = null,
    Object? thumbnail = null,
  }) {
    return _then(LivePlaybackJson(
      meta: null == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
      serviceMeta: null == serviceMeta
          ? _self.serviceMeta
          : serviceMeta // ignore: cast_nullable_to_non_nullable
              as ServiceMeta,
      live: null == live
          ? _self.live
          : live // ignore: cast_nullable_to_non_nullable
              as Live,
      api: null == api
          ? _self.api
          : api // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      media: null == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<Media>,
      thumbnail: null == thumbnail
          ? _self.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as Thumbnail,
    ));
  }
}

/// @nodoc
mixin _$Meta {
  String get videoId;
  int get streamSeq;
  String get liveId;
  bool get paidLive;
  CdnInfo get cdnInfo;
  bool? get p2p;
  bool? get cmcdEnabled;
  String? get playbackAuthType;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MetaCopyWith<Meta> get copyWith =>
      _$MetaCopyWithImpl<Meta>(this as Meta, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Meta &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.streamSeq, streamSeq) ||
                other.streamSeq == streamSeq) &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.paidLive, paidLive) ||
                other.paidLive == paidLive) &&
            (identical(other.cdnInfo, cdnInfo) || other.cdnInfo == cdnInfo) &&
            (identical(other.p2p, p2p) || other.p2p == p2p) &&
            (identical(other.cmcdEnabled, cmcdEnabled) ||
                other.cmcdEnabled == cmcdEnabled) &&
            (identical(other.playbackAuthType, playbackAuthType) ||
                other.playbackAuthType == playbackAuthType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, videoId, streamSeq, liveId,
      paidLive, cdnInfo, p2p, cmcdEnabled, playbackAuthType);

  @override
  String toString() {
    return 'Meta(videoId: $videoId, streamSeq: $streamSeq, liveId: $liveId, paidLive: $paidLive, cdnInfo: $cdnInfo, p2p: $p2p, cmcdEnabled: $cmcdEnabled, playbackAuthType: $playbackAuthType)';
  }
}

/// @nodoc
abstract mixin class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) _then) =
      _$MetaCopyWithImpl;
  @useResult
  $Res call(
      {String videoId,
      int streamSeq,
      String liveId,
      bool paidLive,
      CdnInfo cdnInfo,
      bool? p2p,
      bool? cmcdEnabled,
      String? playbackAuthType});
}

/// @nodoc
class _$MetaCopyWithImpl<$Res> implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._self, this._then);

  final Meta _self;
  final $Res Function(Meta) _then;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = null,
    Object? streamSeq = null,
    Object? liveId = null,
    Object? paidLive = null,
    Object? cdnInfo = null,
    Object? p2p = freezed,
    Object? cmcdEnabled = freezed,
    Object? playbackAuthType = freezed,
  }) {
    return _then(Meta(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      streamSeq: null == streamSeq
          ? _self.streamSeq
          : streamSeq // ignore: cast_nullable_to_non_nullable
              as int,
      liveId: null == liveId
          ? _self.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as String,
      paidLive: null == paidLive
          ? _self.paidLive
          : paidLive // ignore: cast_nullable_to_non_nullable
              as bool,
      cdnInfo: null == cdnInfo
          ? _self.cdnInfo
          : cdnInfo // ignore: cast_nullable_to_non_nullable
              as CdnInfo,
      p2p: freezed == p2p
          ? _self.p2p
          : p2p // ignore: cast_nullable_to_non_nullable
              as bool?,
      cmcdEnabled: freezed == cmcdEnabled
          ? _self.cmcdEnabled
          : cmcdEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      playbackAuthType: freezed == playbackAuthType
          ? _self.playbackAuthType
          : playbackAuthType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CdnInfo {
  String get cdnType;
  bool get zeroRating;

  /// Create a copy of CdnInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CdnInfoCopyWith<CdnInfo> get copyWith =>
      _$CdnInfoCopyWithImpl<CdnInfo>(this as CdnInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CdnInfo &&
            (identical(other.cdnType, cdnType) || other.cdnType == cdnType) &&
            (identical(other.zeroRating, zeroRating) ||
                other.zeroRating == zeroRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cdnType, zeroRating);

  @override
  String toString() {
    return 'CdnInfo(cdnType: $cdnType, zeroRating: $zeroRating)';
  }
}

/// @nodoc
abstract mixin class $CdnInfoCopyWith<$Res> {
  factory $CdnInfoCopyWith(CdnInfo value, $Res Function(CdnInfo) _then) =
      _$CdnInfoCopyWithImpl;
  @useResult
  $Res call({String cdnType, bool zeroRating});
}

/// @nodoc
class _$CdnInfoCopyWithImpl<$Res> implements $CdnInfoCopyWith<$Res> {
  _$CdnInfoCopyWithImpl(this._self, this._then);

  final CdnInfo _self;
  final $Res Function(CdnInfo) _then;

  /// Create a copy of CdnInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cdnType = null,
    Object? zeroRating = null,
  }) {
    return _then(CdnInfo(
      cdnType: null == cdnType
          ? _self.cdnType
          : cdnType // ignore: cast_nullable_to_non_nullable
              as String,
      zeroRating: null == zeroRating
          ? _self.zeroRating
          : zeroRating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$ServiceMeta {
  String get contentType;

  /// Create a copy of ServiceMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceMetaCopyWith<ServiceMeta> get copyWith =>
      _$ServiceMetaCopyWithImpl<ServiceMeta>(this as ServiceMeta, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceMeta &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, contentType);

  @override
  String toString() {
    return 'ServiceMeta(contentType: $contentType)';
  }
}

/// @nodoc
abstract mixin class $ServiceMetaCopyWith<$Res> {
  factory $ServiceMetaCopyWith(
          ServiceMeta value, $Res Function(ServiceMeta) _then) =
      _$ServiceMetaCopyWithImpl;
  @useResult
  $Res call({String contentType});
}

/// @nodoc
class _$ServiceMetaCopyWithImpl<$Res> implements $ServiceMetaCopyWith<$Res> {
  _$ServiceMetaCopyWithImpl(this._self, this._then);

  final ServiceMeta _self;
  final $Res Function(ServiceMeta) _then;

  /// Create a copy of ServiceMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentType = null,
  }) {
    return _then(ServiceMeta(
      contentType: null == contentType
          ? _self.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Live {
  String get start;
  String get open;
  bool get timeMachine;
  String get status;

  /// Create a copy of Live
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveCopyWith<Live> get copyWith =>
      _$LiveCopyWithImpl<Live>(this as Live, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Live &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.timeMachine, timeMachine) ||
                other.timeMachine == timeMachine) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, start, open, timeMachine, status);

  @override
  String toString() {
    return 'Live(start: $start, open: $open, timeMachine: $timeMachine, status: $status)';
  }
}

/// @nodoc
abstract mixin class $LiveCopyWith<$Res> {
  factory $LiveCopyWith(Live value, $Res Function(Live) _then) =
      _$LiveCopyWithImpl;
  @useResult
  $Res call({String start, String open, bool timeMachine, String status});
}

/// @nodoc
class _$LiveCopyWithImpl<$Res> implements $LiveCopyWith<$Res> {
  _$LiveCopyWithImpl(this._self, this._then);

  final Live _self;
  final $Res Function(Live) _then;

  /// Create a copy of Live
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? open = null,
    Object? timeMachine = null,
    Object? status = null,
  }) {
    return _then(Live(
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      open: null == open
          ? _self.open
          : open // ignore: cast_nullable_to_non_nullable
              as String,
      timeMachine: null == timeMachine
          ? _self.timeMachine
          : timeMachine // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Media {
  String get mediaId;
  String get protocol;
  String get path;
  String? get latency;
  List<EncodingTrack> get encodingTrack;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MediaCopyWith<Media> get copyWith =>
      _$MediaCopyWithImpl<Media>(this as Media, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Media &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.latency, latency) || other.latency == latency) &&
            const DeepCollectionEquality()
                .equals(other.encodingTrack, encodingTrack));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mediaId, protocol, path, latency,
      const DeepCollectionEquality().hash(encodingTrack));

  @override
  String toString() {
    return 'Media(mediaId: $mediaId, protocol: $protocol, path: $path, latency: $latency, encodingTrack: $encodingTrack)';
  }
}

/// @nodoc
abstract mixin class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) _then) =
      _$MediaCopyWithImpl;
  @useResult
  $Res call(
      {String mediaId,
      String protocol,
      String path,
      String? latency,
      List<EncodingTrack> encodingTrack});
}

/// @nodoc
class _$MediaCopyWithImpl<$Res> implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._self, this._then);

  final Media _self;
  final $Res Function(Media) _then;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaId = null,
    Object? protocol = null,
    Object? path = null,
    Object? latency = freezed,
    Object? encodingTrack = null,
  }) {
    return _then(Media(
      mediaId: null == mediaId
          ? _self.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String,
      protocol: null == protocol
          ? _self.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      latency: freezed == latency
          ? _self.latency
          : latency // ignore: cast_nullable_to_non_nullable
              as String?,
      encodingTrack: null == encodingTrack
          ? _self.encodingTrack
          : encodingTrack // ignore: cast_nullable_to_non_nullable
              as List<EncodingTrack>,
    ));
  }
}

/// @nodoc
mixin _$EncodingTrack {
  String? get encodingTrackId;
  String? get videoProfile;
  String? get audioProfile;
  String? get videoCodec;
  int? get videoBitRate;
  int? get audioBitRate;
  String? get videoFrameRate;
  int? get videoWidth;
  int? get videoHeight;
  int? get audioSamplingRate;
  int? get audioChannel;
  bool? get avoidReencoding;
  String? get videoDynamicRange; /* only KR with 720p, 1080p */
  String? get p2pPath;
  String? get p2pPathUrlEncoding;
  String? get path; /* audio only mode */
  String? get audioCodec;
  bool? get audioOnly;

  /// Create a copy of EncodingTrack
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EncodingTrackCopyWith<EncodingTrack> get copyWith =>
      _$EncodingTrackCopyWithImpl<EncodingTrack>(
          this as EncodingTrack, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EncodingTrack &&
            (identical(other.encodingTrackId, encodingTrackId) ||
                other.encodingTrackId == encodingTrackId) &&
            (identical(other.videoProfile, videoProfile) ||
                other.videoProfile == videoProfile) &&
            (identical(other.audioProfile, audioProfile) ||
                other.audioProfile == audioProfile) &&
            (identical(other.videoCodec, videoCodec) ||
                other.videoCodec == videoCodec) &&
            (identical(other.videoBitRate, videoBitRate) ||
                other.videoBitRate == videoBitRate) &&
            (identical(other.audioBitRate, audioBitRate) ||
                other.audioBitRate == audioBitRate) &&
            (identical(other.videoFrameRate, videoFrameRate) ||
                other.videoFrameRate == videoFrameRate) &&
            (identical(other.videoWidth, videoWidth) ||
                other.videoWidth == videoWidth) &&
            (identical(other.videoHeight, videoHeight) ||
                other.videoHeight == videoHeight) &&
            (identical(other.audioSamplingRate, audioSamplingRate) ||
                other.audioSamplingRate == audioSamplingRate) &&
            (identical(other.audioChannel, audioChannel) ||
                other.audioChannel == audioChannel) &&
            (identical(other.avoidReencoding, avoidReencoding) ||
                other.avoidReencoding == avoidReencoding) &&
            (identical(other.videoDynamicRange, videoDynamicRange) ||
                other.videoDynamicRange == videoDynamicRange) &&
            (identical(other.p2pPath, p2pPath) || other.p2pPath == p2pPath) &&
            (identical(other.p2pPathUrlEncoding, p2pPathUrlEncoding) ||
                other.p2pPathUrlEncoding == p2pPathUrlEncoding) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.audioCodec, audioCodec) ||
                other.audioCodec == audioCodec) &&
            (identical(other.audioOnly, audioOnly) ||
                other.audioOnly == audioOnly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      encodingTrackId,
      videoProfile,
      audioProfile,
      videoCodec,
      videoBitRate,
      audioBitRate,
      videoFrameRate,
      videoWidth,
      videoHeight,
      audioSamplingRate,
      audioChannel,
      avoidReencoding,
      videoDynamicRange,
      p2pPath,
      p2pPathUrlEncoding,
      path,
      audioCodec,
      audioOnly);

  @override
  String toString() {
    return 'EncodingTrack(encodingTrackId: $encodingTrackId, videoProfile: $videoProfile, audioProfile: $audioProfile, videoCodec: $videoCodec, videoBitRate: $videoBitRate, audioBitRate: $audioBitRate, videoFrameRate: $videoFrameRate, videoWidth: $videoWidth, videoHeight: $videoHeight, audioSamplingRate: $audioSamplingRate, audioChannel: $audioChannel, avoidReencoding: $avoidReencoding, videoDynamicRange: $videoDynamicRange, p2pPath: $p2pPath, p2pPathUrlEncoding: $p2pPathUrlEncoding, path: $path, audioCodec: $audioCodec, audioOnly: $audioOnly)';
  }
}

/// @nodoc
abstract mixin class $EncodingTrackCopyWith<$Res> {
  factory $EncodingTrackCopyWith(
          EncodingTrack value, $Res Function(EncodingTrack) _then) =
      _$EncodingTrackCopyWithImpl;
  @useResult
  $Res call(
      {String? encodingTrackId,
      String? videoProfile,
      String? audioProfile,
      String? videoCodec,
      int? videoBitRate,
      int? audioBitRate,
      String? videoFrameRate,
      int? videoWidth,
      int? videoHeight,
      int? audioSamplingRate,
      int? audioChannel,
      bool? avoidReencoding,
      String? videoDynamicRange,
      String? p2pPath,
      String? p2pPathUrlEncoding,
      String? path,
      String? audioCodec,
      bool? audioOnly});
}

/// @nodoc
class _$EncodingTrackCopyWithImpl<$Res>
    implements $EncodingTrackCopyWith<$Res> {
  _$EncodingTrackCopyWithImpl(this._self, this._then);

  final EncodingTrack _self;
  final $Res Function(EncodingTrack) _then;

  /// Create a copy of EncodingTrack
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? encodingTrackId = freezed,
    Object? videoProfile = freezed,
    Object? audioProfile = freezed,
    Object? videoCodec = freezed,
    Object? videoBitRate = freezed,
    Object? audioBitRate = freezed,
    Object? videoFrameRate = freezed,
    Object? videoWidth = freezed,
    Object? videoHeight = freezed,
    Object? audioSamplingRate = freezed,
    Object? audioChannel = freezed,
    Object? avoidReencoding = freezed,
    Object? videoDynamicRange = freezed,
    Object? p2pPath = freezed,
    Object? p2pPathUrlEncoding = freezed,
    Object? path = freezed,
    Object? audioCodec = freezed,
    Object? audioOnly = freezed,
  }) {
    return _then(EncodingTrack(
      encodingTrackId: freezed == encodingTrackId
          ? _self.encodingTrackId
          : encodingTrackId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoProfile: freezed == videoProfile
          ? _self.videoProfile
          : videoProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      audioProfile: freezed == audioProfile
          ? _self.audioProfile
          : audioProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      videoCodec: freezed == videoCodec
          ? _self.videoCodec
          : videoCodec // ignore: cast_nullable_to_non_nullable
              as String?,
      videoBitRate: freezed == videoBitRate
          ? _self.videoBitRate
          : videoBitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      audioBitRate: freezed == audioBitRate
          ? _self.audioBitRate
          : audioBitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      videoFrameRate: freezed == videoFrameRate
          ? _self.videoFrameRate
          : videoFrameRate // ignore: cast_nullable_to_non_nullable
              as String?,
      videoWidth: freezed == videoWidth
          ? _self.videoWidth
          : videoWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      videoHeight: freezed == videoHeight
          ? _self.videoHeight
          : videoHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      audioSamplingRate: freezed == audioSamplingRate
          ? _self.audioSamplingRate
          : audioSamplingRate // ignore: cast_nullable_to_non_nullable
              as int?,
      audioChannel: freezed == audioChannel
          ? _self.audioChannel
          : audioChannel // ignore: cast_nullable_to_non_nullable
              as int?,
      avoidReencoding: freezed == avoidReencoding
          ? _self.avoidReencoding
          : avoidReencoding // ignore: cast_nullable_to_non_nullable
              as bool?,
      videoDynamicRange: freezed == videoDynamicRange
          ? _self.videoDynamicRange
          : videoDynamicRange // ignore: cast_nullable_to_non_nullable
              as String?,
      p2pPath: freezed == p2pPath
          ? _self.p2pPath
          : p2pPath // ignore: cast_nullable_to_non_nullable
              as String?,
      p2pPathUrlEncoding: freezed == p2pPathUrlEncoding
          ? _self.p2pPathUrlEncoding
          : p2pPathUrlEncoding // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      audioCodec: freezed == audioCodec
          ? _self.audioCodec
          : audioCodec // ignore: cast_nullable_to_non_nullable
              as String?,
      audioOnly: freezed == audioOnly
          ? _self.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$Thumbnail {
  String get snapshotThumbnailTemplate;
  List<String> get types;

  /// Create a copy of Thumbnail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ThumbnailCopyWith<Thumbnail> get copyWith =>
      _$ThumbnailCopyWithImpl<Thumbnail>(this as Thumbnail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Thumbnail &&
            (identical(other.snapshotThumbnailTemplate,
                    snapshotThumbnailTemplate) ||
                other.snapshotThumbnailTemplate == snapshotThumbnailTemplate) &&
            const DeepCollectionEquality().equals(other.types, types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, snapshotThumbnailTemplate,
      const DeepCollectionEquality().hash(types));

  @override
  String toString() {
    return 'Thumbnail(snapshotThumbnailTemplate: $snapshotThumbnailTemplate, types: $types)';
  }
}

/// @nodoc
abstract mixin class $ThumbnailCopyWith<$Res> {
  factory $ThumbnailCopyWith(Thumbnail value, $Res Function(Thumbnail) _then) =
      _$ThumbnailCopyWithImpl;
  @useResult
  $Res call({String snapshotThumbnailTemplate, List<String> types});
}

/// @nodoc
class _$ThumbnailCopyWithImpl<$Res> implements $ThumbnailCopyWith<$Res> {
  _$ThumbnailCopyWithImpl(this._self, this._then);

  final Thumbnail _self;
  final $Res Function(Thumbnail) _then;

  /// Create a copy of Thumbnail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? snapshotThumbnailTemplate = null,
    Object? types = null,
  }) {
    return _then(Thumbnail(
      snapshotThumbnailTemplate: null == snapshotThumbnailTemplate
          ? _self.snapshotThumbnailTemplate
          : snapshotThumbnailTemplate // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
