abstract final class LiveApiPaths {
  static const lives = '/service/v1/lives';
  static const liveStatus = '/polling/v3.1/channels/{channelId}/live-status';
  static const liveDetail = '/service/v3.3/channels/{channelId}/live-detail';
  static const watchEvent = '/polling/v1/watch-event/live';
}

abstract final class LiveApiPathKeys {
  static const channelId = 'channelId';
}

abstract final class LiveApiQueryKeys {
  static const size = 'size';
  static const sortType = 'sortType';
  static const concurrentUserCount = 'concurrentUserCount';
  static const liveId = 'liveId';
  static const includePlayerRecommendContent = 'includePlayerRecommendContent';
  static const dt = 'dt';
  static const cu = 'cu';
  static const tm = 'tm';
}

abstract final class LiveApiDefaults {
  static const browsePageSize = 18;
  static const homePopularSize = 20;
  static const sortTypePopular = 'POPULAR';
  static const sortTypeLatest = 'LATEST';
  static const includePlayerRecommendContent = false;
  static const liveDetailCu = false;
  static const liveDetailTm = true;
  static const liveDetailDtBase = 100000;
  static const liveDetailDtRange = 100000;
}

abstract final class LiveWatchEventRequestKeys {
  static const channelId = 'channelId';
  static const liveId = 'liveId';
  static const payload = 'payload';
  static const watchEventType = 'watchEventType';
  static const sessionId = 'sessionId';
  static const duration = 'duration';
  static const positionAt = 'positionAt';
  static const awt = 'awt';
  static const liveTokens = 'liveTokens';
  static const autoPlay = 'autoPlay';
  static const radioMode = 'radioMode';
}

abstract final class LiveWatchEventHeaderKeys {
  static const scene = 'scene';
}

abstract final class LiveWatchEventHeaderValues {
  static const liveEndScene = '25';
}
