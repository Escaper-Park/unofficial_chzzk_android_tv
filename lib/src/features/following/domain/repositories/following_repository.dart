import '../entities/following_feed.dart';
import '../entities/following_sort.dart';

abstract interface class FollowingRepository {
  Future<FollowingChannelPage> fetchFollowingChannels({
    int? page,
    int? size,
    FollowingChannelSort? sortType,
  });

  Future<FollowingLivePage> fetchFollowingLives({
    FollowingLiveSort? sortType,
  });
}
