import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  group('chzzkImageUrlWithType', () {
    test('adds the CDN type query to supported image hosts', () {
      final url = chzzkImageUrlWithType(
        'https://ssl.pstatic.net/static/chzzk/profile.jpg?foo=bar#fragment',
        ChzzkImageVariant.profileAvatar,
      );

      expect(
        url,
        'https://ssl.pstatic.net/static/chzzk/profile.jpg?foo=bar&type=f120_120_na',
      );
    });

    test('replaces the CDN type placeholder when present', () {
      final url = chzzkImageUrlWithType(
        'https://nng-phinf.pstatic.net/image_{type}.jpg',
        ChzzkImageVariant.categoryPoster,
      );

      expect(url, 'https://nng-phinf.pstatic.net/image_w375.jpg');
    });

    test('leaves unsupported hosts unchanged', () {
      const url = 'https://example.com/image.jpg';

      expect(chzzkImageUrlWithType(url, ChzzkImageVariant.profileAvatar), url);
    });
  });
}
