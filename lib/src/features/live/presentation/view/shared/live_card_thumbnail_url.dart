import 'live_card_formatters.dart';

String? liveCardThumbnailUrl({
  required String? thumbnailImageUrl,
  required String? defaultThumbnailImageUrl,
}) {
  final defaultThumbnailUrl = trimmedLiveCardTextOrNull(
    defaultThumbnailImageUrl,
  );
  final liveThumbnailUrl = trimmedLiveCardTextOrNull(thumbnailImageUrl);
  final rawThumbnailUrl = defaultThumbnailUrl ?? liveThumbnailUrl;

  if (rawThumbnailUrl == null) {
    return null;
  }

  return rawThumbnailUrl
      .replaceAll('image_{type}.jpg', 'image_360.jpg')
      .replaceAll('{type}', '360');
}
