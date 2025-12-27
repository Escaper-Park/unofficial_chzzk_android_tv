import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show VideoSortType;
import '../../../utils/dio/dio_client.dart';
import '../../following/model/following.dart';
import '../../following/repository/following_repository.dart';

part 'home_following_lives_controller.g.dart';

@riverpod
class HomeFollowingLivesController extends _$HomeFollowingLivesController {
  late FollowingRepository _repository;

  @override
  FutureOr<List<Following>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = FollowingRepository(dio);

    return await _fetch();
  }

  Future<List<Following>?> _fetch() async {
    final followingResponse = await _repository.getFollowingLives(
        sortType: VideoSortType.popular.value);

    return followingResponse?.followingList;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(_fetch);
  }
}
