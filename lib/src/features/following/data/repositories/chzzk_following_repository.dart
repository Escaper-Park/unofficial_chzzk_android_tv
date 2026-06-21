import '../../../../core/network/network.dart';
import '../../domain/entities/following_feed.dart';
import '../../domain/entities/following_sort.dart';
import '../../domain/failures/following_failure.dart';
import '../../domain/repositories/following_repository.dart';
import '../data_sources/following_api.dart';
import '../data_sources/following_api_contract.dart';
import '../mappers/following_mapper.dart';

final class ChzzkFollowingRepository implements FollowingRepository {
  const ChzzkFollowingRepository({
    required this.api,
  });

  final FollowingApi api;

  @override
  Future<FollowingChannelPage> fetchFollowingChannels({
    int? page,
    int? size,
    FollowingChannelSort? sortType,
  }) async {
    try {
      final response = await api.getFollowingChannels(
        page: page ?? FollowingApiDefaults.channelPage,
        size: size ?? FollowingApiDefaults.channelPageSize,
        sortType: _followingChannelSortType(
          sortType ?? FollowingChannelSort.follow,
        ),
      );
      final content = response.requireContent();

      return followingChannelPageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const FollowingLoadFailure(), stackTrace);
    }
  }

  @override
  Future<FollowingLivePage> fetchFollowingLives({
    FollowingLiveSort? sortType,
  }) async {
    try {
      final response = await api.getFollowingLives(
        sortType: _followingLiveSortType(
          sortType ?? FollowingLiveSort.popular,
        ),
      );
      final content = response.requireContent();

      return followingLivePageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const FollowingLoadFailure(), stackTrace);
    }
  }
}

String _followingChannelSortType(FollowingChannelSort sort) {
  return switch (sort) {
    FollowingChannelSort.follow => FollowingApiDefaults.channelSortType,
  };
}

String _followingLiveSortType(FollowingLiveSort sort) {
  return switch (sort) {
    FollowingLiveSort.popular => FollowingApiDefaults.liveSortType,
    FollowingLiveSort.latest => 'LATEST',
    FollowingLiveSort.recommend => 'RECOMMEND',
    FollowingLiveSort.oldest => 'OLDEST',
    FollowingLiveSort.unpopular => 'UNPOPULAR',
  };
}
