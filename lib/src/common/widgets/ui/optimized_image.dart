import 'package:flutter/material.dart';

import 'ui_widgets.dart' show CenteredText;
import '../../constants/styles.dart' show AppColors;
import '../../../utils/extensions/custom_extensions.dart';

class OptimizedNetworkImage extends StatelessWidget {
  /// A network image widget using the cache.
  const OptimizedNetworkImage({
    super.key,
    required this.imageUrl,
    this.imageWidth,
    this.imageHeight,
    this.fit = BoxFit.cover,
    this.useLatestThumbnail = false,
    this.imageUpdateMin = 3,
  });

  final String imageUrl;

  /// The width of the image to be displayed.
  final double? imageWidth;

  /// The height of the image to be displayed.
  final double? imageHeight;

  /// Default value is [BoxFit.cover].
  final BoxFit fit;

  /// Use latest thumbnail image.
  final bool useLatestThumbnail;

  final int imageUpdateMin;

  @override
  Widget build(BuildContext context) {
    /// Based on chzzk server time.
    final nowUtc = DateTime.now().toUtc();

    // .millisecondsSinceEpoch;
    // update every 3 mins.
    final flooredMin = (nowUtc.minute ~/ imageUpdateMin) * imageUpdateMin;
    final truncatedDateTime = DateTime.utc(
      nowUtc.year,
      nowUtc.month,
      nowUtc.day,
      nowUtc.hour,
      flooredMin,
      0,
      0,
    );

    final adjustDateTime = truncatedDateTime.millisecondsSinceEpoch;

    final String url =
        useLatestThumbnail ? '$imageUrl?date=$adjustDateTime' : imageUrl;

    return Container(
      width: imageWidth,
      height: imageHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: fit,
          image: ResizeImage(
            NetworkImage(url),
            policy: ResizeImagePolicy.fit,
            height: imageHeight == null ? null : (imageHeight! * 2).floor(),
            width: imageWidth == null ? null : (imageWidth! * 2).floor(),
          ),
          onError: (_, __) => _ImageErrorPlaceholder(
            imageWidth: imageWidth,
            imageHeight: imageHeight,
          ),
        ),
      ),
    );
  }
}

class OptimizedAssetImage extends StatelessWidget {
  /// An optimized asset image using the cache.
  const OptimizedAssetImage({
    super.key,
    required this.imagePath,
    this.imageWidth,
    this.imageHeight,
    this.fit = BoxFit.cover,
  }) : assert(
          imageWidth != null || imageHeight != null,
          'Either imageWidth or imageHeight must be non-null',
        );

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

class _ImageErrorPlaceholder extends StatelessWidget {
  /// Display error state of image.
  const _ImageErrorPlaceholder({
    required this.imageWidth,
    required this.imageHeight,
  }) : assert(
          imageWidth != null || imageHeight != null,
          'Either imageWidth or imageHeight must be non-null',
        );

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
