part of 'resolve_vod_playback_uri.dart';

final class VodResolvedPlaybackSource {
  const VodResolvedPlaybackSource({
    required this.playbackUri,
    required this.availableResolutionIndexes,
    this.cache,
  });

  final Uri playbackUri;
  final List<int> availableResolutionIndexes;
  final VodPlaybackCache? cache;
}

abstract final class VodPlaybackResolutionOptions {
  static const autoIndex = 4;
  static const allIndexes = <int>[0, 1, 2, 3, autoIndex];

  static const heightsByIndex = <int, int>{
    0: 360,
    1: 480,
    2: 720,
    3: 1080,
  };

  static bool isSupportedIndex(int index) {
    return index >= 0 && index <= autoIndex;
  }

  static int normalizeIndex(int index) {
    return isSupportedIndex(index) ? index : autoIndex;
  }

  static List<int> menuIndexes(Iterable<int> availableIndexes) {
    final normalizedAvailableIndexes = normalizeAvailableIndexes(
      availableIndexes,
    );
    final values = [
      for (final index in allIndexes)
        if (normalizedAvailableIndexes.contains(index)) index,
    ];

    return values.isEmpty ? const <int>[autoIndex] : values;
  }

  static int effectiveSelectedIndex({
    required int preferredIndex,
    required Iterable<int> availableIndexes,
  }) {
    final values = menuIndexes(availableIndexes);
    if (preferredIndex == autoIndex && values.contains(autoIndex)) {
      return autoIndex;
    }
    if (values.contains(preferredIndex)) {
      return preferredIndex;
    }

    for (var index = values.length - 1; index >= 0; index -= 1) {
      final value = values[index];
      if (value != autoIndex) {
        return value;
      }
    }

    return values.first;
  }

  static int? indexForHeight(int height) {
    for (final entry in heightsByIndex.entries) {
      if (entry.value == height) {
        return entry.key;
      }
    }

    return null;
  }

  static List<int> normalizeAvailableIndexes(Iterable<int> indexes) {
    return <int>{
      for (final index in indexes)
        if (isSupportedIndex(index) && index != autoIndex) index,
      autoIndex,
    }.toList()..sort();
  }
}
