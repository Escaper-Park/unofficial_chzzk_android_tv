import '../../../../core/media/hls/hls_master_playlist.dart';

String rewriteVodPlaybackMasterPlaylist({
  required String playlistText,
  required Uri masterPlaylistUri,
  required List<String?> variantFileNames,
}) {
  final lines = playlistText.replaceAll('\r\n', '\n').split('\n');
  final rewrittenLines = <String>[];
  var nextVariantIndex = 0;
  var awaitingVariantUri = false;
  var pendingVariantLines = <String>[];

  for (final rawLine in lines) {
    final trimmedLine = rawLine.trim();
    if (trimmedLine.isEmpty) {
      if (awaitingVariantUri) {
        pendingVariantLines.add(rawLine);
      } else {
        rewrittenLines.add(rawLine);
      }
      continue;
    }

    if (awaitingVariantUri && !trimmedLine.startsWith('#')) {
      final fileName = nextVariantIndex < variantFileNames.length
          ? variantFileNames[nextVariantIndex]
          : null;
      if (fileName != null) {
        rewrittenLines
          ..addAll(pendingVariantLines)
          ..add(fileName);
      }
      nextVariantIndex += 1;
      awaitingVariantUri = false;
      pendingVariantLines = <String>[];
      continue;
    }

    if (trimmedLine.startsWith('#EXT-X-STREAM-INF:')) {
      pendingVariantLines = [rawLine];
      awaitingVariantUri = true;
      continue;
    }

    if (trimmedLine.startsWith('#')) {
      final rewrittenLine = HlsMasterPlaylistParser.rewriteUriAttributesInLine(
        line: rawLine,
        baseUri: masterPlaylistUri,
        inheritedQueryParameters: masterPlaylistUri.queryParametersAll,
      );
      if (awaitingVariantUri) {
        pendingVariantLines.add(rewrittenLine);
      } else {
        rewrittenLines.add(rewrittenLine);
      }
      continue;
    }

    rewrittenLines.add(
      HlsMasterPlaylistParser.appendMissingQueryParameters(
        masterPlaylistUri.resolve(trimmedLine),
        masterPlaylistUri.queryParametersAll,
      ).toString(),
    );
  }

  return rewrittenLines.join('\n');
}

String rewriteVodPlaybackMediaPlaylist({
  required String playlistText,
  required Uri playlistUri,
  required int? startPositionSeconds,
}) {
  final lines = playlistText.replaceAll('\r\n', '\n').split('\n');
  final rewrittenLines = <String>[];
  final shouldWriteStartTag =
      startPositionSeconds != null && startPositionSeconds > 0;
  final hasStartTag = lines.any(
    (line) => line.trim().startsWith('#EXT-X-START:'),
  );
  var didWriteStartTag = false;

  for (final rawLine in lines) {
    final trimmedLine = rawLine.trim();
    if (trimmedLine.isEmpty) {
      rewrittenLines.add(rawLine);
      continue;
    }

    if (!didWriteStartTag &&
        shouldWriteStartTag &&
        !hasStartTag &&
        trimmedLine != '#EXTM3U' &&
        !trimmedLine.startsWith('#EXT-X-VERSION:')) {
      rewrittenLines.add(_vodPlaybackStartTag(startPositionSeconds));
      didWriteStartTag = true;
    }

    if (trimmedLine.startsWith('#')) {
      rewrittenLines.add(
        HlsMasterPlaylistParser.rewriteUriAttributesInLine(
          line: rawLine,
          baseUri: playlistUri,
          inheritedQueryParameters: playlistUri.queryParametersAll,
        ),
      );
      continue;
    }

    rewrittenLines.add(
      HlsMasterPlaylistParser.appendMissingQueryParameters(
        playlistUri.resolve(trimmedLine),
        playlistUri.queryParametersAll,
      ).toString(),
    );
  }

  if (!didWriteStartTag && shouldWriteStartTag && !hasStartTag) {
    rewrittenLines.add(_vodPlaybackStartTag(startPositionSeconds));
  }

  return rewrittenLines.join('\n');
}

String _vodPlaybackStartTag(int startPositionSeconds) {
  return '#EXT-X-START:TIME-OFFSET=$startPositionSeconds,PRECISE=YES';
}
