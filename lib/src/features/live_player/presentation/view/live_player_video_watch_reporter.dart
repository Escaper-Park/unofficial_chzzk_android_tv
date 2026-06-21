part of 'live_player_video_surface.dart';

LivePlayerWatchEventReporter? _livePlayerWatchEventReporterFor({
  required bool enabled,
  required String? channelId,
  required int? liveId,
  required DateTime? liveOpenDate,
  required List<String> liveTokens,
  required PostLivePlayerWatchEvent postWatchEvent,
}) {
  if (!enabled || channelId == null || channelId.isEmpty || liveId == null) {
    return null;
  }

  return LivePlayerWatchEventReporter(
    channelId: channelId,
    liveId: liveId,
    liveOpenDate: liveOpenDate,
    liveTokens: liveTokens,
    postWatchEvent: postWatchEvent,
  );
}

DateTime? _parseLiveOpenDate(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  try {
    return DateTime.parse(trimmed.replaceFirst(' ', 'T'));
  } on FormatException {
    return null;
  }
}
