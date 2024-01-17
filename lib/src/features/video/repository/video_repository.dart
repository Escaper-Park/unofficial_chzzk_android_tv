import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api.dart';
import '../model/video.dart';

part 'video_repository.g.dart';

@riverpod
VideoRepository videoRepository(VideoRepositoryRef ref) => VideoRepository();

class VideoRepository {
  final Dio _dio = Dio();

  Future<List<BaseVideo>?> fetchChannelVideoList(
    String channelId,
    Options? options,
  ) async {
    final url = APIUrl.videoList(channelId);

    try {
      final response = await _dio.get(url, options: options);

      final List<dynamic> videoListResponse = response.data['content']['data'];

      return videoListResponse
          .map((video) => BaseVideo.fromJson(video))
          .toList();
    } catch (e) {
      return null;
    }
  }

  Future<String?> fetchVodPath(int videoNo, Options? options) async {
    final videoUrl = APIUrl.video(videoNo);

    final videoResponse = await _dio.get(videoUrl, options: options);
    final Video video = Video.fromJson(videoResponse.data['content']);

    if (video.adult && video.userAdultStatus != 'ADULT') {
      return null;
    } else {
      final String? videoId = video.videoId;
      final String? inKey = video.inKey;

      if (videoId != null && inKey != null) {
        final vodUrl = APIUrl.vodXML(videoId, inKey);

        final vodResponse = await _dio.get(vodUrl, options: options);

        return (vodResponse.data['period'][0]['adaptationSet'][0]
            ['representation'][0]['baseURL'][0]['value']);
      } else {
        return null;
      }
    }
  }
}
