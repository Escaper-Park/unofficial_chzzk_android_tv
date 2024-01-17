import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api.dart';
import '../../channel/model/channel.dart';

part 'search_repository.g.dart';

@riverpod
SearchRepository searchRepository(SearchRepositoryRef ref) =>
    SearchRepository();

class SearchRepository {
  final Dio _dio = Dio();

  Future<List<Channel>?> search(String keyword, Options? options) async {
    final url = APIUrl.searchChannel(keyword);

    try {
      final response = await _dio.get(url, options: options);

      final List resultsResponse = response.data['content']['data'];

      return resultsResponse
          .map((res) => Channel.fromJson(res['channel']))
          .toList();
    } catch (e) {
      return null;
    }
  }
}
