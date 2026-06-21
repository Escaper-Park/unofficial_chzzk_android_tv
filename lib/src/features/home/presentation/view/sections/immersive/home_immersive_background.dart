import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../../live/domain/entities/live_feed.dart';
import '../../../../../live/presentation/view/shared/live_card_thumbnail_url.dart';
import 'home_immersive_list_exports.dart';

part 'home_immersive_background_image_load.dart';
part 'home_immersive_background_image_provider.dart';
part 'home_immersive_background_image_resolver.dart';
part 'home_immersive_background_stack.dart';

class HomeImmersiveBackground extends StatefulWidget {
  const HomeImmersiveBackground({
    super.key,
    required this.item,
  });

  final Live item;

  @override
  State<HomeImmersiveBackground> createState() =>
      _HomeImmersiveBackgroundState();
}

class _HomeImmersiveBackgroundState extends State<HomeImmersiveBackground> {
  ImageProvider<Object>? _thumbnailProvider;
  ImageProvider<Object>? _adultOverlayProvider;
  final _pendingImageLoads = <_PendingImageLoad>{};
  int? _requestKey;
  var _loadGeneration = 0;
  var _ready = false;
  var _showThumbnail = false;
  var _showAdultOverlay = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadImages();
  }

  @override
  void didUpdateWidget(HomeImmersiveBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item == widget.item) {
      return;
    }

    _loadImages();
  }

  @override
  void dispose() {
    _loadGeneration += 1;
    _cancelPendingImageLoads();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const SizedBox.expand();
    }

    return _HomeImmersiveBackgroundStack(
      thumbnailProvider: _thumbnailProvider,
      adultOverlayProvider: _adultOverlayProvider,
      showThumbnail: _showThumbnail,
      showAdultOverlay: _showAdultOverlay,
    );
  }

  void _loadImages() {
    final devicePixelRatio = MediaQuery.maybeOf(context)?.devicePixelRatio ?? 1;
    final thumbnailUrl = liveCardThumbnailUrl(
      thumbnailImageUrl: widget.item.thumbnailImageUrl,
      defaultThumbnailImageUrl: widget.item.defaultThumbnailImageUrl,
    );
    final requestKey = Object.hash(
      thumbnailUrl,
      widget.item.adult,
      devicePixelRatio,
    );

    if (_requestKey == requestKey) {
      return;
    }

    _cancelPendingImageLoads();

    const scrimProvider = AssetImage(TvScrim.homeImmersiveAsset);
    final thumbnailProvider = thumbnailUrl == null
        ? null
        : _resizedHomeImmersiveProvider(
            NetworkImage(thumbnailUrl),
            devicePixelRatio,
          );
    final adultOverlayProvider = widget.item.adult
        ? _resizedHomeImmersiveProvider(
            const AssetImage(TvMediaCardDesign.ageRestrictionOverlayAsset),
            devicePixelRatio,
          )
        : null;
    final imageConfiguration = createLocalImageConfiguration(
      context,
      size: HomeImmersiveListDesign.thumbnailSize,
    );

    _requestKey = requestKey;
    _ready = false;
    _showThumbnail = false;
    _showAdultOverlay = false;
    _thumbnailProvider = thumbnailProvider;
    _adultOverlayProvider = adultOverlayProvider;

    if (thumbnailProvider == null && adultOverlayProvider == null) {
      _ready = true;
      return;
    }

    final generation = _loadGeneration + 1;
    _loadGeneration = generation;
    unawaited(
      _resolveImages(
        generation: generation,
        imageConfiguration: imageConfiguration,
        scrimProvider: scrimProvider,
        thumbnailProvider: thumbnailProvider,
        adultOverlayProvider: adultOverlayProvider,
      ),
    );
  }

  void _markResolvedImagesReady({
    required bool thumbnailLoaded,
    required bool adultOverlayLoaded,
  }) {
    setState(() {
      _ready = true;
      _showThumbnail = thumbnailLoaded;
      _showAdultOverlay = adultOverlayLoaded;
    });
  }
}
