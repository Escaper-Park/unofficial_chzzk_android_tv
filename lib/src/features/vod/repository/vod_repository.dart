import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api.dart';
import '../model/vod.dart';

part 'vod_repository.g.dart';

@riverpod
VodRepository vodRepository(VodRepositoryRef ref) => VodRepository();

enum VodSortType {
  latest('LATEST'),
  popular('POPULAR');

  final String sortType;

  const VodSortType(this.sortType);
}

class VodRepository {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
      },
    ),
  );

  Future<int?> getChannelTotalPages({required String channelId}) async {
    final url = APIUrl.vodList(channelId);

    // Don't need auth options
    final response = await _dio.get(url);

    return response.data['content']['totalPages'];
  }

  Future<List<Vod>?> getChannelVodList({
    required String channelId,
    required Options? options,
    int size = 18,
    int page = 0,
    VodSortType vodSortType = VodSortType.latest,
  }) async {
    final url = APIUrl.vodList(channelId,
        size: size, page: page, sortType: vodSortType.sortType);

    final response = await _dio.get(url, options: options);

    final List<dynamic> videoListResponse = response.data['content']['data'];

    return videoListResponse.map((json) => Vod.fromJson(json)).toList();
  }

  Future<String?> getVodPath({
    required int videoNo,
    required Options? options,
  }) async {
    final videoUrl = APIUrl.vod(videoNo);

    final videoResponse = await _dio.get(videoUrl, options: options);
    final Vod vod = Vod.fromJson(videoResponse.data['content']);

    // Adult video without verification
    final String? videoId = vod.videoId;
    final String? inKey = vod.inKey;

    if (videoId != null && inKey != null) {
      final vodUrl = APIUrl.vodXML(videoId, inKey);
      try {
        final vodResponse = await _dio.get(vodUrl, options: options);

        return (vodResponse.data['period'][0]['adaptationSet'][0]
            ['representation'][0]['baseURL'][0]['value']);
      } catch (_) {
        // DELETED_ILLEGAL_FROM_KCC, '게재 제한'
        return 'RESTRICT';
      }
    } else {
      return null;
    }
  }
}
