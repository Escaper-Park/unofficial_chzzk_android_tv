part of 'tv_vod_overlay_playback_info.dart';

class _TvVodSeekPreview extends StatelessWidget {
  const _TvVodSeekPreview({
    required this.chapter,
    required this.position,
    required this.duration,
    required this.seekThumbnail,
    required this.timeTextBuilder,
  });

  final TvVodOverlaySeekChapter? chapter;
  final Duration position;
  final Duration duration;
  final TvVodOverlaySeekThumbnail? seekThumbnail;
  final String Function(Duration duration) timeTextBuilder;

  @override
  Widget build(BuildContext context) {
    final tile = _seekThumbnailTile(
      thumbnail: seekThumbnail,
      position: position,
      duration: duration,
    );
    final chapterTitle = _chapterTitle(chapter);
    final placeholder = DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(
          TvPlayerOverlayControlsDesign.vodSeekPreviewThumbnailRadius,
        ),
      ),
      child: const Center(
        child: Icon(Icons.movie_filter_outlined, size: 24),
      ),
    );

    return IgnorePointer(
      child: SizedBox(
        key: const ValueKey('vod-overlay-seek-preview'),
        width: TvPlayerOverlayControlsDesign.vodSeekPreviewWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                TvPlayerOverlayControlsDesign.vodSeekPreviewThumbnailRadius,
              ),
              child: DecoratedBox(
                key: const ValueKey('vod-overlay-seek-preview-thumbnail'),
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    TvPlayerOverlayControlsDesign.vodSeekPreviewThumbnailRadius,
                  ),
                  border: Border.all(
                    color: TvPlayerOverlayControlsDesign
                        .vodSeekPreviewThumbnailBorderColor,
                    width: TvPlayerOverlayControlsDesign
                        .vodSeekPreviewThumbnailBorderWidth,
                  ),
                ),
                child: SizedBox(
                  key: const ValueKey(
                    'vod-overlay-seek-preview-thumbnail-content',
                  ),
                  width: TvPlayerOverlayControlsDesign
                      .vodSeekPreviewThumbnailWidth,
                  height: TvPlayerOverlayControlsDesign
                      .vodSeekPreviewThumbnailHeight,
                  child: _TvVodSeekPreviewThumbnail(
                    tile: tile,
                    placeholder: placeholder,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: TvPlayerOverlayControlsDesign.vodSeekPreviewGap,
            ),
            if (chapterTitle != null) ...[
              _TvVodSeekPreviewLabel(
                backgroundKey: const ValueKey(
                  'vod-overlay-seek-preview-title-background',
                ),
                text: chapterTitle,
                maxLines: 2,
                style: TvPlayerOverlayControlsDesign.seekPreviewTitleTextStyle(
                  context,
                ),
              ),
              const SizedBox(
                height: TvPlayerOverlayControlsDesign.vodSeekPreviewGap,
              ),
            ],
            _TvVodSeekPreviewLabel(
              backgroundKey: const ValueKey(
                'vod-overlay-seek-preview-time-background',
              ),
              text: timeTextBuilder(position),
              maxLines: 1,
              style: TvPlayerOverlayControlsDesign.seekPreviewTimeTextStyle(
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
