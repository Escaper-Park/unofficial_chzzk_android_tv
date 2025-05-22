// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_rewind_playback_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveRewindPlaybackJson _$LiveRewindPlaybackJsonFromJson(
        Map<String, dynamic> json) =>
    LiveRewindPlaybackJson(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      api: (json['api'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      media: (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LiveRewindPlaybackJsonToJson(
        LiveRewindPlaybackJson instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'api': instance.api,
      'media': instance.media,
    };
