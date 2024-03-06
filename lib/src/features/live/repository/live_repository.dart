import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/model/live.dart';

import '../../../common/constants/api.dart';

part 'live_repository.g.dart';

@riverpod
LiveRepository liveRepository(LiveRepositoryRef ref) => LiveRepository();

class LiveRepository {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
      },
    ),
  );

  Future<LiveDetail?> getLiveDetail({
    required String channelId,
    required Options? options,
  }) async {
    final url = APIUrl.liveDetail(channelId);

    final response = await _dio.get(
      url,
      options: options,
    );

    final Map<String, dynamic>? jsonData = response.data['content'];

    return jsonData == null ? null : LiveDetail.fromJson(jsonData);
  }
}
