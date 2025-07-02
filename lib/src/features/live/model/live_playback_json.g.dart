// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_playback_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LivePlaybackJsonImpl _$$LivePlaybackJsonImplFromJson(
        Map<String, dynamic> json) =>
    _$LivePlaybackJsonImpl(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      serviceMeta:
          ServiceMeta.fromJson(json['serviceMeta'] as Map<String, dynamic>),
      live: Live.fromJson(json['live'] as Map<String, dynamic>),
      api: (json['api'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      media: (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LivePlaybackJsonImplToJson(
        _$LivePlaybackJsonImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'serviceMeta': instance.serviceMeta,
      'live': instance.live,
      'api': instance.api,
      'media': instance.media,
      'thumbnail': instance.thumbnail,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      videoId: json['videoId'] as String,
      streamSeq: (json['streamSeq'] as num).toInt(),
      liveId: json['liveId'] as String,
      paidLive: json['paidLive'] as bool,
      cdnInfo: CdnInfo.fromJson(json['cdnInfo'] as Map<String, dynamic>),
      p2p: json['p2p'] as bool?,
      cmcdEnabled: json['cmcdEnabled'] as bool?,
      playbackAuthType: json['playbackAuthType'] as String?,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'streamSeq': instance.streamSeq,
      'liveId': instance.liveId,
      'paidLive': instance.paidLive,
      'cdnInfo': instance.cdnInfo,
      'p2p': instance.p2p,
      'cmcdEnabled': instance.cmcdEnabled,
      'playbackAuthType': instance.playbackAuthType,
    };

_$CdnInfoImpl _$$CdnInfoImplFromJson(Map<String, dynamic> json) =>
    _$CdnInfoImpl(
      cdnType: json['cdnType'] as String,
    );

Map<String, dynamic> _$$CdnInfoImplToJson(_$CdnInfoImpl instance) =>
    <String, dynamic>{
      'cdnType': instance.cdnType,
    };

_$ServiceMetaImpl _$$ServiceMetaImplFromJson(Map<String, dynamic> json) =>
    _$ServiceMetaImpl(
      contentType: json['contentType'] as String,
    );

Map<String, dynamic> _$$ServiceMetaImplToJson(_$ServiceMetaImpl instance) =>
    <String, dynamic>{
      'contentType': instance.contentType,
    };

_$LiveImpl _$$LiveImplFromJson(Map<String, dynamic> json) => _$LiveImpl(
      start: json['start'] as String,
      open: json['open'] as String,
      timeMachine: json['timeMachine'] as bool,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$LiveImplToJson(_$LiveImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'open': instance.open,
      'timeMachine': instance.timeMachine,
      'status': instance.status,
    };

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      mediaId: json['mediaId'] as String,
      protocol: json['protocol'] as String,
      path: json['path'] as String,
      latency: json['latency'] as String?,
      encodingTrack: (json['encodingTrack'] as List<dynamic>)
          .map((e) => EncodingTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'mediaId': instance.mediaId,
      'protocol': instance.protocol,
      'path': instance.path,
      'latency': instance.latency,
      'encodingTrack': instance.encodingTrack,
    };

_$EncodingTrackImpl _$$EncodingTrackImplFromJson(Map<String, dynamic> json) =>
    _$EncodingTrackImpl(
      encodingTrackId: json['encodingTrackId'] as String?,
      videoProfile: json['videoProfile'] as String?,
      audioProfile: json['audioProfile'] as String?,
      videoCodec: json['videoCodec'] as String?,
      videoBitRate: (json['videoBitRate'] as num?)?.toInt(),
      audioBitRate: (json['audioBitRate'] as num?)?.toInt(),
      videoFrameRate: json['videoFrameRate'] as String?,
      videoWidth: (json['videoWidth'] as num?)?.toInt(),
      videoHeight: (json['videoHeight'] as num?)?.toInt(),
      audioSamplingRate: (json['audioSamplingRate'] as num?)?.toInt(),
      audioChannel: (json['audioChannel'] as num?)?.toInt(),
      avoidReencoding: json['avoidReencoding'] as bool?,
      videoDynamicRange: json['videoDynamicRange'] as String?,
      p2pPath: json['p2pPath'] as String?,
      p2pPathUrlEncoding: json['p2pPathUrlEncoding'] as String?,
      path: json['path'] as String?,
      audioCodec: json['audioCodec'] as String?,
      audioOnly: json['audioOnly'] as bool?,
    );

Map<String, dynamic> _$$EncodingTrackImplToJson(_$EncodingTrackImpl instance) =>
    <String, dynamic>{
      'encodingTrackId': instance.encodingTrackId,
      'videoProfile': instance.videoProfile,
      'audioProfile': instance.audioProfile,
      'videoCodec': instance.videoCodec,
      'videoBitRate': instance.videoBitRate,
      'audioBitRate': instance.audioBitRate,
      'videoFrameRate': instance.videoFrameRate,
      'videoWidth': instance.videoWidth,
      'videoHeight': instance.videoHeight,
      'audioSamplingRate': instance.audioSamplingRate,
      'audioChannel': instance.audioChannel,
      'avoidReencoding': instance.avoidReencoding,
      'videoDynamicRange': instance.videoDynamicRange,
      'p2pPath': instance.p2pPath,
      'p2pPathUrlEncoding': instance.p2pPathUrlEncoding,
      'path': instance.path,
      'audioCodec': instance.audioCodec,
      'audioOnly': instance.audioOnly,
    };

_$ThumbnailImpl _$$ThumbnailImplFromJson(Map<String, dynamic> json) =>
    _$ThumbnailImpl(
      snapshotThumbnailTemplate: json['snapshotThumbnailTemplate'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ThumbnailImplToJson(_$ThumbnailImpl instance) =>
    <String, dynamic>{
      'snapshotThumbnailTemplate': instance.snapshotThumbnailTemplate,
      'types': instance.types,
    };
