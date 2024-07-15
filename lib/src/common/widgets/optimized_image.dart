import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gif/gif.dart';

import '../../utils/image/image_utils.dart';
import '../constants/styles.dart';

class OptimizedNetworkImage extends StatelessWidget {
  /// A CachedNetworkImage with the cache.
  const OptimizedNetworkImage({
    super.key,
    this.useCacheKey = true,
    this.useDynamicCacheKey = false,
    this.fit = BoxFit.cover,
    this.imageHeight,
    this.imageWidth,
    required this.imageUrl,
    this.imageBuilder,
  });

  /// Set this true for updating live images, but set this false to profile images.
  final bool useCacheKey;

  /// Set this value to true if you want to change the image over time,
  final bool useDynamicCacheKey;
  final BoxFit fit;

  final double? imageHeight;
  final double? imageWidth;

  final String imageUrl;
  final Widget Function(BuildContext context, ImageProvider imageProvider)?
      imageBuilder;

  @override
  Widget build(BuildContext context) {
    final int? cacheWidth = imageWidth?.cacheSize(context);
    final int? cacheHeight = imageHeight?.cacheSize(context);

    const int updateCacheInterval =
        5; // update image every {updateCacheInterval} mins

    final String cacheKey = useDynamicCacheKey
        ? '${imageUrl}_${DateTime.now().minute ~/ updateCacheInterval}'
        : imageUrl;

    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      width: imageWidth,
      height: imageHeight,
      memCacheWidth: cacheWidth,
      memCacheHeight: cacheHeight,
      maxWidthDiskCache: cacheWidth,
      maxHeightDiskCache: cacheHeight,
      cacheKey:
          useCacheKey ? cacheKey : null, // Use cache key to update live images
      fit: fit,
      placeholder: (context, url) => SizedBox(
        width: imageWidth,
        height: imageHeight,
      ),
      errorWidget: (context, url, error) {
        return Image.network(
          imageUrl,
          cacheHeight: cacheHeight,
          cacheWidth: cacheWidth,
          fit: fit,
          width: imageWidth,
          height: imageHeight,
          errorBuilder: (context, error, stackTrace) => SizedBox(
            width: imageWidth,
            height: imageHeight,
            child: const Center(
              child: Text(
                '오류',
                style: TextStyle(
                  fontSize: 11.0,
                  color: AppColors.redColor,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class OptimizedAssetImage extends StatelessWidget {
  /// An optimized asset image with cache.
  const OptimizedAssetImage({
    super.key,
    required this.imagePath,
    required this.imageWidth,
    this.imageHeight,
    this.fit = BoxFit.cover,
  });

  final String imagePath;
  final double imageWidth;
  final double? imageHeight;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final int cacheWidth = imageWidth.cacheSize(context);
    final int? cacheHeight = imageHeight?.cacheSize(context);

    return Image.asset(
      imagePath,
      width: imageWidth,
      height: imageHeight,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => SizedBox(
        width: imageWidth,
        height: imageHeight,
        child: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Center(
            child: Text(
              '오류',
              style: TextStyle(
                fontSize: 10.0,
                color: AppColors.redColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OptimizedGifImage extends StatelessWidget {
  const OptimizedGifImage({
    super.key,
    required this.image,
    this.controller,
    this.imageWidth,
    this.imageHeight,
    this.autostart = Autostart.loop,
    this.useCache = false,
    this.fps,
    this.fit = BoxFit.cover,
  });

  final ImageProvider image;
  final GifController? controller;
  final double? imageWidth;
  final double? imageHeight;
  final Autostart autostart;
  final bool useCache;
  final BoxFit fit;
  final int? fps;

  @override
  Widget build(BuildContext context) {
    return Gif(
      controller: controller,
      autostart: autostart,
      useCache: useCache,
      image: image,
      width: imageWidth,
      height: imageHeight,
      fps: fps,
      fit: fit,
      placeholder: (context) => SizedBox(
        height: imageHeight,
        width: imageWidth,
      ),
    );
  }
}
