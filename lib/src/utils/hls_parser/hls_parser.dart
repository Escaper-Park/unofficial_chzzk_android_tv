import 'package:flutter_hls_parser/flutter_hls_parser.dart';

import '../dio/dio_client.dart';

class HlsParser {
  final String hlsUrl;

  HlsParser({required this.hlsUrl});

  final Dio _dio = DioClient().getBaseDio(null);

  Future<String?> _getContents() async {
    try {
      final response = await _dio.get(hlsUrl);
      final String? contents = response.data;

      return contents;
    } catch (_) {
      return null;
    }
  }

  Future<List<Uri?>?> getMediaPlaylistSortByResolution(int count) async {
    final String? contents = await _getContents();

    if (contents == null) return null;

    final playlist = await HlsPlaylistParser.create()
        .parseString(Uri.parse(hlsUrl), contents) as HlsMasterPlaylist;

    // sort by width
    final mediaPlaylist = playlist.variants;
    mediaPlaylist.sort((a, b) => a.format.width!.compareTo(b.format.width!));

    // Get last N res: 360p, 480p, 720p, 1080p.
    final lastNElements = mediaPlaylist.sublist(
      mediaPlaylist.length >= count ? mediaPlaylist.length - count : 0,
    );

    return lastNElements.map((rendition) => rendition.url).toList();
  }
}
