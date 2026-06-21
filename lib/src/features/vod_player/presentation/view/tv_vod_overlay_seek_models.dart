part of 'tv_vod_overlay_playback_info.dart';

class TvVodOverlaySeekChapter {
  const TvVodOverlaySeekChapter({
    required this.title,
    required this.start,
    required this.end,
    this.thumbnailUrl,
  });

  final String title;
  final Duration start;
  final Duration end;
  final String? thumbnailUrl;
}

enum TvVodOverlaySeekThumbnailIndexMode {
  ratio,
  absoluteTimestamp,
}

typedef TvVodOverlaySeekFeedbackCallback =
    void Function({required bool forward, required Duration position});

class TvVodOverlaySeekThumbnail {
  const TvVodOverlaySeekThumbnail({
    required this.source,
    this.sourcePatternType = 'sequence_pattern',
    this.indexPlaceholder = '#',
    this.indexMode = TvVodOverlaySeekThumbnailIndexMode.ratio,
    this.totalPage = 0,
    this.rowCount = 0,
    this.columnCount = 0,
    this.intervalMilliseconds = 0,
    this.thumbnailWidth = 0,
    this.thumbnailHeight = 0,
    this.allThumbnailCount = 0,
    this.baseTimeMilliseconds,
  });

  final String source;
  final String sourcePatternType;
  final String indexPlaceholder;
  final TvVodOverlaySeekThumbnailIndexMode indexMode;
  final int totalPage;
  final int rowCount;
  final int columnCount;
  final int intervalMilliseconds;
  final int thumbnailWidth;
  final int thumbnailHeight;
  final int allThumbnailCount;
  final int? baseTimeMilliseconds;
}
