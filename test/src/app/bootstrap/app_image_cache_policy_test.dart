import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/app/bootstrap/app_image_cache_policy.dart';

void main() {
  testWidgets('configureAppImageCache applies bounded cache limits', (
    tester,
  ) async {
    final cache = PaintingBinding.instance.imageCache;
    final previousMaximumSize = cache.maximumSize;
    final previousMaximumSizeBytes = cache.maximumSizeBytes;
    addTearDown(() {
      cache
        ..maximumSize = previousMaximumSize
        ..maximumSizeBytes = previousMaximumSizeBytes
        ..clear()
        ..clearLiveImages();
    });

    configureAppImageCache(imageCache: cache);

    expect(cache.maximumSize, appImageCacheMaximumSize);
    expect(cache.maximumSizeBytes, appImageCacheMaximumSizeBytes);
  });
}
