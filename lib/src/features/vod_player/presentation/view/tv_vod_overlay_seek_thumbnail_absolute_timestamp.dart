part of 'tv_vod_overlay_playback_info.dart';

_SeekThumbnailTile? _absoluteTimestampSeekThumbnailTileForPosition({
  required TvVodOverlaySeekThumbnail thumbnail,
  required String source,
  required Duration position,
}) {
  final baseTimeMilliseconds = thumbnail.baseTimeMilliseconds;
  final intervalMilliseconds = thumbnail.intervalMilliseconds;
  if (baseTimeMilliseconds == null || intervalMilliseconds <= 0) {
    return null;
  }

  final pageDuration =
      intervalMilliseconds * thumbnail.rowCount * thumbnail.columnCount;
  if (pageDuration <= 0) {
    return null;
  }

  final safePosition = position < Duration.zero ? Duration.zero : position;
  final mediaTimeMilliseconds =
      baseTimeMilliseconds + safePosition.inMilliseconds;
  final shiftedTimeMilliseconds = mediaTimeMilliseconds + intervalMilliseconds;
  final pageIndex = shiftedTimeMilliseconds ~/ pageDuration;
  final tileIndex = shiftedTimeMilliseconds ~/ intervalMilliseconds;
  final tileColumn = tileIndex % thumbnail.columnCount;
  final tileRow = (tileIndex ~/ thumbnail.columnCount) % thumbnail.rowCount;
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
