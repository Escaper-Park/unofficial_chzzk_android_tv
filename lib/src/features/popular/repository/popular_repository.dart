// 1706672901000

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api.dart';
import '../model/popular_channel.dart';

part 'popular_repository.g.dart';

@riverpod
PopularRepository popularRepository(PopularRepositoryRef ref) =>
    PopularRepository();

class PopularRepository {
  final Dio _dio = Dio();

  Future<List<PopularChannel>?> fetchPopularChannels(Options? options) async {
    const url = APIUrl.popularChannelList;

    try {
      final response = await _dio.get(url, options: options);
      final List channelsData = response.data['content']['data'];

      return channelsData
          .map((channel) => PopularChannel.fromJson(channel))
          .toList();
    } catch (e) {
      return null;
    }
  }
}
