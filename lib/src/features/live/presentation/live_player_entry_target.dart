import '../../live_player/presentation/live_player_route_target.dart';
import '../domain/entities/live_feed.dart';
import '../domain/entities/live_status.dart';

LivePlayerInitialTarget livePlayerEntryTargetFromCard(
  Live item,
  String channelId,
) {
  return LivePlayerInitialTarget(
    channelId: channelId,
    liveId: item.liveId,
    title: item.title,
    thumbnailImageUrl: item.thumbnailImageUrl ?? item.defaultThumbnailImageUrl,
  );
}

LivePlayerInitialTarget livePlayerEntryTargetFromChannel({
  required String channelId,
  required LiveStatus status,
  String? title,
  String? thumbnailImageUrl,
}) {
  return LivePlayerInitialTarget(
    channelId: channelId,
    title: _nonBlank(title) ?? _nonBlank(status.title),
    thumbnailImageUrl: thumbnailImageUrl,
  );
}

String? _nonBlank(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed;
}
