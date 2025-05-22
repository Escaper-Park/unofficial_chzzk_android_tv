import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../live/model/live_playback_json.dart';

part 'live_rewind_playback_json.g.dart';
part 'live_rewind_playback_json.freezed.dart';

@freezed
@JsonSerializable()
class LiveRewindPlaybackJson with _$LiveRewindPlaybackJson {
  final Meta meta;
  final List<Map<String, String>> api;
  final List<Media> media;

  factory LiveRewindPlaybackJson.fromJson(Map<String, dynamic> json) =>
      _$LiveRewindPlaybackJsonFromJson(json);

  LiveRewindPlaybackJson({
    required this.meta,
    required this.api,
    required this.media,
  });

  Map<String, Object?> toJson() => _$LiveRewindPlaybackJsonToJson(this);
}

class LiveRewindPlaybackConverter
    implements JsonConverter<LiveRewindPlaybackJson, String> {
  const LiveRewindPlaybackConverter();

  @override
  LiveRewindPlaybackJson fromJson(String json) {
    final playbackJson = jsonDecode(json);

    return LiveRewindPlaybackJson.fromJson(playbackJson);
  }

  @override
  String toJson(LiveRewindPlaybackJson object) {
    final jsonMap = object.toJson();

    return jsonEncode(jsonMap);
  }
}
