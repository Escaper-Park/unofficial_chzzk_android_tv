// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveStreamImpl _$$LiveStreamImplFromJson(Map<String, dynamic> json) =>
    _$LiveStreamImpl(
      liveDetail:
          LiveDetail.fromJson(json['liveDetail'] as Map<String, dynamic>),
      uris: (json['uris'] as List<dynamic>)
          .map((e) => e == null ? null : Uri.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$LiveStreamImplToJson(_$LiveStreamImpl instance) =>
    <String, dynamic>{
      'liveDetail': instance.liveDetail,
      'uris': instance.uris.map((e) => e?.toString()).toList(),
    };
