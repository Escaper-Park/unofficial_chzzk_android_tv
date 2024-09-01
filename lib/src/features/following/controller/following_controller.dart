import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../../auth/controller/auth_controller.dart';
import '../model/following.dart';
import '../repository/following_repository.dart';

part 'following_controller.g.dart';

@riverpod
class FollowingController extends _$FollowingController {
  late FollowingRepository _repository;

  /// Get List of following channels.
  @override
  Future<List<Following>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = FollowingRepository(dio);

    final auth = await ref.watch(authControllerProvider.future);

    return auth == null ? null : await fetchFollowings();
  }

  Future<List<Following>?> fetchFollowings({
    int size = 505,
    int page = 0,
  }) async {
    final FollowingResponse? response =
        await _repository.getFollowingResponse(size: size, page: page);

    if (response != null && response.followingList.isNotEmpty) {
      // copyWith
      List<Following>? followingList = List.from(response.followingList);

      // sort by concurrentUserCount
      followingList.sort((a, b) => b.liveInfo.concurrentUserCount
          .compareTo(a.liveInfo.concurrentUserCount));

      return followingList;
    }

    return null;
  }
}

@riverpod
class FollowingLivesController extends _$FollowingLivesController {
  late FollowingRepository _repository;

  /// Get List of following channel's live streams.
  ///
  /// [Following] has [LiveInfo].
  @override
  FutureOr<List<Following>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = FollowingRepository(dio);

    return await fetchFollowingLives();
  }

  Future<List<Following>?> fetchFollowingLives() async {
    final followingResponse = await _repository.getFollowingLives();

    return followingResponse?.followingList;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        return await fetchFollowingLives();
      },
    );
  }
}
