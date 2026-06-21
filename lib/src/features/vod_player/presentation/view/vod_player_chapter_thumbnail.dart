import 'package:flutter/material.dart';

import '../../../../core/ui/ui.dart';
import 'vod_player_controls_overlay_design.dart';

class VodPlayerChapterThumbnail extends StatelessWidget {
  const VodPlayerChapterThumbnail({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final normalizedUrl = imageUrl?.trim();
    final placeholder = DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(
          VodPlayerControlsOverlayDesign.chapterThumbnailRadius,
        ),
      ),
      child: const Center(
        child: Icon(Icons.movie_filter_outlined, size: 30),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(
        VodPlayerControlsOverlayDesign.chapterThumbnailRadius,
      ),
      child: SizedBox(
        width: VodPlayerControlsOverlayDesign.chapterThumbnailWidth,
        height: VodPlayerControlsOverlayDesign.chapterThumbnailHeight,
        child: normalizedUrl == null || normalizedUrl.isEmpty
            ? placeholder
            : OptimizedImage.network(
                normalizedUrl,
                width: VodPlayerControlsOverlayDesign.chapterThumbnailWidth,
                height: VodPlayerControlsOverlayDesign.chapterThumbnailHeight,
                fit: BoxFit.cover,
                placeholder: placeholder,
                errorFallback: placeholder,
              ),
      ),
    );
  }
}
