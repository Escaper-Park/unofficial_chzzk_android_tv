import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../live/model/live_playback_json.dart';

part 'live_rewind_playback_json.g.dart';
part 'live_rewind_playback_json.freezed.dart';

@freezed
class LiveRewindPlaybackJson with _$LiveRewindPlaybackJson {
  const factory LiveRewindPlaybackJson({
    required Meta meta,
    required List<Map<String, String>> api,
    required List<Media> media,
  }) = _LiveRewindPlaybackJson;

  factory LiveRewindPlaybackJson.fromJson(Map<String, dynamic> json) =>
      _$LiveRewindPlaybackJsonFromJson(json);
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
