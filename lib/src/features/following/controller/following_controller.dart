import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';

import '../model/following.dart';
import '../model/following_response.dart';

import '../repository/following_repository.dart';
import '../../channel/repository/channel_repository.dart';

part 'following_controller.g.dart';

@Riverpod(keepAlive: true)
class FollowingController extends _$FollowingController {
  late FollowingRepository _followingRepository;
  late ChannelRepository _channelRepository;

  @override
  FutureOr<List<Following>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _followingRepository = FollowingRepository(dio);
    _channelRepository = ChannelRepository(dio);

    return await _fetch();
  }

  Future<List<Following>?> _fetch({
    int size = 505,
    int page = 0,
  }) async {
    final FollowingResponse? response =
        await _followingRepository.getFollowings(
      size: size,
      page: page,
    );

    if (response != null && response.followingList.isNotEmpty) {
      List<Following>? followingList = List.from(response.followingList);

      // sort by concurrentUserCount
      followingList.sort(
        (a, b) => b.liveInfo.concurrentUserCount
            .compareTo(a.liveInfo.concurrentUserCount),
      );

      return followingList;
    }

    return null;
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
    // follow
    final res = await _channelRepository
        .follow(channelId: channelId)
        .then((_) => true)
        .catchError((_) => false);

    // remove notification
    if (res) {
      await _channelRepository.deleteNotification(channelId: channelId);
    }

    return res;
  }

  /// UnFollow channel
  Future<bool> _unFollow(String channelId) async {
    // unFollow
    final res = await _channelRepository
        .unFollow(channelId: channelId)
        .then((_) => true)
        .catchError((e) {
      return false;
    });

    return res;
  }
}
