class APIUrl {
  static const String _chzzkAPIUrl = 'https://api.chzzk.naver.com';
  static const String _naverGameUrl =
      'https://comm-api.game.naver.com/nng_main';

  static const String naverLogin =
      'https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fchzzk.naver.com%2F&locale=ko_KR&svctype=1';

  static const String naverQRLogin =
      'https://nid.naver.com/nidlogin.login?mode=qrcode&url=https%3A%2F%2Fchzzk.naver.com%2F&locale=ko_KR&svctype=1';

  static String channel(String channelId) =>
      '$_chzzkAPIUrl/service/v1/channels/$channelId';

  static String liveDetail(String channelId) =>
      '$_chzzkAPIUrl/service/v2/channels/$channelId/live-detail';

  static String liveStatus(String channelId) =>
      '$_chzzkAPIUrl/service/v2/channels/$channelId/live-status';

  static String user() => '$_naverGameUrl/v1/user/getUserStatus';

  static String following({int size = 10, int page = 0}) =>
      '$_chzzkAPIUrl/service/v1/channels/followings?size=$size&page=$page';

  static String followingLiveChannels() =>
      '$_chzzkAPIUrl/service/v1/channels/followings/live';

  static String vodList(
    String channelId, {
    int size = 18,
    int page = 0,
    String sortType = 'LATEST',
  }) =>
      '$_chzzkAPIUrl/service/v1/channels/$channelId/videos?sortType=$sortType&pagingType=PAGE&page=$page&size=$size';

  static String vod(int videoNo) => '$_chzzkAPIUrl/service/v2/videos/$videoNo';

  static String vodXML(String videoId, String inKey) =>
      'https://apis.naver.com/neonplayer/vodplay/v1/playback/$videoId?key=$inKey';

  static String searchChannel(
    String keyword, {
    int offset = 0,
    int size = 13,
    bool withFirstChannelContent = false,
  }) =>
      '$_chzzkAPIUrl/service/v1/search/channels?keyword=$keyword&offset=$offset&size=$size&withFirstChannelContent=$withFirstChannelContent';

  static String popularLive({
    required int? concurrentUserCount,
    required int? liveId,
    int size = 20,
  }) {
    if (concurrentUserCount == null || liveId == null) {
      return '$_chzzkAPIUrl/service/v1/lives?size=$size&sortType=POPULAR';
    } else {
      return '$_chzzkAPIUrl/service/v1/lives?concurrentUserCount=$concurrentUserCount&liveId=$liveId&sortType=POPULAR';
    }
  }

  static String recommendataionChannels() =>
      '$_chzzkAPIUrl/service/v1/home/recommendation-channels';

  static String categories({
    required int? concurrentUserCount,
    required int? openLiveCount,
    required String? categoryId,
    int size = 20,
  }) {
    if (categoryId == null ||
        concurrentUserCount == null ||
        openLiveCount == null) {
      return '$_chzzkAPIUrl/service/v1/categories/live?size=$size';
    } else {
      return '$_chzzkAPIUrl/service/v1/categories/live?categoryId=$categoryId&concurrentUserCount=$concurrentUserCount&openLiveCount=$openLiveCount&size=$size';
    }
  }

  static String categoryLives({
    required String categoryType,
    required String categoryId,
    required int? concurrentUserCount,
    required int? liveId,
  }) {
    if (concurrentUserCount == null || liveId == null) {
      return '$_chzzkAPIUrl/service/v2/categories/$categoryType/$categoryId/lives?';
    } else {
      return '$_chzzkAPIUrl/service/v2/categories/$categoryType/$categoryId/lives?concurrentUserCount=$concurrentUserCount&liveId=$liveId';
    }
  }

  static String categoryVods({
    required String categoryType,
    required String categoryId,
    required int? publishDateAt,
    required int? readCount,
  }) {
    if (publishDateAt == null || readCount == null) {
      return '$_chzzkAPIUrl/service/v2/categories/$categoryType/$categoryId/videos?';
    } else {
      return '$_chzzkAPIUrl/service/v2/categories/$categoryType/$categoryId/videos?publishDateAt=$publishDateAt&readCount=$readCount';
    }
  }

  static String categoryInfo({
    required String categoryTypeAndId,
  }) =>
      '$_chzzkAPIUrl/service/v1/categories/$categoryTypeAndId/info';

  static String chatServer(int serverNo) =>
      'wss://kr-ss$serverNo.chat.naver.com/chat';
}
