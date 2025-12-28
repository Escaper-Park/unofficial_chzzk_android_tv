import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show AppRoute;
import '../../../utils/extensions/custom_extensions.dart';
import '../model/watching_history.dart';
import '../model/watching_history_response.dart';
import '../repository/watching_history_repository_wrapper.dart';

part 'watching_history_controller.g.dart';

@riverpod
class WatchingHistoryController extends _$WatchingHistoryController {
  late WatchingHistoryRepositoryWrapper _repository;

  WatchingHistoryNext? _next;

  @override
  FutureOr<List<WatchingHistory>?> build() async {
    _repository = ref.watch(watchingHistoryRepositoryWrapperProvider);

    return await _fetch();
  }

  Future<List<WatchingHistory>?> _fetch() async {
    final result = await _repository.getWatchingHistories(
      size: 20,
      lastTime: null,
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

    ref.setFetchMoreLoading(AppRoute.vodAll.routeName, true);
    final prev = state.value;

    state = await AsyncValue.guard(() async {
      final result = await _repository.getWatchingHistories(
        size: 20,
        lastTime: _next!.lastTime,
      );

      return result.when(
        success: (response) {
          _next = response?.page?.next;

          if (response?.data == null) return [...prev!];

          ref.setFetchMoreLoading(AppRoute.vodAll.routeName, false);
          return [...prev!, ...response!.data];
        },
        failure: (_) {
          ref.setFetchMoreLoading(AppRoute.vodAll.routeName, false);
          return [...prev!];
        },
      );
    });
  }
}
