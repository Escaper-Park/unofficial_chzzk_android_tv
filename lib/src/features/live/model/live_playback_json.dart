import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_playback_json.g.dart';
part 'live_playback_json.freezed.dart';

@freezed
@JsonSerializable()
class LivePlaybackJson with _$LivePlaybackJson {
  final Meta meta;
  final ServiceMeta serviceMeta;
  final Live live;
  final List<Map<String, String>> api;
  final List<Media> media;
  final Thumbnail thumbnail;

  LivePlaybackJson({
    required this.meta,
    required this.serviceMeta,
    required this.live,
    required this.api,
    required this.media,
    required this.thumbnail,
  });

  factory LivePlaybackJson.fromJson(Map<String, dynamic> json) =>
      _$LivePlaybackJsonFromJson(json);

  Map<String, Object?> toJson() => _$LivePlaybackJsonToJson(this);
}

@freezed
@JsonSerializable()
class Meta with _$Meta {
  final String videoId;
  final int streamSeq;
  final String liveId;
  final bool paidLive;
  final CdnInfo cdnInfo;
  final bool? p2p;
  final bool? cmcdEnabled;
  final String? playbackAuthType;

  Meta({
    required this.videoId,
    required this.streamSeq,
    required this.liveId,
    required this.paidLive,
    required this.cdnInfo,
    this.p2p,
    this.cmcdEnabled,
    this.playbackAuthType,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, Object?> toJson() => _$MetaToJson(this);
}

@freezed
@JsonSerializable()
class CdnInfo with _$CdnInfo {
  final String cdnType;
  final bool zeroRating;

  CdnInfo({
    required this.cdnType,
    required this.zeroRating,
  });

  factory CdnInfo.fromJson(Map<String, dynamic> json) =>
      _$CdnInfoFromJson(json);

  Map<String, Object?> toJson() => _$CdnInfoToJson(this);
}

@freezed
@JsonSerializable()
class ServiceMeta with _$ServiceMeta {
  final String contentType;

  ServiceMeta({
    required this.contentType,
  });

  factory ServiceMeta.fromJson(Map<String, dynamic> json) =>
      _$ServiceMetaFromJson(json);

  Map<String, Object?> toJson() => _$ServiceMetaToJson(this);
}

@freezed
@JsonSerializable()
class Live with _$Live {
  final String start;
  final String open;
  final bool timeMachine;
  final String status;

  Live({
    required this.start,
    required this.open,
    required this.timeMachine,
    required this.status,
  });

  factory Live.fromJson(Map<String, dynamic> json) => _$LiveFromJson(json);

  Map<String, Object?> toJson() => _$LiveToJson(this);
}

@freezed
@JsonSerializable()
class Media with _$Media {
  final String mediaId;
  final String protocol;
  final String path;
  final String? latency;
  final List<EncodingTrack> encodingTrack;

  Media({
    required this.mediaId,
    required this.protocol,
    required this.path,
    this.latency,
    required this.encodingTrack,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, Object?> toJson() => _$MediaToJson(this);
}

@freezed
@JsonSerializable()
class EncodingTrack with _$EncodingTrack {
  final String? encodingTrackId;
  final String? videoProfile;
  final String? audioProfile;
  final String? videoCodec;
  final int? videoBitRate;
  final int? audioBitRate;
  final String? videoFrameRate;
  final int? videoWidth;
  final int? videoHeight;
  final int? audioSamplingRate;
  final int? audioChannel;
  final bool? avoidReencoding;
  final String? videoDynamicRange;
  /* only KR with 720p, 1080p */
  final String? p2pPath;
  final String? p2pPathUrlEncoding;
  final String? path;
  /* audio only mode */
  final String? audioCodec;
  final bool? audioOnly;

  EncodingTrack({
    this.encodingTrackId,
    this.videoProfile,
    this.audioProfile,
    this.videoCodec,
    this.videoBitRate,
    this.audioBitRate,
    this.videoFrameRate,
    this.videoWidth,
    this.videoHeight,
    this.audioSamplingRate,
    this.audioChannel,
    this.avoidReencoding,
    this.videoDynamicRange,
    this.p2pPath,
    this.p2pPathUrlEncoding,
    this.path,
    this.audioCodec,
    this.audioOnly,
  });

  factory EncodingTrack.fromJson(Map<String, dynamic> json) =>
      _$EncodingTrackFromJson(json);

  Map<String, Object?> toJson() => _$EncodingTrackToJson(this);
}

@freezed
@JsonSerializable()
class Thumbnail with _$Thumbnail {
  final String snapshotThumbnailTemplate;
  final List<String> types;

  Thumbnail({
    required this.snapshotThumbnailTemplate,
    required this.types,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);

  Map<String, Object?> toJson() => _$ThumbnailToJson(this);
}

class LivePlaybackConverter implements JsonConverter<LivePlaybackJson, String> {
  const LivePlaybackConverter();

  @override
  LivePlaybackJson fromJson(String json) {
    final playbackJson = jsonDecode(json);

    return LivePlaybackJson.fromJson(playbackJson);
  }

  @override
  String toJson(LivePlaybackJson object) {
    final jsonMap = object.toJson();

    return jsonEncode(jsonMap);
  }
}
