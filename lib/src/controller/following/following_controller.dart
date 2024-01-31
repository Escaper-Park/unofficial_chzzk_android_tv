import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/channel/channel.dart';
import '../../model/following/following.dart';
import '../../model/live/live.dart';
import '../../service/following/following_repository.dart';
import '../../service/live/live_repository.dart';
import '../auth/auth_controller.dart';

part 'following_controller.g.dart';

@riverpod
class FollowingController extends _$FollowingController {
  Options? _options;

  @override
  FutureOr<List<Following>?> build() {
    final auth = ref.watch(authControllerProvider).value;

    _options = auth?.getOptions();

    return _options == null ? null : fetchFollowings();
  }

  Future<List<Following>?> fetchFollowings() async {
    if (_options != null) {
      List<Following>? followings = await ref
          .watch(followingRepositoryProvider)
          .getFollowingChannels(options: _options);

      if (followings != null && followings.isNotEmpty) {
        followings.shuffle();

        followings.sort((a, b) => b.liveInfo.concurrentUserCount
            .compareTo(a.liveInfo.concurrentUserCount));

        return followings;
      }
    }

    return null;
  }
}

@riverpod
class FollowingLivesController extends _$FollowingLivesController {
  Options? _options;

  @override
  FutureOr<List<LiveDetail>?> build() async {
    final auth = ref.watch(authControllerProvider).value;

    _options = auth?.getOptions();

    return fetchFollowingLiveChannels();
  }

  Future<List<LiveDetail>?> fetchFollowingLiveChannels() async {
    if (_options != null) {
      final List<Following>? followings = await ref
          .watch(followingRepositoryProvider)
          .getFollowingsLiveChannels(options: _options);

      if (followings != null) {
        final List<Channel> channels =
            followings.map((follow) => follow.channel).toList();

        return await ref.watch(liveRepositoryProvider).getLiveDetails(
              channels: channels,
              options: _options,
            );
      }
    }

    return null;
  }
}

@riverpod
class CurrentFollowingChannelController
    extends _$CurrentFollowingChannelController {
  @override
  Following? build() {
    return null;
  }

  void setCurrentFollowingChannel(Following following) {
    state = following;
  }
}
