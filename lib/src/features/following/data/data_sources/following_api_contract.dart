abstract final class FollowingApiPaths {
  static const channels = '/service/v1/channels/followings';
  static const lives = '/service/v1/channels/following-lives';
}

abstract final class FollowingApiQueryKeys {
  static const page = 'page';
  static const size = 'size';
  static const sortType = 'sortType';
}

abstract final class FollowingApiDefaults {
  static const channelPage = 0;
  static const channelPageSize = 505;
  static const channelSortType = 'FOLLOW';
  static const liveSortType = 'POPULAR';
}
