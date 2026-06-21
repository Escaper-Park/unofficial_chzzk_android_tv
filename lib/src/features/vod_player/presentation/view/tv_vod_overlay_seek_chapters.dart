part of 'tv_vod_overlay_playback_info.dart';

final class _SeekSegment {
  const _SeekSegment({
    required this.start,
    required this.end,
  });

  final double start;
  final double end;
}

List<_SeekSegment> _seekSegments({
  required List<TvVodOverlaySeekChapter> chapters,
  required Duration duration,
}) {
  if (chapters.isEmpty || duration <= Duration.zero) {
    return const [_SeekSegment(start: 0, end: 1)];
  }

  final durationMs = duration.inMilliseconds;
  final boundaries = <int>{0, durationMs};
  for (final chapter in chapters) {
    final startMs = chapter.start.inMilliseconds.clamp(0, durationMs).toInt();
    if (startMs > 0 && startMs < durationMs) {
      boundaries.add(startMs);
    }
  }

  final sorted = boundaries.toList()..sort();
  final segments = <_SeekSegment>[];
  for (var index = 0; index < sorted.length - 1; index += 1) {
    final start = sorted[index];
    final end = sorted[index + 1];
    if (end <= start) {
      continue;
    }
    segments.add(
      _SeekSegment(
        start: start / durationMs,
        end: end / durationMs,
      ),
    );
  }

  if (segments.isEmpty) {
    return const [_SeekSegment(start: 0, end: 1)];
  }

  return segments;
}

List<TvVodOverlaySeekChapter> _sortedSeekChapters(
  List<TvVodOverlaySeekChapter> chapters,
) {
  if (chapters.length < 2) {
    return chapters;
  }

  return List<TvVodOverlaySeekChapter>.of(chapters)
    ..sort((a, b) => a.start.compareTo(b.start));
}

TvVodOverlaySeekChapter? _chapterAtPosition({
  required List<TvVodOverlaySeekChapter> chapters,
  required Duration position,
}) {
  if (chapters.isEmpty) {
    return null;
  }

  var selected = chapters.first;
  for (final chapter in chapters) {
    if (chapter.start <= position) {
      selected = chapter;
    } else {
      break;
    }
  }

  return selected;
}

String? _chapterTitle(TvVodOverlaySeekChapter? chapter) {
  final title = chapter?.title.trim();
  if (title != null && title.isNotEmpty) {
    return title;
  }

  return null;
}
