import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../../channel/model/channel.dart';
import '../repository/search_repository.dart';

part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  late SearchRepository _repository;

  @override
  Future<List<Channel>?> build({required String keyword}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = SearchRepository(dio);

    return await searchChannel(keyword);
  }

  Future<List<Channel>?> searchChannel(String keyword) async {
    final searchResponse =
        await _repository.getSearchChannelResults(keyword: keyword);

    if (searchResponse != null && searchResponse.data.isNotEmpty) {
      final channelListResponse = searchResponse.data;

      // Check privateUserBlock
      final results = channelListResponse
          .where((response) {
            final personalData = response.channel.personalData;
            if (personalData == null) return true;

            return personalData.privateUserBlock != true;
          })
          .map((json) => json.channel)
          .toList();

      return results;
    }

    return [];
  }
}

@riverpod
class SearchChannelController extends _$SearchChannelController {
  @override
  Channel? build() {
    return null;
  }

  void setCurrentChannel(Channel channel) {
    state = channel;
  }
}
