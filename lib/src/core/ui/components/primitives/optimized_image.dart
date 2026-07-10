import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'bucketed_image_stream_retainer.dart';

/// Displays asset and network images with explicit layout and decode sizes.
class OptimizedImage extends StatelessWidget {
  const OptimizedImage.asset(
    String assetPath, {
    super.key,
    required this.width,
    required this.height,
    this.fit = _OptimizedImageDesign.fit,
    this.alignment = _OptimizedImageDesign.alignment,
    this.placeholder,
    this.errorFallback,
  }) : _assetPath = assetPath,
       _networkUrl = null,
       headers = null,
       streamRetainer = null,
       assert(width > 0, 'width must be greater than zero.'),
       assert(height > 0, 'height must be greater than zero.');

  const OptimizedImage.network(
    String url, {
    super.key,
    required this.width,
    required this.height,
    this.fit = _OptimizedImageDesign.fit,
    this.alignment = _OptimizedImageDesign.alignment,
    this.placeholder,
    this.errorFallback,
    this.headers,
    this.streamRetainer,
  }) : _assetPath = null,
       _networkUrl = url,
       assert(width > 0, 'width must be greater than zero.'),
       assert(height > 0, 'height must be greater than zero.');

  final double width;
  final double height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Widget? placeholder;
  final Widget? errorFallback;
  final Map<String, String>? headers;
  final BucketedImageStreamRetainer? streamRetainer;

  final String? _assetPath;
  final String? _networkUrl;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: _imageProvider(context),
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      filterQuality: _OptimizedImageDesign.filterQuality,
      frameBuilder: _buildFrame,
      errorBuilder: _buildError,
    );
  }

  ImageProvider<Object> _imageProvider(BuildContext context) {
    final provider = _rawImageProvider();
    final devicePixelRatio = _decodePixelRatio(
      MediaQuery.maybeOf(context)?.devicePixelRatio ?? 1,
    );
    final cacheWidth = _cacheSize(width, devicePixelRatio);
    final cacheHeight = _cacheSize(height, devicePixelRatio);

    final resizedProvider = ResizeImage.resizeIfNeeded(
      cacheWidth,
      cacheHeight,
      provider,
    );
    return streamRetainer?.retain(resizedProvider) ?? resizedProvider;
  }

  ImageProvider<Object> _rawImageProvider() {
    final assetPath = _assetPath;
    if (assetPath != null) {
      return AssetImage(assetPath);
    }

    return NetworkImage(_networkUrl!, headers: headers);
  }

  Widget _buildFrame(
    BuildContext context,
    Widget child,
    int? frame,
    bool wasSynchronouslyLoaded,
  ) {
    if (frame != null || wasSynchronouslyLoaded) {
      return child;
    }

    return _sizedSlot(placeholder);
  }

  Widget _buildError(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    return _sizedSlot(errorFallback);
  }

  Widget _sizedSlot(Widget? child) {
    return SizedBox(width: width, height: height, child: child);
  }

  int? _cacheSize(double value, double devicePixelRatio) {
    if (!value.isFinite || value <= 0) {
      return null;
    }

    return math.max(1, (value * devicePixelRatio).ceil());
  }

  double _decodePixelRatio(double devicePixelRatio) {
    if (!devicePixelRatio.isFinite || devicePixelRatio <= 0) {
      return 1;
    }

    return math.min(
      devicePixelRatio,
      _OptimizedImageDesign.maximumDecodePixelRatio,
    );
  }
}

abstract final class _OptimizedImageDesign {
  static const fit = BoxFit.cover;
  static const alignment = Alignment.center;
  static const filterQuality = FilterQuality.low;
  static const maximumDecodePixelRatio = 2.0;
}
