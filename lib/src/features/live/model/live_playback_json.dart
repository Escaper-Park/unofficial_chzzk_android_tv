import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_playback_json.freezed.dart';
part 'live_playback_json.g.dart';

@freezed
class LivePlaybackJson with _$LivePlaybackJson {
  const factory LivePlaybackJson({
    required Meta meta,
    required ServiceMeta serviceMeta,
    required Live live,
    required List<Map<String, String>> api,
    required List<Media> media,
    required Thumbnail thumbnail,
    required List<Object?> multiview,
  }) = _LivePlaybackJson;

  factory LivePlaybackJson.fromJson(Map<String, dynamic> json) =>
      _$LivePlaybackJsonFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    required String videoId,
    required int streamSeq,
    required String liveId,
    required bool paidLive,
    required CdnInfo cdnInfo,
    required bool p2p,
    required bool cmcdEnabled,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class CdnInfo with _$CdnInfo {
  const factory CdnInfo({
    required String cdnType,
    required bool zeroRating,
  }) = _CdnInfo;

  factory CdnInfo.fromJson(Map<String, dynamic> json) =>
      _$CdnInfoFromJson(json);
}

@freezed
class ServiceMeta with _$ServiceMeta {
  const factory ServiceMeta({
    required String contentType,
  }) = _ServiceMeta;

  factory ServiceMeta.fromJson(Map<String, dynamic> json) =>
      _$ServiceMetaFromJson(json);
}

@freezed
class Live with _$Live {
  const factory Live({
    required String start,
    required String open,
    required bool timeMachine,
    required String status,
  }) = _Live;

  factory Live.fromJson(Map<String, dynamic> json) => _$LiveFromJson(json);
}

@freezed
class Media with _$Media {
  const factory Media({
    required String mediaId,
    required String protocol,
    required String path,
    required String? latency,
    required List<EncodingTrack> encodingTrack,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}

@freezed
class EncodingTrack with _$EncodingTrack {
  const factory EncodingTrack({
    required String encodingTrackId,
    required String videoProfile,
    required String audioProfile,
    required String videoCodec,
    required int videoBitRate,
    required int audioBitRate,
    required String videoFrameRate,
    required int videoWidth,
    required int videoHeight,
    required int audioSamplingRate,
    required int audioChannel,
    required bool avoidReencoding,
    required String videoDynamicRange,
    // 720p, 1080p
    required String? p2pPath,
    required String? p2pPathUrlEncoding,
  }) = _EncodingTrack;

  factory EncodingTrack.fromJson(Map<String, dynamic> json) =>
      _$EncodingTrackFromJson(json);
}

@freezed
class Thumbnail with _$Thumbnail {
  const factory Thumbnail({
    required String snapshotThumbnailTemplate,
    required List<String> types,
  }) = _Thumbnail;

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
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
