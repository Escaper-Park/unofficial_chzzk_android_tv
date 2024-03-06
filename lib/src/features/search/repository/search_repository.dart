import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api.dart';
import '../../channel/model/channel.dart';

part 'search_repository.g.dart';

@riverpod
SearchRepository searchRepository(SearchRepositoryRef ref) =>
    SearchRepository();

class SearchRepository {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
      },
    ),
  );

  Future<List<Channel>?> searchChannels({
    required String keyword,
    required Options? options,
  }) async {
    final url = APIUrl.searchChannel(keyword);

    final response = await _dio.get(url, options: options);

    final List<dynamic> searchChannelResultResponse =
        response.data['content']['data'];

    return searchChannelResultResponse
        // remove blocked channel
        .where((response) {
          final personalData = response['channel']['personalData'];
          if (personalData == null) return true;

          return personalData['privateUserBlock'] != true;
        })
        .map((json) => Channel.fromJson(json['channel']))
        .toList();
  }
}
