import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show VideoSortType;
import '../../following/model/following.dart';
import '../../following/repository/following_repository_wrapper.dart';

part 'home_following_lives_controller.g.dart';

@riverpod
class HomeFollowingLivesController extends _$HomeFollowingLivesController {
  late FollowingRepositoryWrapper _repository;

  @override
  FutureOr<List<Following>?> build() async {
    _repository = ref.watch(followingRepositoryWrapperProvider);

    return await _fetch();
  }

  Future<List<Following>?> _fetch() async {
    final result = await _repository.getFollowingLives(
      sortType: VideoSortType.popular.value,
    );

    return result.when(
      success: (response) => response?.followingList,
      failure: (_) => null,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(_fetch);
  }
}
