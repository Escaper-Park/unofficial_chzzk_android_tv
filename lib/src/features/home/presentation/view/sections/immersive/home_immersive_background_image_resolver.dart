part of 'home_immersive_background.dart';

extension _HomeImmersiveBackgroundImageResolver
    on _HomeImmersiveBackgroundState {
  Future<void> _resolveImages({
    required int generation,
    required ImageConfiguration imageConfiguration,
    required ImageProvider<Object> scrimProvider,
    required ImageProvider<Object>? thumbnailProvider,
    required ImageProvider<Object>? adultOverlayProvider,
  }) async {
    await _resolveImage(scrimProvider, imageConfiguration);

    if (!mounted || generation != _loadGeneration) {
      return;
    }

    var thumbnailLoaded = false;
    var adultOverlayLoaded = false;

    if (thumbnailProvider != null) {
      thumbnailLoaded = await _resolveImage(
        thumbnailProvider,
        imageConfiguration,
      );
    }

    if (!mounted || generation != _loadGeneration) {
      return;
    }

    if (adultOverlayProvider != null) {
      adultOverlayLoaded = await _resolveImage(
        adultOverlayProvider,
        imageConfiguration,
      );
    }

    if (!mounted || generation != _loadGeneration) {
      return;
    }

    _markResolvedImagesReady(
      thumbnailLoaded: thumbnailLoaded,
      adultOverlayLoaded: adultOverlayLoaded,
    );
  }

  Future<bool> _resolveImage(
    ImageProvider<Object> provider,
    ImageConfiguration configuration,
  ) {
    final completer = Completer<bool>();
    final stream = provider.resolve(configuration);
    late final ImageStreamListener listener;
    late final _PendingImageLoad load;

    void complete({required bool loaded}) {
      if (!_pendingImageLoads.remove(load)) {
        return;
      }

      stream.removeListener(listener);
      if (!completer.isCompleted) {
        completer.complete(loaded);
      }
    }

    listener = ImageStreamListener(
      (_, _) => complete(loaded: true),
      onError: (_, _) => complete(loaded: false),
    );
    load = _PendingImageLoad(
      stream: stream,
      listener: listener,
      completer: completer,
    );
    _pendingImageLoads.add(load);
    stream.addListener(listener);

    return completer.future;
  }

  void _cancelPendingImageLoads() {
    for (final load in _pendingImageLoads.toList()) {
      _pendingImageLoads.remove(load);
      load.cancel();
    }
  }
}
