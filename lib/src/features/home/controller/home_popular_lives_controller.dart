import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show VideoSortType;
import '../../../utils/dio/dio_client.dart';
import '../../live/model/live_info.dart';
import '../../live/repository/live_repository.dart';

part 'home_popular_lives_controller.g.dart';

@riverpod
class HomePopularLivesController extends _$HomePopularLivesController {
  late LiveRepository _repository;

  @override
  FutureOr<List<LiveInfo>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = LiveRepository(dio);

    return await _fetch();
  }

  Future<List<LiveInfo>?> _fetch() async {
    final response = await _repository.getLiveResponse(
      size: 20,
      sortType: VideoSortType.popular.value,
      concurrentUserCount: null,
      liveId: null,
    );

    return response?.data;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(_fetch);
  }
}
