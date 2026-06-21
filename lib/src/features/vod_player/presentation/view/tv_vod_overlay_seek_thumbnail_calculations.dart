part of 'tv_vod_overlay_playback_info.dart';

final class _SeekThumbnailTile {
  const _SeekThumbnailTile({
    required this.imageUrl,
    required this.sourceX,
    required this.sourceY,
    required this.sourceWidth,
    required this.sourceHeight,
    required this.sheetWidth,
    required this.sheetHeight,
  });

  final String imageUrl;
  final double sourceX;
  final double sourceY;
  final double sourceWidth;
  final double sourceHeight;
  final double sheetWidth;
  final double sheetHeight;
}

_SeekThumbnailTile? _seekThumbnailTile({
  required TvVodOverlaySeekThumbnail? thumbnail,
  required Duration position,
  required Duration duration,
}) {
  final source = _trimmedOrNull(thumbnail?.source);
  if (thumbnail == null ||
      source == null ||
      thumbnail.rowCount <= 0 ||
      thumbnail.columnCount <= 0 ||
      thumbnail.thumbnailWidth <= 0 ||
      thumbnail.thumbnailHeight <= 0) {
    return null;
  }

  return switch (thumbnail.indexMode) {
    TvVodOverlaySeekThumbnailIndexMode.ratio =>
      _ratioSeekThumbnailTileForPosition(
        thumbnail: thumbnail,
        source: source,
        position: position,
        duration: duration,
      ),
    TvVodOverlaySeekThumbnailIndexMode.absoluteTimestamp =>
      _absoluteTimestampSeekThumbnailTileForPosition(
        thumbnail: thumbnail,
        source: source,
        position: position,
      ),
  };
}

_SeekThumbnailTile _seekThumbnailTileForGrid({
  required String imageUrl,
  required TvVodOverlaySeekThumbnail thumbnail,
  required int tileColumn,
  required int tileRow,
}) {
  final sourceWidth = thumbnail.thumbnailWidth.toDouble();
  final sourceHeight = thumbnail.thumbnailHeight.toDouble();

  return _SeekThumbnailTile(
    imageUrl: imageUrl,
    sourceX: sourceWidth * tileColumn,
    sourceY: sourceHeight * tileRow,
    sourceWidth: sourceWidth,
    sourceHeight: sourceHeight,
    sheetWidth: sourceWidth * thumbnail.columnCount,
    sheetHeight: sourceHeight * thumbnail.rowCount,
  );
}

String? _seekThumbnailPageSource({
  required TvVodOverlaySeekThumbnail thumbnail,
  required String source,
  required int pageIndex,
}) {
  if (thumbnail.sourcePatternType != 'sequence_pattern') {
    return null;
  }

  final placeholder = thumbnail.indexPlaceholder;
  if (placeholder.isNotEmpty && source.contains(placeholder)) {
    return source.replaceFirst(placeholder, '$pageIndex');
  }

  if (source.contains('#')) {
    return source.replaceFirst('#', '$pageIndex');
  }

  return null;
}

bool _hasValidSeekThumbnail(TvVodOverlaySeekThumbnail? thumbnail) {
  return thumbnail != null &&
      _trimmedOrNull(thumbnail.source) != null &&
      thumbnail.rowCount > 0 &&
      thumbnail.columnCount > 0 &&
      thumbnail.thumbnailWidth > 0 &&
      thumbnail.thumbnailHeight > 0;
}

String? _trimmedOrNull(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty || trimmed.toLowerCase() == 'null') {
    return null;
  }

  return trimmed;
}
