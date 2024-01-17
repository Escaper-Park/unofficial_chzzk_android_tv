import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../model/live.dart';
import '../model/live_playback.dart';

class LivePollingStatusConverter
    implements JsonConverter<LivePollingStatus, String> {
  const LivePollingStatusConverter();

  @override
  LivePollingStatus fromJson(String jsonString) {
    final json = jsonDecode(jsonString);

    return LivePollingStatus.fromJson(json);
  }

  @override
  String toJson(LivePollingStatus _) => throw UnimplementedError();
}

class LivePlaybackConverter implements JsonConverter<LivePlayback, String> {
  const LivePlaybackConverter();

  @override
  LivePlayback fromJson(String jsonString) {
    final json = jsonDecode(jsonString);

    return LivePlayback.fromJson(json);
  }

  @override
  String toJson(LivePlayback _) => throw UnimplementedError();
}
