final class LivePlayerInitialTarget {
  const LivePlayerInitialTarget({
    required this.channelId,
    this.liveId,
    this.title,
    this.thumbnailImageUrl,
  });

  final String channelId;
  final int? liveId;
  final String? title;
  final String? thumbnailImageUrl;
}
