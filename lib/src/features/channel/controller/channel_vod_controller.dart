import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart';
import '../../../utils/dio/dio_client.dart';
import '../../vod/model/vod.dart';
import '../../vod/repository/vod_repository.dart';

part 'channel_vod_controller.g.dart';

@riverpod
class ChannelVodController extends _$ChannelVodController {
  late VodRepository _repository;

  @override
  FutureOr<List<Vod>?> build({required String channelId}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = VodRepository(dio);

    return await _fetch();
  }

  Future<List<Vod>?> _fetch({
    String pagingType = 'PAGE',
    int page = 0,
    int size = 18,
  }) async {
    final channelVodResponse = await _repository.getChannelVods(
      channelId: channelId,
      sortType: VideoSortType.latest.value,
      pagingType: pagingType,
      page: page,
      size: size,
      publishDateAt: null,
      videoType: null,
    );

    return channelVodResponse?.data;
  }
}
