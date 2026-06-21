import 'dart:io';

import '../../../../core/media/hls/hls_master_playlist.dart';
import 'vod_playback_cache.dart';
import 'vod_playback_playlist_rewriter.dart';

export 'vod_live_rewind_playback_parser.dart';

part 'vod_playback_resolution_options.dart';
part 'vod_playback_source_writer.dart';

typedef LoadVodPlaybackPlaylistText =
    Future<String> Function({
      required Uri playlistUri,
    });

Future<VodResolvedPlaybackSource> resolveVodPlaybackSource({
  required Uri masterPlaylistUri,
  required int resolutionIndex,
  required int? startPositionSeconds,
  required LoadVodPlaybackPlaylistText loadPlaylistText,
}) async {
  final masterPlaylistText = await loadPlaylistText(
    playlistUri: masterPlaylistUri,
  );
  final variants = HlsMasterPlaylistParser.parseMasterPlaylist(
    playlistText: masterPlaylistText,
    masterUri: masterPlaylistUri,
  );
  final playbackCache = await VodPlaybackCache.createTemp();

  try {
    if (variants.isEmpty) {
      final mediaFile = await _writeMediaPlaylistFile(
        playbackCache: playbackCache,
        fileName: 'media.m3u8',
        playlistText: masterPlaylistText,
        playlistUri: masterPlaylistUri,
        startPositionSeconds: startPositionSeconds,
      );
      return VodResolvedPlaybackSource(
        playbackUri: mediaFile.uri,
        availableResolutionIndexes: const [
          VodPlaybackResolutionOptions.autoIndex,
        ],
        cache: playbackCache,
      );
    }

    final availableResolutionIndexes = _availableResolutionIndexes(variants);
    final normalizedResolutionIndex =
        VodPlaybackResolutionOptions.normalizeIndex(resolutionIndex);
    final autoRequested =
        normalizedResolutionIndex == VodPlaybackResolutionOptions.autoIndex;

    if (autoRequested) {
      return _writeAutoPlaybackSource(
        playbackCache: playbackCache,
        masterPlaylistText: masterPlaylistText,
        masterPlaylistUri: masterPlaylistUri,
        variants: variants,
        startPositionSeconds: startPositionSeconds,
        loadPlaylistText: loadPlaylistText,
      );
    }

    final targetHeight =
        VodPlaybackResolutionOptions.heightsByIndex[normalizedResolutionIndex];
    final selectedVariant =
        targetHeight != null &&
            availableResolutionIndexes.contains(normalizedResolutionIndex)
        ? HlsMasterPlaylistParser.selectPreferredVariant(
            variants: variants,
            targetHeight: targetHeight,
            fallbackRank: normalizedResolutionIndex,
          )
        : HlsMasterPlaylistParser.selectHighestVariant(variants);
    final selectedVariantUri = selectedVariant?.uri;
    if (selectedVariantUri == null) {
      return _writeAutoPlaybackSource(
        playbackCache: playbackCache,
        masterPlaylistText: masterPlaylistText,
        masterPlaylistUri: masterPlaylistUri,
        variants: variants,
        startPositionSeconds: startPositionSeconds,
        loadPlaylistText: loadPlaylistText,
      );
    }

    final signedVariantUri =
        HlsMasterPlaylistParser.appendMissingQueryParameters(
          selectedVariantUri,
          masterPlaylistUri.queryParametersAll,
        );
    late final File selectedFile;
    try {
      final variantPlaylistText = await loadPlaylistText(
        playlistUri: signedVariantUri,
      );
      selectedFile = await _writeMediaPlaylistFile(
        playbackCache: playbackCache,
        fileName: 'selected.m3u8',
        playlistText: variantPlaylistText,
        playlistUri: signedVariantUri,
        startPositionSeconds: startPositionSeconds,
      );
    } on Object {
      return _writeAutoPlaybackSource(
        playbackCache: playbackCache,
        masterPlaylistText: masterPlaylistText,
        masterPlaylistUri: masterPlaylistUri,
        variants: variants,
        startPositionSeconds: startPositionSeconds,
        loadPlaylistText: loadPlaylistText,
      );
    }

    return VodResolvedPlaybackSource(
      playbackUri: selectedFile.uri,
      availableResolutionIndexes: availableResolutionIndexes,
      cache: playbackCache,
    );
  } on Object {
    await playbackCache.delete();
    rethrow;
  }
}

List<int> _availableResolutionIndexes(List<HlsVariantStream> variants) {
  return VodPlaybackResolutionOptions.normalizeAvailableIndexes(
    variants
        .map((variant) => variant.height)
        .whereType<int>()
        .map(VodPlaybackResolutionOptions.indexForHeight)
        .whereType<int>(),
  );
}
