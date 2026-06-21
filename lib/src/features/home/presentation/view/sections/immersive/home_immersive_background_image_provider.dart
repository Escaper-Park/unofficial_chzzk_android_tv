part of 'home_immersive_background.dart';

ImageProvider<Object> _resizedHomeImmersiveProvider(
  ImageProvider<Object> provider,
  double devicePixelRatio,
) {
  final cacheWidth = _homeImmersiveCacheSize(
    HomeImmersiveListDesign.thumbnailSize.width,
    devicePixelRatio,
  );
  final cacheHeight = _homeImmersiveCacheSize(
    HomeImmersiveListDesign.thumbnailSize.height,
    devicePixelRatio,
  );

  return ResizeImage.resizeIfNeeded(cacheWidth, cacheHeight, provider);
}

int? _homeImmersiveCacheSize(double value, double devicePixelRatio) {
  if (!value.isFinite || value <= 0) {
    return null;
  }

  return math.max(1, (value * devicePixelRatio).ceil());
}
