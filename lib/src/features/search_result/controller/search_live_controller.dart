import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../channel/model/channel.dart';
import '../../live/model/live_info.dart';
import '../../search/repository/search_repository_wrapper.dart';

part 'search_live_controller.g.dart';

@riverpod
class SearchLiveController extends _$SearchLiveController {
  late SearchRepositoryWrapper _repository;

  @override
  FutureOr<List<LiveInfo>?> build({required String keyword}) async {
    _repository = ref.watch(searchRepositoryWrapperProvider);

    return await _getSearchLiveResponse(keyword: keyword);
  }

  Future<List<LiveInfo>?> _getSearchLiveResponse({
    required String keyword,
  }) async {
    final result = await _repository.searchLives(
      keyword: keyword,
      offset: 0,
      size: 18,
    );

    return result.when(
      success: (response) {
        final data = response?.data.map(
          (e) {
            final channel =
                Channel.fromJson((e as Map<String, dynamic>)['channel']);
            final liveInfo = (e)['live'];

            return LiveInfo.fromJson(liveInfo).copyWith(channel: channel);
          },
        ).toList();

        return data;
      },
      failure: (_) => null,
    );
  }
}
