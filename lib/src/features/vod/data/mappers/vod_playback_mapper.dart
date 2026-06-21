part of 'vod_mapper.dart';

VodPlayback vodPlaybackFromDto(VodPlaybackDto dto) {
  return VodPlayback(
    masterPlaylistUrl: _masterPlaylistUrlFromDto(dto),
    seekThumbnail: _seekThumbnailFromDto(dto),
  );
}

String? _masterPlaylistUrlFromDto(VodPlaybackDto dto) {
  for (final mpd in dto.mpd) {
    for (final period in mpd.period) {
      for (final adaptationSet in period.adaptationSet) {
        final url = adaptationSet.naverVodM3u;
        if (url != null && url.isNotEmpty) {
          return url;
        }
      }
    }
  }

  return null;
}

VodSeekThumbnail? _seekThumbnailFromDto(VodPlaybackDto dto) {
  for (final mpd in dto.mpd) {
    for (final period in mpd.period) {
      for (final supplementalProperty in period.supplementalProperty) {
        for (final thumbnails in supplementalProperty.thumbnails) {
          for (final seekingThumbnail in thumbnails.seekingThumbnail) {
            final thumbnail = _seekThumbnailFromSeekingDto(seekingThumbnail);
            if (thumbnail != null) {
              return thumbnail;
            }
          }
        }
      }
    }
  }

  return null;
}

VodSeekThumbnail? _seekThumbnailFromSeekingDto(
  VodPlaybackSeekingThumbnailDto dto,
) {
  final page = dto.page.firstOrNull;
  final piece = dto.piece.firstOrNull;
  final source = dto.source.firstOrNull;
  final sourceText = source?.text?.trim();
  if (page == null ||
      piece == null ||
      sourceText == null ||
      sourceText.isEmpty) {
    return null;
  }

  final totalPage = _parsePositiveInt(page.total);
  final rowCount = _parsePositiveInt(page.row);
  final columnCount = _parsePositiveInt(page.column);
  final totalPieceSize = _parsePositiveInt(page.totalPieceSize);
  final interval = _parsePositiveInt(piece.interval);
  final thumbnailWidth = _parsePositiveInt(piece.width);
  final thumbnailHeight = _parsePositiveInt(piece.height);
  if (totalPage == null ||
      rowCount == null ||
      columnCount == null ||
      totalPieceSize == null ||
      interval == null ||
      thumbnailWidth == null ||
      thumbnailHeight == null) {
    return null;
  }

  return VodSeekThumbnail(
    source: sourceText,
    sourcePatternType: source?.patternType ?? 'sequence_pattern',
    totalPage: totalPage,
    rowCount: rowCount,
    columnCount: columnCount,
    intervalMilliseconds: _intervalMilliseconds(
      interval: interval,
      intervalType: piece.intervalType,
    ),
    thumbnailWidth: thumbnailWidth,
    thumbnailHeight: thumbnailHeight,
    allThumbnailCount: totalPieceSize,
  );
}

int? _parsePositiveInt(String? value) {
  final parsed = int.tryParse(value ?? '');
  return parsed == null || parsed <= 0 ? null : parsed;
}

int _intervalMilliseconds({
  required int interval,
  required String? intervalType,
}) {
  return intervalType == 'second' ? interval * 1000 : interval;
}
