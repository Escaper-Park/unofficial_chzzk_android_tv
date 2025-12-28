import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart';
import '../../vod/model/vod.dart';
import '../../vod/repository/vod_repository_wrapper.dart';

part 'channel_vod_controller.g.dart';

@riverpod
class ChannelVodController extends _$ChannelVodController {
  late VodRepositoryWrapper _repository;

  @override
  FutureOr<List<Vod>?> build({required String channelId}) async {
    _repository = ref.watch(vodRepositoryWrapperProvider);

    return await _fetch();
  }

  Future<List<Vod>?> _fetch({
    String pagingType = 'PAGE',
    int page = 0,
    int size = 18,
  }) async {
    final result = await _repository.getChannelVods(
      channelId: channelId,
      sortType: VideoSortType.latest.value,
      pagingType: pagingType,
      page: page,
      size: size,
      publishDateAt: null,
      videoType: null,
    );

    return result.when(
      success: (response) => response?.data,
      failure: (_) => null,
    );
  }
}
