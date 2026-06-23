import 'live_card_formatters.dart';

String? liveCardThumbnailUrl({
  required String? thumbnailImageUrl,
  required String? defaultThumbnailImageUrl,
  DateTime Function()? now,
}) {
  final defaultThumbnailUrl = trimmedLiveCardTextOrNull(
    defaultThumbnailImageUrl,
  );
  final liveThumbnailUrl = trimmedLiveCardTextOrNull(thumbnailImageUrl);
  final rawThumbnailUrl = defaultThumbnailUrl ?? liveThumbnailUrl;

  if (rawThumbnailUrl == null) {
    return null;
  }

  final thumbnailUrl = rawThumbnailUrl
      .replaceAll('image_{type}.jpg', 'image_360.jpg')
      .replaceAll('{type}', '360');

  return _withLiveThumbnailDate(
    thumbnailUrl,
    now: now ?? DateTime.now,
  );
}

String _withLiveThumbnailDate(
  String thumbnailUrl, {
  required DateTime Function() now,
}) {
  final date = _liveThumbnailDate(now()).toString();
  final separator = thumbnailUrl.contains('?') ? '&' : '?';

  return '$thumbnailUrl${separator}date=$date';
}

int _liveThumbnailDate(DateTime now) {
  final milliseconds = now.millisecondsSinceEpoch;
  return milliseconds -
      milliseconds % _liveThumbnailRefreshInterval.inMilliseconds;
}

const _liveThumbnailRefreshInterval = Duration(seconds: 30);
