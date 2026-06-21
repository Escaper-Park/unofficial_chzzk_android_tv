part of 'tv_vod_overlay_playback_info.dart';

class _TvVodSeekPreviewThumbnail extends StatelessWidget {
  const _TvVodSeekPreviewThumbnail({
    required this.tile,
    required this.placeholder,
  });

  final _SeekThumbnailTile? tile;
  final Widget placeholder;

  @override
  Widget build(BuildContext context) {
    final tile = this.tile;
    if (tile == null) {
      return placeholder;
    }

    final previewWidth =
        TvPlayerOverlayControlsDesign.vodSeekPreviewThumbnailWidth;
    final previewHeight =
        TvPlayerOverlayControlsDesign.vodSeekPreviewThumbnailHeight;
    final scaleX = previewWidth / tile.sourceWidth;
    final scaleY = previewHeight / tile.sourceHeight;

    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Positioned(
          key: const ValueKey('vod-overlay-seek-preview-thumbnail-sprite'),
          left: -tile.sourceX * scaleX,
          top: -tile.sourceY * scaleY,
          width: tile.sheetWidth * scaleX,
          height: tile.sheetHeight * scaleY,
          child: OptimizedImage.network(
            tile.imageUrl,
            key: const ValueKey('vod-overlay-seek-preview-thumbnail-image'),
            width: tile.sheetWidth * scaleX,
            height: tile.sheetHeight * scaleY,
            fit: BoxFit.fill,
            errorFallback: placeholder,
          ),
        ),
      ],
    );
  }
}
