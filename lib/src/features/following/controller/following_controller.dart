import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/exceptions/exceptions.dart';
import '../../channel/repository/channel_repository_wrapper.dart';
import '../model/following.dart';
import '../repository/following_repository_wrapper.dart';

part 'following_controller.g.dart';

@Riverpod(keepAlive: true)
class FollowingController extends _$FollowingController {
  @override
  FutureOr<List<Following>?> build() async {
    return await _fetch();
  }

  Future<List<Following>?> _fetch({
    int size = 505,
    int page = 0,
  }) async {
    final wrapper = ref.read(followingRepositoryWrapperProvider);
    final result = await wrapper.getFollowings(size: size, page: page);

    return result.when(
      success: (response) {
        if (response != null && response.followingList.isNotEmpty) {
          List<Following> followingList = List.from(response.followingList);

          // sort by concurrentUserCount
          followingList.sort(
            (a, b) => b.liveInfo.concurrentUserCount
                .compareTo(a.liveInfo.concurrentUserCount),
          );

          return followingList;
        }

        return null;
      },
      failure: (exception) {
        // Debug logging
        assert(() {
          print('FollowingController._fetch error: ${exception.message}');
          return true;
        }());

        // AuthException means not logged in - return null (expected state)
        if (exception is AuthException) {
          return null;
        }

        return null;
      },
    );
  }

  Future<void> toggleFollow({
    required bool isFollowing,
    required String channelId,
  }) async {
    if (state.value == null) return;

    final success =
        isFollowing ? await _unFollow(channelId) : await _follow(channelId);

    if (!success) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_fetch);
  }

  /// Follow channel and remove notification.
  Future<bool> _follow(String channelId) async {
    final wrapper = ref.read(channelRepositoryWrapperProvider);

    // follow
    final followResult = await wrapper.follow(channelId: channelId);

    return followResult.when(
      success: (_) async {
        // remove notification on success
        await wrapper.deleteNotification(channelId: channelId);
        return true;
      },
      failure: (exception) {
        // Debug logging
        assert(() {
          print('FollowingController._follow error: ${exception.message}');
          return true;
        }());
        return false;
      },
    );
  }

  /// UnFollow channel
  Future<bool> _unFollow(String channelId) async {
    final wrapper = ref.read(channelRepositoryWrapperProvider);

    final result = await wrapper.unFollow(channelId: channelId);

    return result.when(
      success: (_) => true,
      failure: (exception) {
        // Debug logging
        assert(() {
          print('FollowingController._unFollow error: ${exception.message}');
          return true;
        }());
        return false;
      },
    );
  }
}
