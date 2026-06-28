import 'package:flutter/painting.dart';

const appImageCacheMaximumSize = 300;
const appImageCacheMaximumSizeBytes = 48 * 1024 * 1024;

void configureAppImageCache({ImageCache? imageCache}) {
  (imageCache ?? PaintingBinding.instance.imageCache)
    ..maximumSize = appImageCacheMaximumSize
    ..maximumSizeBytes = appImageCacheMaximumSizeBytes;
}
