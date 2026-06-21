abstract final class ChannelApiPaths {
  static const channel = '/service/v1/channels/{channelId}';
  static const myInfo = '/service/v1.1/channels/{channelId}/my-info';
  static const channelFollow = '/service/v1/channels/{channelId}/follow';
  static const channelVideos = '/service/v1/channels/{channelId}/videos';
  static const channelNotification =
      '/service/v1/channels/{channelId}/notification';
}

abstract final class ChannelApiPathKeys {
  static const channelId = 'channelId';
}

abstract final class ChannelApiQueryKeys {
  static const sortType = 'sortType';
  static const pagingType = 'pagingType';
  static const page = 'page';
  static const size = 'size';
  static const publishDateAt = 'publishDateAt';
  static const videoType = 'videoType';
}

abstract final class ChannelApiDefaults {
  static const videoSortTypeLatest = 'LATEST';
  static const videoSortTypePopular = 'POPULAR';
  static const videoPagingTypePage = 'PAGE';
  static const videoPage = 0;
  static const videoPageSize = 18;
  static const latestVideoPreviewSize = 10;
  static const publishDateAt = '';
  static const videoType = '';
}
