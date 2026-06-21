part of 'vod_player_controls_overlay.dart';

List<TvVodOverlaySeekChapter> _seekChapters(List<VodChapter> chapters) {
  return [
    for (final chapter in chapters)
      TvVodOverlaySeekChapter(
        title: chapter.title,
        start: _chapterTime(chapter.startTime),
        end: _chapterTime(chapter.endTime),
        thumbnailUrl: chapter.thumbnailUrl,
      ),
  ];
}

TvVodOverlaySeekThumbnail? _seekThumbnail(VodSeekThumbnail? thumbnail) {
  if (thumbnail == null) {
    return null;
  }

  return TvVodOverlaySeekThumbnail(
    source: thumbnail.source,
    sourcePatternType: thumbnail.sourcePatternType,
    indexPlaceholder: thumbnail.indexPlaceholder,
    indexMode: _seekThumbnailIndexMode(thumbnail.indexMode),
    totalPage: thumbnail.totalPage,
    rowCount: thumbnail.rowCount,
    columnCount: thumbnail.columnCount,
    intervalMilliseconds: thumbnail.intervalMilliseconds,
    thumbnailWidth: thumbnail.thumbnailWidth,
    thumbnailHeight: thumbnail.thumbnailHeight,
    allThumbnailCount: thumbnail.allThumbnailCount,
    baseTimeMilliseconds: thumbnail.baseTimeMilliseconds,
  );
}

TvVodOverlaySeekThumbnailIndexMode _seekThumbnailIndexMode(
  VodSeekThumbnailIndexMode mode,
) {
  return switch (mode) {
    VodSeekThumbnailIndexMode.ratio => TvVodOverlaySeekThumbnailIndexMode.ratio,
    VodSeekThumbnailIndexMode.absoluteTimestamp =>
      TvVodOverlaySeekThumbnailIndexMode.absoluteTimestamp,
  };
}

Duration _chapterTime(int milliseconds) {
  return Duration(milliseconds: milliseconds < 0 ? 0 : milliseconds);
}
