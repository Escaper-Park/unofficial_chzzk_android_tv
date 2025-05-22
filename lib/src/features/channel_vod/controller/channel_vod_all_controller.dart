import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../../common/constants/enums.dart';
import '../../../utils/dio/dio_client.dart';
import '../../vod/model/vod.dart';
import '../../vod/repository/vod_repository.dart';

part 'channel_vod_all_controller.g.dart';

@riverpod
class ChannelVodAllController extends _$ChannelVodAllController {
  late VodRepository _repository;

  // for infinite scrolling(or paging).
  int _next = 0;
  int _totalPages = 0;

  @override
  FutureOr<List<Vod>?> build({
    required String channelId,
    required VideoSortType sortType,
  }) async {
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
      sortType: sortType.value,
      pagingType: pagingType,
      page: page,
      size: size,
      publishDateAt: null,
      videoType: null,
    );

    if (channelVodResponse != null) {
      _totalPages = channelVodResponse.totalPages;
      _next = 1; // first page: 0
    }

    return channelVodResponse?.data;
  }

  Future<void> fetchMore() async {
    if (_next < _totalPages) {
      ref.setFetchMoreLoading(AppRoute.channelVod.routeName, true);
      final prev = state.value;

      state = await AsyncValue.guard(
        () async {
          final response = await _repository.getChannelVods(
            channelId: channelId,
            sortType: sortType.value,
            pagingType: 'PAGE',
            page: _next,
            size: 18,
            publishDateAt: null,
            videoType: null,
          );

          _next += 1;

          if (response?.data == null || response!.data.isEmpty) {
            return [...prev!];
          }

          ref.setFetchMoreLoading(AppRoute.channelVod.routeName, false);
          return [...prev!, ...response.data];
        },
      );
    }
  }
}
