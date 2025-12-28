import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show VideoSortType;
import '../../live/model/live_info.dart';
import '../../live/repository/live_repository_wrapper.dart';

part 'home_popular_lives_controller.g.dart';

@riverpod
class HomePopularLivesController extends _$HomePopularLivesController {
  late LiveRepositoryWrapper _repository;

  @override
  FutureOr<List<LiveInfo>?> build() async {
    _repository = ref.watch(liveRepositoryWrapperProvider);

    return await _fetch();
  }

  Future<List<LiveInfo>?> _fetch() async {
    final result = await _repository.getLiveResponse(
      size: 20,
      sortType: VideoSortType.popular.value,
      concurrentUserCount: null,
      liveId: null,
    );

    return result.when(
      success: (response) => response?.data,
      failure: (_) => null,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(_fetch);
  }
}
