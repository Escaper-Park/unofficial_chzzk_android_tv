// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_playback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivePlayback _$LivePlaybackFromJson(Map<String, dynamic> json) => LivePlayback(
      Meta.fromJson(json['meta'] as Map<String, dynamic>),
      ServiceMeta.fromJson(json['serviceMeta'] as Map<String, dynamic>),
      PlaybackLive.fromJson(json['live'] as Map<String, dynamic>),
      (json['api'] as List<dynamic>)
          .map((e) => PlaybackAPI.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['media'] as List<dynamic>,
      Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      json['multiview'] as List<dynamic>,
    );

Map<String, dynamic> _$LivePlaybackToJson(LivePlayback instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'serviceMeta': instance.serviceMeta,
      'live': instance.live,
      'api': instance.api,
      'media': instance.media,
      'thumbnail': instance.thumbnail,
      'multiview': instance.multiview,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      json['videoId'] as String,
      json['streamSeq'] as int,
      json['liveId'] as String,
      json['paidLive'] as bool,
      CDNInfo.fromJson(json['cdnInfo'] as Map<String, dynamic>),
      json['p2p'] as bool,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'videoId': instance.videoId,
      'streamSeq': instance.streamSeq,
      'liveId': instance.liveId,
      'paidLive': instance.paidLive,
      'cdnInfo': instance.cdnInfo,
      'p2p': instance.p2p,
    };

CDNInfo _$CDNInfoFromJson(Map<String, dynamic> json) => CDNInfo(
      json['cdnType'] as String,
      json['zeroRating'] as bool,
    );

Map<String, dynamic> _$CDNInfoToJson(CDNInfo instance) => <String, dynamic>{
      'cdnType': instance.cdnType,
      'zeroRating': instance.zeroRating,
    };

ServiceMeta _$ServiceMetaFromJson(Map<String, dynamic> json) => ServiceMeta(
      json['contentType'] as String,
    );

Map<String, dynamic> _$ServiceMetaToJson(ServiceMeta instance) =>
    <String, dynamic>{
      'contentType': instance.contentType,
    };

PlaybackLive _$PlaybackLiveFromJson(Map<String, dynamic> json) => PlaybackLive(
      json['start'] as String?,
      json['open'] as String?,
      json['timeMachine'] as bool,
      json['status'] as String,
    );

Map<String, dynamic> _$PlaybackLiveToJson(PlaybackLive instance) =>
    <String, dynamic>{
      'start': instance.start,
      'open': instance.open,
      'timeMachine': instance.timeMachine,
      'status': instance.status,
    };

PlaybackAPI _$PlaybackAPIFromJson(Map<String, dynamic> json) => PlaybackAPI(
      json['name'] as String,
      json['path'] as String,
    );

Map<String, dynamic> _$PlaybackAPIToJson(PlaybackAPI instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      json['snapshotThumbnailTemplate'] as String,
      (json['types'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'snapshotThumbnailTemplate': instance.snapshotThumbnailTemplate,
      'types': instance.types,
    };
