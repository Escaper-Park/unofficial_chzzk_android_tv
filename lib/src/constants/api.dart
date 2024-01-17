class APIUrl {
  static const String _chzzkAPIUrl = 'https://api.chzzk.naver.com';
  static const String _naverGameUrl =
      'https://comm-api.game.naver.com/nng_main';
  static const String naverLogin =
      'https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fchzzk.naver.com%2F&locale=ko_KR&svctype=1';

  static const String recommendataionChannels =
      '$_chzzkAPIUrl/service/v1/home/recommendation-channels';

  static String channel(String channelId) =>
      '$_chzzkAPIUrl/service/v1/channels/$channelId';

  static String liveStatus(String channelId) =>
      '$_chzzkAPIUrl/polling/v2/channels/$channelId/live-status';

  static String liveDetail(String channelId) =>
      '$_chzzkAPIUrl/service/v2/channels/$channelId/live-detail';

  static const String user = '$_naverGameUrl/v1/user/getUserStatus';

  static String followingList({int size = 100, int page = 0}) =>
      '$_chzzkAPIUrl/service/v1/channels/followings?size=$size&page=$page';

  static const String liveFollowingList =
      '$_chzzkAPIUrl/service/v1/channels/followings/live';

  static String videoList(String channelId, {int size = 50, int page = 0}) =>
      '$_chzzkAPIUrl/service/v1/channels/$channelId/videos?sortType=LATEST&pagingType=PAGE&page=$page&size=$size';

  static String video(int videoNo) =>
      '$_chzzkAPIUrl/service/v2/videos/$videoNo';

  static String vodXML(String videoId, String inKey) =>
      'https://apis.naver.com/neonplayer/vodplay/v1/playback/$videoId?key=$inKey';

  static String searchChannel(String keyword,
          {int offset = 0,
          int size = 13,
          bool withFirstChannelContent = false}) =>
      '$_chzzkAPIUrl/service/v1/search/channels?keyword=$keyword&offset=$offset&size=$size&withFirstChannelContent=$withFirstChannelContent';

  static const String popularChannelList =
      '$_chzzkAPIUrl/service/v1/lives?sortType=POPULAR';
  // Future works.
  /// Use it with headers['cookie'] when your status is 'LOGIN_USER'.
  ///
  /// post: follow, delete: unfollow
  // static String follow(String channelId) =>
  //     '$_chzzkAPIUrl/service/v1/channels/$channelId/follow';
}
