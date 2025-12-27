import 'package:flutter/material.dart';

import '../../common/constants/styles.dart';

/// An optimized network image widget for TV applications.
///
/// This widget provides:
/// - Automatic placeholder and error widgets
/// - TV-appropriate styling
/// - Memory-efficient image loading with cacheWidth/cacheHeight
///
/// NOTE: For better caching, consider adding `cached_network_image` package:
/// ```yaml
/// dependencies:
///   cached_network_image: ^3.4.1
/// ```
///
/// Example usage:
/// ```dart
/// OptimizedNetworkImage(
///   imageUrl: channel.thumbnailUrl,
///   width: 320,
///   height: 180,
/// )
/// ```
class OptimizedNetworkImage extends StatelessWidget {
  /// The URL of the image to load.
  final String imageUrl;

  /// The width of the image widget.
  final double? width;

  /// The height of the image widget.
  final double? height;

  /// How the image should be inscribed into the box.
  final BoxFit fit;

  /// Border radius for the image.
  final BorderRadius? borderRadius;

  /// Custom placeholder widget.
  final Widget? placeholder;

  /// Custom error widget.
  final Widget? errorWidget;

  /// Cache scale factor for high-DPI displays.
  /// Default is 2.0 for TV displays.
  final double cacheScaleFactor;

  const OptimizedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.cacheScaleFactor = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      cacheWidth: _getCacheSize(width, context),
      cacheHeight: _getCacheSize(height, context),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return _buildPlaceholder(context);
      },
      errorBuilder: (context, error, stackTrace) {
        return _buildErrorWidget(context);
      },
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }

  /// Calculates the cache size based on widget dimensions.
  int? _getCacheSize(double? dimension, BuildContext context) {
    if (dimension == null) return null;

    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    // Cap the scale factor to prevent excessive memory usage
    final effectiveScale = (pixelRatio * cacheScaleFactor).clamp(1.0, 4.0);

    return (dimension * effectiveScale).toInt();
  }

  Widget _buildPlaceholder(BuildContext context) {
    if (placeholder != null) return placeholder!;

    return Container(
      width: width,
      height: height,
      color: AppColors.greyContainerColor,
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.chzzkColor.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    if (errorWidget != null) return errorWidget!;

    return Container(
      width: width,
      height: height,
      color: AppColors.greyContainerColor,
      child: const Center(
        child: Icon(
          Icons.broken_image_outlined,
          color: AppColors.greyColor,
          size: 32,
        ),
      ),
    );
  }
}

/// A specialized image widget for channel/streamer thumbnails.
class ChannelThumbnail extends StatelessWidget {
  /// The URL of the thumbnail image.
  final String imageUrl;

  /// The size of the thumbnail (width and height).
  final double size;

  /// Whether to show a circular thumbnail.
  final bool circular;

  /// Border radius when not circular.
  final double borderRadius;

  const ChannelThumbnail({
    super.key,
    required this.imageUrl,
    this.size = 48,
    this.circular = true,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return OptimizedNetworkImage(
      imageUrl: imageUrl,
      width: size,
      height: size,
      fit: BoxFit.cover,
      borderRadius: circular
          ? BorderRadius.circular(size / 2)
          : BorderRadius.circular(borderRadius),
      placeholder: _buildPlaceholder(),
      errorWidget: _buildErrorWidget(),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.greyContainerColor,
        borderRadius: circular
            ? BorderRadius.circular(size / 2)
            : BorderRadius.circular(borderRadius),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.greyContainerColor,
        borderRadius: circular
            ? BorderRadius.circular(size / 2)
            : BorderRadius.circular(borderRadius),
      ),
      child: Icon(
        Icons.person,
        color: AppColors.greyColor,
        size: size * 0.5,
      ),
    );
  }
}

/// A specialized image widget for live stream thumbnails.
class LiveThumbnail extends StatelessWidget {
  /// The URL of the thumbnail image.
  final String imageUrl;

  /// The width of the thumbnail.
  final double width;

  /// The aspect ratio of the thumbnail (default: 16:9).
  final double aspectRatio;

  const LiveThumbnail({
    super.key,
    required this.imageUrl,
    this.width = 320,
    this.aspectRatio = 16 / 9,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: OptimizedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: width / aspectRatio,
        fit: BoxFit.cover,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

/// Utility extension for preloading images.
extension ImagePreloadExtension on BuildContext {
  /// Preloads a list of image URLs into the cache.
  ///
  /// Useful for preloading images that will be displayed soon,
  /// such as the next page of results in a list.
  Future<void> preloadImages(List<String> urls, {int limit = 10}) async {
    final limitedUrls = urls.take(limit);

    await Future.wait(
      limitedUrls.map((url) {
        return precacheImage(
          NetworkImage(url),
          this,
        ).catchError((_) {
          // Ignore preload errors - they're not critical
        });
      }),
    );
  }
}
