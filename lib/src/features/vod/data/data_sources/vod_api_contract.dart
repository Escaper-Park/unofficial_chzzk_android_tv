abstract final class VodApiPaths {
  static const vods = '/service/v1/home/videos';
  static const followingVods = '/service/v2/home/following/videos';
  static const vodDetail = '/service/v3/videos/{videoNo}';
  static const watchEvent = '/polling/v1/watch-event/video';
  static const playback = '/neonplayer/vodplay/v3/playback/{videoId}';
}

abstract final class VodApiPathKeys {
  static const videoNo = 'videoNo';
  static const videoId = 'videoId';
}

abstract final class VodApiQueryKeys {
  static const size = 'size';
  static const sortType = 'sortType';
  static const publishDateAt = 'publishDateAt';
  static const readCount = 'readCount';
  static const nextNo = 'nextNo';
  static const key = 'key';
  static const sid = 'sid';
  static const deviceType = 'devt';
  static const status = 'st';
  static const locale = 'lc';
  static const captionLocale = 'cpl';
}

abstract final class VodWatchEventRequestKeys {
  static const channelId = 'channelId';
  static const videoNo = 'videoNo';
  static const payload = 'payload';
  static const totalLength = 'totalLength';
  static const watchEventType = 'watchEventType';
  static const awt = 'awt';
  static const positionAt = 'positionAt';
  static const sessionId = 'sessionId';
  static const duration = 'duration';
}

abstract final class VodApiDefaults {
  static const browsePageSize = 18;
  static const sortTypePopular = 'POPULAR';
  static const sortTypeLatest = 'LATEST';
  static const playbackSid = '2099';
  static const playbackDeviceType = 'html5_pc';
  static const playbackStatus = '13';
  static const playbackLocale = 'ko_KR';
  static const playbackCaptionLocale = 'ko_KR';
}
