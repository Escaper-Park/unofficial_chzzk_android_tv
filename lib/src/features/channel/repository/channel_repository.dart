import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api.dart';
import '../model/channel.dart';

part 'channel_repository.g.dart';

@riverpod
ChannelRepository channelRepository(ChannelRepositoryRef ref) =>
    ChannelRepository();

class ChannelRepository {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
      },
    ),
  );

  Future<Channel?> getChannel({
    required String channelId,
    required Options? options,
  }) async {
    final url = APIUrl.channel(channelId);

    final response = await _dio.get(url, options: options);

    return Channel.fromJson(response.data['content']);
  }

  Future<PopularChannelResponse?> getPopularChannelResponse({
    required Options? options,
    required int? concurrentUserCount,
    required int? liveId,
    int size = 20,
  }) async {
    final url = APIUrl.popularLive(
      concurrentUserCount: concurrentUserCount,
      liveId: liveId,
      size: size,
    );

    final response = await _dio.get(url, options: options);

    final Map<String, dynamic>? pageResponse = response.data['content']['page'];
    final List<dynamic> channelsResponse = response.data['content']['data'];

    final PopularChannelPage? page = pageResponse == null
        ? null
        : PopularChannelPage.fromJson(pageResponse['next']);
    final List<Channel> channels = channelsResponse
        // remove blocked channel
        .where((response) {
          final personalData = response['channel']['personalData'];
          if (personalData == null) return true;

          return personalData['privateUserBlock'] != true;
        })
        .map((response) => Channel.fromJson(response['channel']))
        .toList();

    return PopularChannelResponse(
      channels: channels,
      page: page,
    );
  }

  Future<List<Channel>?> getRecommendChannels({
    required Options? options,
  }) async {
    final url = APIUrl.recommendataionChannels();

    final response = await _dio.get(url, options: options);

    final List<dynamic> recommendResponses =
        response.data['content']['recommendationChannels'];

    return recommendResponses.map((json) {
      Map<String, dynamic> channel = json['channel'];
      channel['openLive'] = json['streamer']['openLive'];
      return Channel.fromJson(channel);
    }).toList();
  }
}
