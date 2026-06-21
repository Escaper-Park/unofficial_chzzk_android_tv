part of 'resolve_live_playback_uri.dart';

List<Object?>? _parseMedia(String? livePlaybackJson) {
  final trimmed = livePlaybackJson?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  final Object? decoded;
  try {
    decoded = jsonDecode(trimmed);
  } on FormatException {
    return null;
  }
  if (decoded is! Map<String, dynamic>) {
    return null;
  }

  final media = decoded['media'];
  if (media is! List) {
    return null;
  }

  return media;
}

Object? _selectPreferredMedia(List<Object?> media, int latencyIndex) {
  final preferredMediaId = latencyIndex == 0 ? 'HLS' : 'LLHLS';
  final fallbackMediaId = latencyIndex == 0 ? 'LLHLS' : 'HLS';

  return _mediaById(media, preferredMediaId) ??
      _mediaById(media, fallbackMediaId) ??
      (media.isEmpty ? null : media.first);
}

Object? _mediaById(List<Object?> media, String mediaId) {
  for (final item in media) {
    if (_matchesMediaId(item, mediaId)) {
      return item;
    }
  }

  return null;
}

bool _matchesMediaId(Object? item, String expectedMediaId) {
  if (item is! Map<String, dynamic>) {
    return false;
  }

  final mediaId = item['mediaId'];
  return mediaId is String &&
      mediaId.trim().toUpperCase() == expectedMediaId.toUpperCase();
}

Uri? _firstPlayableUri(List<Object?> media) {
  for (final item in media) {
    final uri = _uriForMedia(item);
    if (uri != null) {
      return uri;
    }
  }

  return null;
}

Uri? _uriForMedia(Object? item, {String? expectedMediaId}) {
  if (item is! Map<String, dynamic>) {
    return null;
  }

  final mediaId = item['mediaId'];
  if (expectedMediaId != null &&
      (mediaId is! String ||
          mediaId.toUpperCase() != expectedMediaId.toUpperCase())) {
    return null;
  }

  final path = item['path'];
  if (path is! String || path.trim().isEmpty) {
    return null;
  }

  final uri = Uri.tryParse(path);
  if (uri == null || !uri.hasScheme) {
    return null;
  }

  return uri;
}
