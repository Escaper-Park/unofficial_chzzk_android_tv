import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/view/shared/live_card_thumbnail_url.dart';

void main() {
  test('live thumbnail url keeps the default 30 second refresh bucket', () {
    final url = liveCardThumbnailUrl(
      thumbnailImageUrl: 'https://example.com/image_{type}.jpg',
      defaultThumbnailImageUrl: null,
      now: () => DateTime.fromMillisecondsSinceEpoch(179999),
    );

    final thumbnailUrl = Uri.parse(url!);

    expect(
      '${thumbnailUrl.origin}${thumbnailUrl.path}',
      'https://example.com/image_360.jpg',
    );
    expect(thumbnailUrl.queryParameters['date'], '150000');
  });

  test('live thumbnail url accepts a 3 minute refresh bucket', () {
    final url = liveCardThumbnailUrl(
      thumbnailImageUrl: 'https://example.com/live.png',
      defaultThumbnailImageUrl: null,
      now: () => DateTime.fromMillisecondsSinceEpoch(179999),
      refreshInterval: const Duration(minutes: 3),
    );

    expect(Uri.parse(url!).queryParameters['date'], '0');
  });
}
