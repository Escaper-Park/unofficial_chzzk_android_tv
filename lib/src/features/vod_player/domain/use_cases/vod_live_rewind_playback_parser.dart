import 'dart:convert';

import '../../../vod/domain/entities/vod_playback.dart';

Uri? vodLiveRewindMasterPlaylistUri(String? rawJson) {
  final value = rawJson?.trim();
  if (value == null || value.isEmpty) {
    return null;
  }

  try {
    final decoded = jsonDecode(value);
    if (decoded is! Map<String, dynamic>) {
      return null;
    }

    final mediaList = decoded['media'];
    if (mediaList is! List) {
      return null;
    }

    for (final media in mediaList) {
      if (media is! Map<String, dynamic>) {
        continue;
      }

      final path = media['path'];
      final mediaId = media['mediaId'];
      final protocol = media['protocol'];
      final isHls =
          mediaId == 'HLS' ||
          protocol == 'HLS' ||
          (path is String && path.contains('.m3u8'));
      if (!isHls || path is! String) {
        continue;
      }

      final uri = Uri.tryParse(path);
      if (uri != null && uri.hasScheme) {
        return uri;
      }
    }
  } on FormatException {
    return null;
  }

  return null;
}

VodSeekThumbnail? vodLiveRewindSeekThumbnail({
  required String? rawJson,
  required String? liveOpenDate,
}) {
  final value = rawJson?.trim();
  if (value == null || value.isEmpty) {
    return null;
  }

  try {
    final decoded = jsonDecode(value);
    if (decoded is! Map<String, dynamic>) {
      return null;
    }

    final thumbnail = decoded['thumbnail'];
    if (thumbnail is! Map<String, dynamic>) {
      return null;
    }

    final sprite = thumbnail['spriteSeekingThumbnail'];
    if (sprite is! Map<String, dynamic>) {
      return null;
    }

    final format = sprite['spriteFormat'];
    if (format is! Map<String, dynamic>) {
      return null;
    }

    final source = _stringValue(sprite['urlTemplate']);
    final rowCount = _positiveIntValue(format['rowCount']);
    final columnCount = _positiveIntValue(format['columnCount']);
    final interval = _positiveIntValue(format['interval']);
    final thumbnailWidth = _positiveIntValue(format['thumbnailWidth']);
    final thumbnailHeight = _positiveIntValue(format['thumbnailHeight']);
    if (source == null ||
        rowCount == null ||
        columnCount == null ||
        interval == null ||
        thumbnailWidth == null ||
        thumbnailHeight == null) {
      return null;
    }

    final intervalMilliseconds = _liveRewindIntervalMilliseconds(
      interval: interval,
      intervalType: _stringValue(format['intervalType']),
    );

    return VodSeekThumbnail(
      source: source,
      indexPlaceholder: '{spriteIndex}',
      indexMode: VodSeekThumbnailIndexMode.absoluteTimestamp,
      rowCount: rowCount,
      columnCount: columnCount,
      intervalMilliseconds: intervalMilliseconds,
      thumbnailWidth: thumbnailWidth,
      thumbnailHeight: thumbnailHeight,
      baseTimeMilliseconds: _chzzkDateTimeMilliseconds(liveOpenDate),
    );
  } on FormatException {
    return null;
  }
}

String? _stringValue(Object? value) {
  final string = value?.toString().trim();
  if (string == null || string.isEmpty) {
    return null;
  }

  return string;
}

int? _positiveIntValue(Object? value) {
  final parsed = int.tryParse(value?.toString() ?? '');
  return parsed == null || parsed <= 0 ? null : parsed;
}

int _liveRewindIntervalMilliseconds({
  required int interval,
  required String? intervalType,
}) {
  return intervalType == 'second' ? interval * 1000 : interval;
}

int? _chzzkDateTimeMilliseconds(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  final parsed = DateTime.tryParse(trimmed.replaceFirst(' ', 'T'));
  if (parsed != null && _hasTimeZone(trimmed)) {
    return parsed.millisecondsSinceEpoch;
  }

  final match = RegExp(
    r'^(\d{4})-(\d{2})-(\d{2})[ T](\d{2}):(\d{2}):(\d{2})',
  ).firstMatch(trimmed);
  if (match == null) {
    return parsed?.millisecondsSinceEpoch;
  }

  final year = int.parse(match.group(1)!);
  final month = int.parse(match.group(2)!);
  final day = int.parse(match.group(3)!);
  final hour = int.parse(match.group(4)!);
  final minute = int.parse(match.group(5)!);
  final second = int.parse(match.group(6)!);

  return DateTime.utc(
    year,
    month,
    day,
    hour,
    minute,
    second,
  ).subtract(const Duration(hours: 9)).millisecondsSinceEpoch;
}

bool _hasTimeZone(String value) {
  return value.endsWith('Z') || RegExp(r'[+-]\d{2}:?\d{2}$').hasMatch(value);
}
