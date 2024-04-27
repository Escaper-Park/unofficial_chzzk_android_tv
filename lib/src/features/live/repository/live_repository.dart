import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/model/live.dart';

import '../../../common/constants/api.dart';
import '../../channel/model/channel.dart';
import '../model/all_lives.dart';

part 'live_repository.g.dart';

enum LiveSortType {
  latest('LATEST'),
  popular('POPULAR');

  final String sortType;

  const LiveSortType(this.sortType);
}

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

    try {
      final response = await _dio.get(
        url,
        options: options,
      );

      final Map<String, dynamic>? jsonData = response.data['content'];

      return jsonData == null ? null : LiveDetail.fromJson(jsonData);
    } catch (_) {
      return null;
    }
  }

  Future<AllLivesChannelResponse?> getAllChannelsResponse({
    required Options? options,
    required int? concurrentUserCount,
    required int? liveId,
    int size = 18,
    LiveSortType sortType = LiveSortType.popular,
  }) async {
    final url = APIUrl.allLives(
      concurrentUserCount: concurrentUserCount,
      liveId: liveId,
      size: size,
      sortType: sortType,
    );

    final response = await _dio.get(url, options: options);

    final Map<String, dynamic>? pageResponse = response.data['content']['page'];
    final List<dynamic> channelsResponse = response.data['content']['data'];

    final AllLivesChannelPage? page = pageResponse == null
        ? null
        : AllLivesChannelPage.fromJson(pageResponse['next']);
    final List<Channel> channels = channelsResponse
        // remove blocked channel
        .where((response) {
          final personalData = response['channel']['personalData'];
          if (personalData == null) return true;

          return personalData['privateUserBlock'] != true;
        })
        .map((response) => Channel.fromJson(response['channel']))
        .toList();

    return AllLivesChannelResponse(
      channels: channels,
      page: page,
    );
  }
}
