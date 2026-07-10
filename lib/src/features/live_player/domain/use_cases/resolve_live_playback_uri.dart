import 'dart:convert';

import '../../../../core/media/hls/hls_master_playlist.dart';

part 'live_playback_media_parser.dart';

typedef LoadLivePlaybackPlaylistText =
    Future<String> Function({
      required Uri playlistUri,
    });

final class LiveResolvedPlaybackSource {
  const LiveResolvedPlaybackSource({
    required this.playbackUri,
    required this.availableResolutionIndexes,
    this.expectedVideoWidth,
    this.expectedVideoHeight,
  });

  final Uri playbackUri;
  final List<int> availableResolutionIndexes;
  final int? expectedVideoWidth;
  final int? expectedVideoHeight;
}

abstract final class LivePlaybackResolutionOptions {
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

  static int? indexForHeight(int height) {
    for (final entry in heightsByIndex.entries) {
      if (entry.value == height) {
        return entry.key;
      }
    }

    return null;
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

  static List<int> normalizeAvailableIndexes(Iterable<int> indexes) {
    return <int>{
      for (final index in indexes)
        if (isSupportedIndex(index) && index != autoIndex) index,
      autoIndex,
    }.toList()..sort();
  }
}

Uri? resolveLivePlaybackUri(
  String? livePlaybackJson, {
  int latencyIndex = 0,
}) {
  final media = _parseMedia(livePlaybackJson);
  if (media == null) {
    return null;
  }

  return _uriForMedia(_selectPreferredMedia(media, latencyIndex)) ??
      _firstPlayableUri(media);
}

Future<LiveResolvedPlaybackSource?> resolveLivePlaybackSource({
  required String? livePlaybackJson,
  required int latencyIndex,
  required int resolutionIndex,
  required LoadLivePlaybackPlaylistText loadPlaylistText,
}) async {
  final media = _parseMedia(livePlaybackJson);
  if (media == null) {
    return null;
  }

  final selectedMedia = _selectPreferredMedia(media, latencyIndex);
  final masterUri = _uriForMedia(selectedMedia) ?? _firstPlayableUri(media);
  if (masterUri == null) {
    return null;
  }

  final normalizedResolutionIndex =
      LivePlaybackResolutionOptions.normalizeIndex(resolutionIndex);
  final autoRequested =
      resolutionIndex == LivePlaybackResolutionOptions.autoIndex;

  try {
    final masterPlaylist = await loadPlaylistText(playlistUri: masterUri);
    final variants = HlsMasterPlaylistParser.parseMasterPlaylist(
      playlistText: masterPlaylist,
      masterUri: masterUri,
    );
    final availableIndexes =
        LivePlaybackResolutionOptions.normalizeAvailableIndexes(
          variants
              .map((variant) => variant.height)
              .whereType<int>()
              .map(LivePlaybackResolutionOptions.indexForHeight)
              .whereType<int>(),
        );

    if (autoRequested) {
      final highestVariant = HlsMasterPlaylistParser.selectHighestVariant(
        variants,
      );
      return LiveResolvedPlaybackSource(
        playbackUri: masterUri,
        availableResolutionIndexes: availableIndexes,
        expectedVideoWidth: highestVariant?.width,
        expectedVideoHeight: highestVariant?.height,
      );
    }

    final targetHeight =
        LivePlaybackResolutionOptions.heightsByIndex[normalizedResolutionIndex];
    final selectedVariant = targetHeight != null
        ? HlsMasterPlaylistParser.selectPreferredVariant(
            variants: variants,
            targetHeight: targetHeight,
            fallbackRank: normalizedResolutionIndex,
          )
        : HlsMasterPlaylistParser.selectHighestVariant(variants);
    final selectedVariantUri = selectedVariant?.uri;
    if (selectedVariantUri == null) {
      return LiveResolvedPlaybackSource(
        playbackUri: masterUri,
        availableResolutionIndexes: availableIndexes,
        expectedVideoWidth: selectedVariant?.width,
        expectedVideoHeight: selectedVariant?.height,
      );
    }

    return LiveResolvedPlaybackSource(
      playbackUri: HlsMasterPlaylistParser.appendMissingQueryParameters(
        selectedVariantUri,
        masterUri.queryParametersAll,
      ),
      availableResolutionIndexes: availableIndexes,
      expectedVideoWidth: selectedVariant?.width,
      expectedVideoHeight: selectedVariant?.height,
    );
  } on Object {
    return LiveResolvedPlaybackSource(
      playbackUri: masterUri,
      availableResolutionIndexes: const <int>[
        LivePlaybackResolutionOptions.autoIndex,
      ],
    );
  }
}
