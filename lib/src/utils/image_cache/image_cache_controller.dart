import 'package:flutter/material.dart';

/// Global Image cache. Must add Uniquekey in a image.
class ImageCacheController extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() {
    ImageCache imageCache = super.createImageCache();

    imageCache.maximumSizeBytes = 250 * 1024 * 1024; // 250 mb

    return imageCache;
  }
}
