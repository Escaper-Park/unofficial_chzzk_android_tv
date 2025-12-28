import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../../vod/model/vod.dart';
import '../../vod/repository/vod_repository_wrapper.dart';

part 'channel_vod_all_controller.g.dart';

@riverpod
class ChannelVodAllController extends _$ChannelVodAllController {
  late VodRepositoryWrapper _repository;

  // for infinite scrolling(or paging).
  int _next = 0;
  int _totalPages = 0;

  @override
  FutureOr<List<Vod>?> build({
    required String channelId,
    required VideoSortType sortType,
  }) async {
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
      sortType: sortType.value,
      pagingType: pagingType,
      page: page,
      size: size,
      publishDateAt: null,
      videoType: null,
    );

    return result.when(
      success: (response) {
        if (response != null) {
          _totalPages = response.totalPages;
          _next = 1; // first page: 0
        }
        return response?.data;
      },
      failure: (_) => null,
    );
  }

  Future<void> fetchMore() async {
    if (_next < _totalPages) {
      ref.setFetchMoreLoading(AppRoute.channelVod.routeName, true);
      final prev = state.value;

      state = await AsyncValue.guard(
        () async {
          final result = await _repository.getChannelVods(
            channelId: channelId,
            sortType: sortType.value,
            pagingType: 'PAGE',
            page: _next,
            size: 18,
            publishDateAt: null,
            videoType: null,
          );

          return result.when(
            success: (response) {
              _next += 1;
              ref.setFetchMoreLoading(AppRoute.channelVod.routeName, false);
              if (response?.data == null || response!.data.isEmpty) {
                return [...prev!];
              }
              return [...prev!, ...response.data];
            },
            failure: (_) {
              ref.setFetchMoreLoading(AppRoute.channelVod.routeName, false);
              return [...prev!];
            },
          );
        },
      );
    }
  }
}
