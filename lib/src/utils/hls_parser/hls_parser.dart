import 'package:flutter_hls_parser/flutter_hls_parser.dart';

import '../dio/dio_client.dart';

class HlsParser {
  final String hlsUrl;

  HlsParser(this.hlsUrl);

  final Dio _dio = DioClient().getBaseDio();

  Future<String?> _getContents() async {
    try {
      final response = await _dio.get(hlsUrl);

      final String? contents = response.data;

      return contents;
    } catch (_) {
      return null;
    }
  }

  Future<List<Uri?>?> getMediaPlaylistUrls() async {
    final String? contents = await _getContents();

    if (contents != null) {
      final playList = await HlsPlaylistParser.create()
          .parseString(Uri.parse(hlsUrl), contents) as HlsMasterPlaylist;

      final mediaPlaylistUrls = playList.mediaPlaylistUrls;

      return mediaPlaylistUrls;
    }
    return null;
  }
}
