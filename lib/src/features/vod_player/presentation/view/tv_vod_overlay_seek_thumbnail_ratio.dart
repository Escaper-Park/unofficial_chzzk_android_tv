part of 'tv_vod_overlay_playback_info.dart';

_SeekThumbnailTile? _ratioSeekThumbnailTileForPosition({
  required TvVodOverlaySeekThumbnail thumbnail,
  required String source,
  required Duration position,
  required Duration duration,
}) {
  if (duration <= Duration.zero) {
    return null;
  }

  final tilesPerPage = thumbnail.rowCount * thumbnail.columnCount;
  final fallbackCount = tilesPerPage * thumbnail.totalPage;
  final thumbnailCount = thumbnail.allThumbnailCount > 0
      ? thumbnail.allThumbnailCount
      : fallbackCount;
  if (tilesPerPage <= 0 || thumbnailCount <= 0) {
    return null;
  }

  final progress = _progressValue(
    fallback: 0,
    position: position,
    duration: duration,
  );
  final rawIndex = (progress * thumbnailCount - 1).toInt();
  final index = rawIndex.clamp(0, thumbnailCount - 1).toInt();
  final pageIndex = index ~/ tilesPerPage;
  final tileInPage = index % tilesPerPage;
  final tileColumn = tileInPage % thumbnail.columnCount;
  final tileRow = tileInPage ~/ thumbnail.columnCount;
  final imageUrl = _seekThumbnailPageSource(
    thumbnail: thumbnail,
    source: source,
    pageIndex: pageIndex,
  );
  if (imageUrl == null) {
    return null;
  }

  return _seekThumbnailTileForGrid(
    imageUrl: imageUrl,
    thumbnail: thumbnail,
    tileColumn: tileColumn,
    tileRow: tileRow,
  );
}
