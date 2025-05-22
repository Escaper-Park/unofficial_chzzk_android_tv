import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../../common/constants/enums.dart' show AppRoute, VideoSortType;
import '../../../utils/dio/dio_client.dart';
import '../../live/model/live_info.dart';
import '../../live/model/live_response.dart';
import '../../live/repository/live_repository.dart';

part 'live_all_controller.g.dart';

@riverpod
class LiveAllController extends _$LiveAllController {
  late LiveRepository _repository;

  LiveNext? _next;

  @override
  FutureOr<List<LiveInfo>?> build({required VideoSortType sortType}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = LiveRepository(dio);

    return await _fetch();
  }

  Future<List<LiveInfo>?> _fetch() async {
    final response = await _repository.getLiveResponse(
      size: 18,
      sortType: sortType.value,
      concurrentUserCount: null,
      liveId: null,
    );

    _next = response?.page?.next;

    return response?.data;
  }

  Future<void> fetchMore() async {
    if (_next == null) return;

    ref.setFetchMoreLoading(AppRoute.liveAll.routeName, true);
    final prev = state.value;

    state = await AsyncValue.guard(() async {
      final response = await _repository.getLiveResponse(
        size: 18,
        sortType: sortType.value,
        concurrentUserCount: _next!.concurrentUserCount,
        liveId: _next!.liveId,
      );

      _next = response?.page?.next;

      if (response?.data == null) return [...prev!];

      ref.setFetchMoreLoading(AppRoute.liveAll.routeName, false);
      return [...prev!, ...response!.data];
    });
  }
}
