import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/api.dart';
import '../../model/channel/channel.dart';

part 'popular_repository.g.dart';

@riverpod
PopularRepository popularRepository(PopularRepositoryRef ref) =>
    PopularRepository();

class PopularRepository {
  final Dio _dio = Dio();

  Future<List<Channel>?> getPopularChannels() async {
    final url = APIUrl.popularLive();

    final response = await _dio.get(url);

    final List<dynamic> channelsResponse = response.data['content']['data'];

    return channelsResponse
        .map((res) => Channel.fromJson(res['channel']))
        .toList();
  }
}
