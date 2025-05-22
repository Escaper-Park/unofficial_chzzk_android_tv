import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';

import '../../channel/model/channel.dart';
import '../../live/model/live_info.dart';
import '../../search/repository/search_repository.dart';

part 'search_live_controller.g.dart';

@riverpod
class SearchLiveController extends _$SearchLiveController {
  late SearchRepository _repository;

  @override
  FutureOr<List<LiveInfo>?> build({required String keyword}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = SearchRepository(dio);

    return await _getSearchLiveResponse(keyword: keyword);
  }

  Future<List<LiveInfo>?> _getSearchLiveResponse({
    required String keyword,
  }) async {
    final response = await _repository.getSearchLiveResponse(
      keyword: keyword,
      offset: 0,
      size: 18,
    );

    final data = response?.data.map(
      (e) {
        final channel = Channel.fromJson((e as Map<String, dynamic>)['channel']); 
        final liveInfo = (e)['live'];

        return LiveInfo.fromJson(liveInfo).copyWith(channel: channel);
      },
    ).toList();

    return data;
  }
}
