import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show AppRoute;
import '../../../utils/extensions/custom_extensions.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/watching_history.dart';
import '../model/watching_history_response.dart';
import '../repository/watching_history_repository.dart';

part 'watching_history_controller.g.dart';

@riverpod
class WatchingHistoryController extends _$WatchingHistoryController {
  late WatchingHistoryRepository _repository;

  WatchingHistoryNext? _next;

  @override
  FutureOr<List<WatchingHistory>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = WatchingHistoryRepository(dio);

    return await _fetch();
  }

  Future<List<WatchingHistory>?> _fetch() async {
    final response = await _repository.getWatchingHistories(
      size: 20,
      lastTime: null,
    );

    _next = response?.page?.next;

    return response?.data;
  }

  Future<void> fetchMore() async {
    if (_next == null) return;

    ref.setFetchMoreLoading(AppRoute.vodAll.routeName, true);
    final prev = state.value;

    state = await AsyncValue.guard(() async {
      final response = await _repository.getWatchingHistories(
        size: 20,
        lastTime: _next!.lastTime,
      );

      _next = response?.page?.next;

      if (response?.data == null) return [...prev!];

      ref.setFetchMoreLoading(AppRoute.vodAll.routeName, false);
      return [...prev!, ...response!.data];
    });
  }
}
