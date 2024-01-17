import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api.dart';
import '../model/live.dart';

part 'live_repository.g.dart';

@riverpod
LiveRepository liveRepository(LiveRepositoryRef ref) => LiveRepository();

class LiveRepository {
  final Dio _dio = Dio();

  Future<LiveDetail?> getLiveDetail(String channelId, Options? options) async {
    final url = APIUrl.liveDetail(channelId);

    try {
      final response = await _dio.get(url, options: options);

      return LiveDetail.fromJson(response.data['content']);
    } catch (_) {
      return null;
    }
  }

  Future<LiveStatus?> getLiveStatus(String channelId, Options? options) async {
    final url = APIUrl.liveStatus(channelId);

    try {
      final response = await _dio.get(url, options: options);

      return LiveStatus.fromJson(response.data['content']);
    } catch (_) {
      return null;
    }
  }

  String? getLivePath(LiveDetail liveDetail) {
    final List media = liveDetail.livePlayback.media;
    final Map<String, dynamic>? mediaPath =
        media.firstWhere((video) => video['mediaId'] == "HLS");

    return mediaPath == null ? null : mediaPath['path'];
  }
}
