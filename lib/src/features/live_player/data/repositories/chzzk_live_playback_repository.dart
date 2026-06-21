import 'package:dio/dio.dart';

final class ChzzkLivePlaybackRepository {
  const ChzzkLivePlaybackRepository({
    required this.dio,
  });

  final Dio dio;

  Future<String> getPlaylistText({
    required Uri playlistUri,
  }) async {
    final response = await dio.getUri<String>(
      playlistUri,
      options: Options(
        responseType: ResponseType.plain,
        headers: const {
          'Accept': 'application/x-mpegURL, application/vnd.apple.mpegurl, */*',
        },
      ),
    );
    final playlistText = response.data;
    if (playlistText == null || playlistText.isEmpty) {
      throw const FormatException('Empty live playlist.');
    }

    return playlistText;
  }
}
