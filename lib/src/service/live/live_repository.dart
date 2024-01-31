import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/api.dart';
import '../../model/channel/channel.dart';
import '../../model/live/live.dart';

part 'live_repository.g.dart';

@riverpod
LiveRepository liveRepository(LiveRepositoryRef ref) => LiveRepository();

class LiveRepository {
  final Dio _dio = Dio();

  Future<String?> getChatChannelIdFromLiveStatus({
    required String channelId,
  }) async {
    final url = APIUrl.liveStatus(channelId);

    // Use try-catch because this is not used by the provider.
    try {
      final response = await _dio.get(url);

      return response.data['content']['chatChannelId'];
    } catch (_) {
      return null;
    }
  }

  Future<LiveDetail?> getLiveDetail({
    required String channelId,
    Options? options,
  }) async {
    final url = APIUrl.liveDetail(channelId);

    final response = await _dio.get(
      url,
      options: options,
    );

    return LiveDetail.fromJson(response.data['content']);
  }

  /// Get live details from channels.
  Future<List<LiveDetail>> getLiveDetails({
    required List<Channel> channels,
    Options? options,
  }) async {
    List<LiveDetail> detailList = [];

    for (Channel channel in channels) {
      LiveDetail? liveDetail = await getLiveDetail(
        channelId: channel.channelId,
        options: options,
      );

      if (liveDetail != null) detailList.add(liveDetail);
    }

    return detailList;
  }
}
