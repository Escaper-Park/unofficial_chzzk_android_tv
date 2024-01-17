import 'package:json_annotation/json_annotation.dart';

part 'live_playback.g.dart';

@JsonSerializable()
class LivePlayback {
  final Meta meta;
  final ServiceMeta serviceMeta;
  final PlaybackLive live;
  final List<PlaybackAPI> api;
  final List<dynamic> media;
  final Thumbnail thumbnail;
  final List<dynamic> multiview;

  LivePlayback(
    this.meta,
    this.serviceMeta,
    this.live,
    this.api,
    this.media,
    this.thumbnail,
    this.multiview,
  );

  factory LivePlayback.fromJson(Map<String, dynamic> json) =>
      _$LivePlaybackFromJson(json);
}

@JsonSerializable()
class Meta {
  final String videoId;
  final int streamSeq;
  final String liveId;
  final bool paidLive;
  final CDNInfo cdnInfo;
  final bool p2p;

  Meta(
    this.videoId,
    this.streamSeq,
    this.liveId,
    this.paidLive,
    this.cdnInfo,
    this.p2p,
  );

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@JsonSerializable()
class CDNInfo {
  final String cdnType;
  final bool zeroRating;

  CDNInfo(this.cdnType, this.zeroRating);

  factory CDNInfo.fromJson(Map<String, dynamic> json) =>
      _$CDNInfoFromJson(json);
}

@JsonSerializable()
class ServiceMeta {
  final String contentType;

  ServiceMeta(this.contentType);

  factory ServiceMeta.fromJson(Map<String, dynamic> json) =>
      _$ServiceMetaFromJson(json);
}

@JsonSerializable()
class PlaybackLive {
  final String? start;
  final String? open;
  final bool timeMachine;
  final String status;

  PlaybackLive(this.start, this.open, this.timeMachine, this.status);

  factory PlaybackLive.fromJson(Map<String, dynamic> json) =>
      _$PlaybackLiveFromJson(json);
}

@JsonSerializable()
class PlaybackAPI {
  final String name;
  final String path;

  PlaybackAPI(this.name, this.path);

  factory PlaybackAPI.fromJson(Map<String, dynamic> json) =>
      _$PlaybackAPIFromJson(json);
}

@JsonSerializable()
class Thumbnail {
  final String snapshotThumbnailTemplate;
  final List<String> types;

  Thumbnail(this.snapshotThumbnailTemplate, this.types);

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
}

// TODO : Media