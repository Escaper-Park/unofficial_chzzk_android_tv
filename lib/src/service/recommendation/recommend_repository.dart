import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/api.dart';
import '../../model/channel/channel.dart';

part 'recommend_repository.g.dart';

@riverpod
RecommendRepository recommendRepository(RecommendRepositoryRef ref) =>
    RecommendRepository();

class RecommendRepository {
  final Dio _dio = Dio();

  Future<List<Channel>?> getRecommendChannels() async {
    final url = APIUrl.recommendataionChannels();

    final response = await _dio.get(url);

    final List<dynamic> recommendResponses =
        response.data['content']['recommendationChannels'];

    return recommendResponses.map((json) {
      Map<String, dynamic> channel = json['channel'];
      channel['openLive'] = json['streamer']['openLive'];
      return Channel.fromJson(channel);
    }).toList();
  }
}
