import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../../utils/image/image_utils.dart';
import '../constants/styles.dart';
import 'center_widgets.dart';

class OptimizedNetworkImage extends StatelessWidget {
  const OptimizedNetworkImage({
    super.key,
    required this.imageUrl,
    this.imageWidth,
    this.imageHeight,
    this.useUpdatedImage = false,
    this.updateCacheIntervalMin = 5,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;

  /// The Width of the image to be displayed.
  final double? imageWidth;

  /// The Height of the image to be displayed.
  final double? imageHeight;

  /// Set this true for changing images over time.
  ///
  /// Default value is [false].
  final bool useUpdatedImage;

  /// Default value is [BoxFit.cover].
  final BoxFit fit;

  /// If useCachekey and useDynamicCacheKey is true, image is updated according to this value.
  ///
  /// Default value is [5] mins.
  final int updateCacheIntervalMin;

  @override
  Widget build(BuildContext context) {
    // To prevent memory leaking, resize image with cacheSize.
    // final int? cacheWidth = imageWidth?.cacheSize(context);
    // final int? cacheHeight = imageWidth?.cacheSize(context);

    final String url = useUpdatedImage
        ? '$imageUrl/?v=${DateTime.now().minute ~/ updateCacheIntervalMin}'
        : imageUrl;

    return Container(
      // key: useUpdatedImage ? ValueKey(url) : null,
      width: imageWidth,
      height: imageHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: fit,
          image: ResizeImage(
            NetworkImage(url),
            policy: ResizeImagePolicy.fit,
            height: (imageHeight! * 2).floor(),
            width: (imageWidth! * 2).floor(),
            // height: imageHeight!.floor(),
            // width: imageWidth!.floor(),
          ),
        ),
      ),
    );

    // Image.network(
    //   // key: useDynamicCacheKey ? ValueKey(cacheKey) : null,
    //   imageUrl,
    //   width: imageWidth,
    //   height: imageHeight,
    //   cacheWidth: cacheWidth,
    //   cacheHeight: cacheHeight,
    //   fit: fit,
    //   errorBuilder: (_, __, ___) => _ImageErrorPlaceholder(
    //     imageWidth: imageWidth,
    //     imageHeight: imageHeight,
    //   ),
    //   loadingBuilder: (_, __, ___) => SizedBox(
    //     width: imageWidth,
    //     height: imageHeight,
    //   ),
    // );
  }
}

// class OptimizedCachedNetworkImage extends StatelessWidget {
//   /// An optimized network image using cache.
//   const OptimizedCachedNetworkImage({
//     super.key,
//     required this.imageUrl,
//     this.imageWidth,
//     this.imageHeight,
//     this.imageBuilder,
//     this.useCacheKey = true,
//     this.useDynamicCacheKey = false,
//     this.fit = BoxFit.cover,
//     this.updateCacheIntervalMin = 5,
//   }) : assert(imageWidth != null || imageHeight != null,
//             'Either imageWidth or imageHeight must be non-null');

//   final String imageUrl;

//   /// Optional builder to customize the display of the image.
//   final Widget Function(BuildContext context, ImageProvider imageProvider)?
//       imageBuilder;

//   /// The Width of the image to be displayed.
//   final double? imageWidth;

//   /// The Height of the image to be displayed.
//   final double? imageHeight;

//   /// Set this true for updating live images.
//   final bool useCacheKey;

//   /// Set this true for changing images over time.
//   ///
//   /// Default value is [false].
//   final bool useDynamicCacheKey;

//   /// Default value is [BoxFit.cover].
//   final BoxFit fit;

//   /// If useCachekey and useDynamicCacheKey is true, image is updated according to this value.
//   ///
//   /// Default value is [5] mins.
//   final int updateCacheIntervalMin;

//   @override
//   Widget build(BuildContext context) {
//     // To prevent memory leaking, resize image with cacheSize.
//     final int? cacheWidth = imageWidth?.cacheSize(context);
//     final int? cacheHeight = imageWidth?.cacheSize(context);

//     final String cacheKey = useDynamicCacheKey
//         ? '${imageUrl}_${DateTime.now().minute ~/ updateCacheIntervalMin}'
//         : imageUrl;

//     if (useDynamicCacheKey) {
//       // Remove old cache data.
//       CachedNetworkImage.evictFromCache(
//           '${imageUrl}_${(DateTime.now().minute ~/ updateCacheIntervalMin) - 1}');
//     }

//     return CachedNetworkImage(
//       imageUrl: imageUrl,
//       imageBuilder: imageBuilder,
//       cacheKey: useCacheKey ? cacheKey : null,
//       memCacheWidth: cacheWidth,
//       memCacheHeight: cacheHeight,
//       maxWidthDiskCache: cacheWidth,
//       maxHeightDiskCache: cacheHeight,
//       fit: fit,
//       placeholder: (context, url) => SizedBox(
//         width: imageWidth,
//         height: imageHeight,
//       ),
//       errorWidget: (context, url, error) {
//         return _loadingNetworkImageFallback();
//       },
//     );
//   }

//   /// If there is a problem with CachedNetworkImage package,
//   /// try loading network image again with the flutter's embedded [Image] widget.
//   Widget _loadingNetworkImageFallback() {
//     return OptimizedNetworkImage(
//       imageUrl: imageUrl,
//       useUpdatedImage: useDynamicCacheKey,
//       fit: fit,
//     );
//   }
// }

class OptimizedAssetImage extends StatelessWidget {
  /// An optimized asset image using cache.
  const OptimizedAssetImage({
    super.key,
    required this.imagePath,
    this.imageWidth,
    this.imageHeight,
    this.fit = BoxFit.cover,
  }) : assert(imageWidth != null || imageHeight != null,
            'Either imageWidth or imageHeight must be non-null');

  final String imagePath;

  /// The Width of the image to be displayed.
  final double? imageWidth;

  /// The Height of the image to be displayed.
  final double? imageHeight;

  /// Default value is [BoxFit.cover].
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    // To prevent memory leaking, resize image with cacheSize.
    final int? cacheWidth = imageWidth?.cacheSize(context);
    final int? cacheHeight = imageHeight?.cacheSize(context);

    return Image.asset(
      imagePath,
      width: imageWidth,
      height: imageHeight,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      errorBuilder: (_, __, ___) => _ImageErrorPlaceholder(
        imageWidth: imageWidth,
        imageHeight: imageHeight,
      ),
    );
  }
}

class OptimizedGifImage extends StatelessWidget {
  const OptimizedGifImage({
    super.key,
    required this.image,
    this.controller,
    this.imageHeight,
    this.imageWidth,
    this.autostart = Autostart.loop,
    this.useCache = true,
    this.fps,
    this.fit = BoxFit.cover,
  }) : assert(imageWidth != null || imageHeight != null,
            'Either imageWidth or imageHeight must be non-null');

  /// Image provider like a [NetworkImage], [AssetImage].
  final ImageProvider image;

  /// An animation controller protects duration.
  ///
  /// If you don't use duration, don't use it.
  final GifController? controller;

  final double? imageHeight;
  final double? imageWidth;

  /// Type of gif image behaviors. Default value is [Autostart.loop].
  final Autostart autostart;

  /// If this value is true, use cache with cacheKey.
  ///
  /// If provider is NetworkImage, key is image url.
  final bool useCache;

  /// If fps is null, the original gif framerate will be used.
  final int? fps;

  /// Default value is [BoxFit.cover].
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Gif(
      controller: controller,
      autostart: autostart,
      useCache: useCache,
      width: imageWidth,
      height: imageHeight,
      fps: fps,
      fit: fit,
      image: image,
      placeholder: (context) => SizedBox(
        height: imageHeight,
        width: imageWidth,
      ),
    );
  }
}

class _ImageErrorPlaceholder extends StatelessWidget {
  /// Show error state of image
  const _ImageErrorPlaceholder({
    required this.imageWidth,
    required this.imageHeight,
  }) : assert(imageWidth != null || imageHeight != null,
            'Either imageWidth or imageHeight must be non-null');

  final double? imageWidth;
  final double? imageHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: const FittedBox(
        fit: BoxFit.scaleDown,
        child: CenteredText(
          text: '이미지 로딩 오류',
          fontSize: 11.0,
          fontColor: AppColors.redColor,
        ),
      ),
    );
  }
}
