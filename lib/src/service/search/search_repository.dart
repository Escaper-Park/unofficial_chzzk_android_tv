import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/api.dart';
import '../../model/channel/channel.dart';

part 'search_repository.g.dart';

@riverpod
SearchRepository searchRepository(SearchRepositoryRef ref) =>
    SearchRepository();

class SearchRepository {
  final Dio _dio = Dio();

  Future<List<Channel>?> searchChannel({
    required String keyword,
  }) async {
    final url = APIUrl.searchChannel(keyword);

    final response = await _dio.get(url);

    final List<dynamic> searchResultResponse = response.data['content']['data'];

    return searchResultResponse
        .map((json) => Channel.fromJson(json['channel']))
        .toList();
  }
}
