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
