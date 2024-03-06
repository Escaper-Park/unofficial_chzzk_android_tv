import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/controller/auth_controller.dart';
import '../model/following.dart';
import '../repository/following_repository.dart';

part 'following_controller.g.dart';

@riverpod
class FollowingController extends _$FollowingController {
  Options? _options;

  @override
  FutureOr<List<Following>?> build() async {
    final auth = await ref.watch(authControllerProvider.future);

    _options = auth?.getOptions();

    return _options == null ? null : await fetchFollowingChannels();
  }

  Future<List<Following>?> fetchFollowingChannels() async {
    if (_options != null) {
      List<Following>? followings = await ref
          .watch(followingRepositoryProvider)
          .getFollowingChannels(options: _options);

      if (followings != null && followings.isNotEmpty) {
        followings.shuffle();

        // Sort by concurrentUserCount
        followings.sort((a, b) => b.liveInfo.concurrentUserCount
            .compareTo(a.liveInfo.concurrentUserCount));

        return followings;
      }
    }

    return null;
  }
}
