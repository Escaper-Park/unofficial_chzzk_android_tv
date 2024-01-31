import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OptimizedCachedNetworkImage extends StatelessWidget {
  ///
  const OptimizedCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageBuilder,
  });

  final String imageUrl;
  final double imageWidth;
  final Widget Function(BuildContext context, ImageProvider imageProvider)
      imageBuilder;

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final int cacheSize = (imageWidth * devicePixelRatio).round();

    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      maxWidthDiskCache: cacheSize,
      memCacheWidth: cacheSize,
      placeholder: (context, url) => SizedBox(width: imageWidth),
    );
  }
}

class OptimizedTempNetworkImage extends StatelessWidget {
  const OptimizedTempNetworkImage({
    super.key,
    required this.imageUrl,
    required this.imageWidth,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double imageWidth;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final int cacheSize = (imageWidth * devicePixelRatio).round();

    return Image.network(
      imageUrl,
      cacheWidth: cacheSize,
      fit: fit,
    );
  }
}

class OptimizedAssetImage extends StatelessWidget {
  const OptimizedAssetImage({
    super.key,
    required this.imagePath,
    required this.imageWidth,
    this.fit = BoxFit.cover,
  });

  final String imagePath;
  final double imageWidth;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final int cacheSize = (imageWidth * devicePixelRatio).round();

    return Image.asset(
      imagePath,
      width: imageWidth,
      cacheWidth: cacheSize,
      fit: fit,
    );
  }
}
