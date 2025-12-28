import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show AppRoute, VideoSortType;
import '../../../utils/extensions/custom_extensions.dart';
import '../../live/model/live_info.dart';
import '../../live/model/live_response.dart';
import '../../live/repository/live_repository_wrapper.dart';

part 'live_all_controller.g.dart';

@riverpod
class LiveAllController extends _$LiveAllController {
  late LiveRepositoryWrapper _repository;

  LiveNext? _next;

  @override
  FutureOr<List<LiveInfo>?> build({required VideoSortType sortType}) async {
    _repository = ref.watch(liveRepositoryWrapperProvider);

    return await _fetch();
  }

  Future<List<LiveInfo>?> _fetch() async {
    final result = await _repository.getLiveResponse(
      size: 18,
      sortType: sortType.value,
      concurrentUserCount: null,
      liveId: null,
    );

    return result.when(
      success: (response) {
        _next = response?.page?.next;
        return response?.data;
      },
      failure: (_) => null,
    );
  }

  Future<void> fetchMore() async {
    if (_next == null) return;

    ref.setFetchMoreLoading(AppRoute.liveAll.routeName, true);
    final prev = state.value;

    state = await AsyncValue.guard(() async {
      final result = await _repository.getLiveResponse(
        size: 18,
        sortType: sortType.value,
        concurrentUserCount: _next!.concurrentUserCount,
        liveId: _next!.liveId,
      );

      return result.when(
        success: (response) {
          _next = response?.page?.next;
          ref.setFetchMoreLoading(AppRoute.liveAll.routeName, false);
          if (response?.data == null) return [...prev!];
          return [...prev!, ...response!.data];
        },
        failure: (_) {
          ref.setFetchMoreLoading(AppRoute.liveAll.routeName, false);
          return [...prev!];
        },
      );
    });
  }
}
